// Logika inti Try Out. Semua waktu dihitung server.
// Vercel serverless tidak punya penjadwal di latar belakang, jadi subtes yang waktunya
// habis ditutup "malas": setiap permintaan try out memanggil tutupKedaluwarsa lebih dulu.
const supabase = require('../config/supabase');
const { Galat } = require('../utils/galat');
const { periksa } = require('../utils/bantu');
const { hitungSkorSubtes, rataRata } = require('../utils/skor');

const batasAt = (mulaiAt, durasiMenit) => new Date(new Date(mulaiAt).getTime() + Number(durasiMenit) * 60000);

// Subtes yang ada di sebuah try out, urut menurut subtes.urutan
async function subtesDiTryOut(tryOutId) {
  const v = periksa(await supabase.from('v_try_out_subtes').select('subtes_id, jumlah_soal').eq('try_out_id', tryOutId));
  if (v.length === 0) return [];
  const jumlah = new Map(v.map((r) => [r.subtes_id, r.jumlah_soal]));
  const subtes = periksa(
    await supabase.from('subtes').select('id, nama, kelompok, urutan, durasi_menit').in('id', [...jumlah.keys()]).order('urutan')
  );
  return subtes.map((s) => ({ ...s, durasi_menit: Number(s.durasi_menit), jumlah_soal: jumlah.get(s.id) }));
}

// Menutup satu subtes: menilai jawaban, menghitung skor, dan menutup sesi bila ini subtes terakhir.
async function tutupSubtes(sesi, subtesId, waktuSelesai) {
  const materi = periksa(await supabase.from('materi').select('id').eq('subtes_id', subtesId));
  const soal = periksa(
    await supabase.from('soal').select('id, kesulitan').eq('try_out_id', sesi.try_out_id).in('materi_id', materi.map((m) => m.id))
  );
  const soalIds = soal.map((s) => s.id);

  const [kunci, jawaban] = await Promise.all([
    supabase.from('opsi').select('soal_id, id').in('soal_id', soalIds).eq('is_benar', true),
    supabase.from('jawaban').select('id, soal_id, opsi_id').eq('sesi_id', sesi.id).in('soal_id', soalIds),
  ]);
  const kunciPerSoal = new Map(periksa(kunci).map((k) => [k.soal_id, k.id]));

  const benarIds = [];
  const salahIds = [];
  const soalBenar = new Set();
  for (const j of periksa(jawaban)) {
    if (j.opsi_id == null) continue; // dikosongkan: tidak dinilai
    if (j.opsi_id === kunciPerSoal.get(j.soal_id)) {
      benarIds.push(j.id);
      soalBenar.add(j.soal_id);
    } else {
      salahIds.push(j.id);
    }
  }
  if (benarIds.length) periksa(await supabase.from('jawaban').update({ is_benar: true }).in('id', benarIds));
  if (salahIds.length) periksa(await supabase.from('jawaban').update({ is_benar: false }).in('id', salahIds));

  const skor = hitungSkorSubtes(soal, soalBenar);
  // Syarat selesai_at kosong: bila dua permintaan menutup berbarengan, hanya satu yang berhasil
  periksa(
    await supabase
      .from('sesi_subtes')
      .update({ selesai_at: waktuSelesai, skor })
      .eq('sesi_id', sesi.id)
      .eq('subtes_id', subtesId)
      .is('selesai_at', null)
      .select()
  );

  await tutupSesiBilaSemuaSelesai(sesi);
}

async function tutupSesiBilaSemuaSelesai(sesi) {
  const semua = await subtesDiTryOut(sesi.try_out_id);
  const rows = periksa(await supabase.from('sesi_subtes').select('subtes_id, selesai_at, skor').eq('sesi_id', sesi.id));
  const selesai = rows.filter((r) => r.selesai_at);
  if (semua.length === 0 || selesai.length < semua.length) return false;
  const terakhir = selesai.map((r) => r.selesai_at).sort().pop();
  periksa(
    await supabase
      .from('sesi')
      .update({ selesai_at: terakhir, skor: rataRata(selesai.map((r) => Number(r.skor))) })
      .eq('id', sesi.id)
      .is('selesai_at', null)
  );
  return true;
}

// Tutup semua subtes yang batas waktunya sudah lewat (selesai_at diisi dengan batasnya, bukan "sekarang")
async function tutupKedaluwarsa(sesi) {
  const berjalan = periksa(
    await supabase.from('sesi_subtes').select('subtes_id, mulai_at').eq('sesi_id', sesi.id).is('selesai_at', null)
  );
  if (berjalan.length === 0) return;
  const subtes = periksa(await supabase.from('subtes').select('id, durasi_menit').in('id', berjalan.map((b) => b.subtes_id)));
  const durasi = new Map(subtes.map((s) => [s.id, s.durasi_menit]));
  for (const b of berjalan) {
    const batas = batasAt(b.mulai_at, durasi.get(b.subtes_id));
    if (Date.now() >= batas.getTime()) await tutupSubtes(sesi, b.subtes_id, batas.toISOString());
  }
}

const KOLOM_SESI = 'id, profil_id, jenis, try_out_id, mulai_at, selesai_at, skor';

// Ambil sesi try out milik pengguna, setelah menutup subtes yang kedaluwarsa
async function sesiTryOutMilik(sesiId, userId) {
  let sesi = periksa(await supabase.from('sesi').select(KOLOM_SESI).eq('id', sesiId).maybeSingle());
  if (!sesi || sesi.jenis !== 'try_out') throw new Galat('TIDAK_DITEMUKAN', 'Sesi try out tidak ditemukan.');
  if (sesi.profil_id !== userId) throw new Galat('BUKAN_PEMILIK', 'Sesi ini bukan milik Anda.');
  if (!sesi.selesai_at) {
    await tutupKedaluwarsa(sesi);
    sesi = periksa(await supabase.from('sesi').select(KOLOM_SESI).eq('id', sesiId).single());
  }
  return sesi;
}

module.exports = { batasAt, subtesDiTryOut, tutupSubtes, tutupKedaluwarsa, sesiTryOutMilik, KOLOM_SESI };
