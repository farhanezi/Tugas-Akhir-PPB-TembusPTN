const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { idParam, periksa } = require('../utils/bantu');
const tryOut = require('./tryOutController');

// GET /api/sesi/:id/hasil  (latihan dan try out)
exports.hasil = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const sesi = periksa(
    await supabase.from('sesi').select('id, profil_id, jenis, pengaturan, mulai_at, selesai_at').eq('id', sesiId).maybeSingle()
  );
  if (!sesi) throw new Galat('TIDAK_DITEMUKAN', 'Sesi tidak ditemukan.');
  if (sesi.profil_id !== req.user.id) throw new Galat('BUKAN_PEMILIK', 'Sesi ini bukan milik Anda.');
  if (sesi.jenis === 'try_out') return res.json(await tryOut.hasil(sesiId, req.user.id));
  if (!sesi.selesai_at) throw new Galat('TIDAK_DITEMUKAN', 'Hasil baru tersedia setelah sesi selesai.');

  const { soal_ids: soalIds, ...pengaturan } = sesi.pengaturan;

  const [soalRows, jawabanRows] = await Promise.all([
    supabase
      .from('soal')
      .select('id, pertanyaan, gambar_url, pembahasan, wacana:wacana_id (isi), materi:materi_id (id, nama), opsi (id, label, isi, is_benar)')
      .in('id', soalIds),
    supabase.from('jawaban').select('soal_id, opsi_id, is_benar').eq('sesi_id', sesiId),
  ]);
  const peta = new Map(periksa(soalRows).map((s) => [s.id, s]));
  const jwb = new Map(periksa(jawabanRows).map((j) => [j.soal_id, j]));

  let benar = 0;
  let salah = 0;
  const perMateri = new Map();
  const soal = soalIds.map((id, i) => {
    const s = peta.get(id);
    const j = jwb.get(id);
    if (j) {
      j.is_benar ? benar++ : salah++;
      const m = perMateri.get(s.materi.id) || { materi_id: s.materi.id, nama: s.materi.nama, benar: 0, salah: 0 };
      j.is_benar ? m.benar++ : m.salah++;
      perMateri.set(s.materi.id, m);
    }
    return {
      id,
      nomor: i + 1,
      pertanyaan: s.pertanyaan,
      gambar_url: s.gambar_url,
      wacana: s.wacana ? s.wacana.isi : null,
      materi: s.materi,
      opsi: [...s.opsi].sort((a, b) => a.label.localeCompare(b.label)),
      jawaban_opsi_id: j ? j.opsi_id : null,
      benar: j ? j.is_benar : null,
      pembahasan: s.pembahasan,
    };
  });

  const dijawab = benar + salah;
  res.json({
    sesi_id: sesiId,
    jenis: 'latihan',
    pengaturan, // dipakai tombol "Latihan lagi"
    benar,
    salah,
    belum_dijawab: soalIds.length - dijawab,
    akurasi: dijawab ? Math.round((benar / dijawab) * 100) : null,
    durasi_detik: Math.max(0, Math.round((new Date(sesi.selesai_at) - new Date(sesi.mulai_at)) / 1000)),
    // materi yang paling banyak salah di sesi ini (hanya yang ada salahnya)
    materi_lemah: [...perMateri.values()].filter((m) => m.salah > 0).sort((a, b) => b.salah - a.salah),
    soal,
  });
});
