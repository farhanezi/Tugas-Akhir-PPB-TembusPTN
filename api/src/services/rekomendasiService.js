// "Materi terlemah" dihitung dari semua jawaban yang sudah dinilai (latihan dan try out),
// per pasangan (subtes, materi). Aturan: butuh minimal MIN_JAWABAN jawaban agar dianggap bermakna.
const supabase = require('../config/supabase');
const { periksa, materiSelesai, stokLatihan } = require('../utils/bantu');

const MIN_JAWABAN = 5;
const MAKS_MATERI = 3;
const MAKS_SUBTES = 2;
const AMBANG_LEMAH = 80; // akurasi (%) di bawah ini dianggap lemah

const persen = (benar, total) => Math.round((benar / total) * 100);

// Ambil yang akurasinya di bawah ambang (maks n). Bila tidak ada yang lemah, tetap kembalikan
// satu yang terendah supaya pengguna selalu punya saran berikutnya. Daftar sudah terurut naik.
function pilihTerlemah(urut, n) {
  const lemah = urut.filter((x) => x.akurasi < AMBANG_LEMAH).slice(0, n);
  return lemah.length > 0 ? lemah : urut.slice(0, 1);
}

async function hitungRekomendasi(userId) {
  const [stat, materi, subtes, selesai, stok] = await Promise.all([
    supabase.rpc('statistik_materi', { p_profil: userId }),
    supabase.from('materi').select('id, nama, urutan, subtes_id').order('urutan').order('id'),
    supabase.from('subtes').select('id, nama, urutan').order('urutan'),
    materiSelesai(userId),
    stokLatihan(),
  ]);
  const materiList = periksa(materi);
  const subtesList = periksa(subtes);
  const infoMateri = new Map(materiList.map((m) => [m.id, m]));
  const infoSubtes = new Map(subtesList.map((s) => [s.id, s]));

  // gabungkan per materi dan per subtes
  const perMateri = [];
  const perSubtes = new Map();
  for (const r of periksa(stat)) {
    const m = infoMateri.get(r.materi_id);
    if (!m) continue;
    const total = r.benar + r.salah;
    perMateri.push({ m, benar: r.benar, total });
    const s = perSubtes.get(m.subtes_id) || { benar: 0, total: 0 };
    s.benar += r.benar;
    s.total += total;
    perSubtes.set(m.subtes_id, s);
  }

  const bentukMateri = (m, akurasi, jumlahJawaban) => ({
    materi_id: m.id,
    nama: m.nama,
    subtes_id: m.subtes_id,
    subtes_nama: infoSubtes.get(m.subtes_id).nama,
    akurasi,
    jumlah_jawaban: jumlahJawaban,
    selesai: selesai.has(m.id),
    jumlah_soal_latihan: stok.get(m.id) || 0,
  });

  const materiLemah = pilihTerlemah(
    perMateri
      .filter((x) => x.total >= MIN_JAWABAN)
      .map((x) => ({ ...x, akurasi: persen(x.benar, x.total) }))
      .sort((a, b) => a.akurasi - b.akurasi || b.total - a.total),
    MAKS_MATERI
  ).map((x) => bentukMateri(x.m, x.akurasi, x.total));

  const subtesLemah = pilihTerlemah(
    [...perSubtes.entries()]
      .filter(([, s]) => s.total >= MIN_JAWABAN)
      .map(([id, s]) => ({ id, nama: infoSubtes.get(id).nama, akurasi: persen(s.benar, s.total), jumlah_jawaban: s.total }))
      .sort((a, b) => a.akurasi - b.akurasi || b.jumlah_jawaban - a.jumlah_jawaban),
    MAKS_SUBTES
  );

  if (materiLemah.length > 0) return { status: 'materi', materi: materiLemah, subtes: subtesLemah, materi_umum: [] };
  if (subtesLemah.length > 0) return { status: 'subtes', materi: [], subtes: subtesLemah, materi_umum: [] };

  // Pengguna baru / data belum cukup: materi pertama dari beberapa subtes pertama yang punya materi
  const umum = [];
  const sudah = new Set();
  for (const m of materiList) {
    if (sudah.has(m.subtes_id) || !infoSubtes.has(m.subtes_id)) continue;
    sudah.add(m.subtes_id);
    umum.push({ m, urutanSubtes: infoSubtes.get(m.subtes_id).urutan });
  }
  umum.sort((a, b) => a.urutanSubtes - b.urutanSubtes);
  return {
    status: 'umum',
    materi: [],
    subtes: [],
    materi_umum: umum.slice(0, MAKS_MATERI).map((x) => bentukMateri(x.m, null, 0)),
  };
}

module.exports = { hitungRekomendasi, MIN_JAWABAN };
