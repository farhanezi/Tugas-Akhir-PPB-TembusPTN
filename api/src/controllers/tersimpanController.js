const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { idParam, periksa, pastikanProfil } = require('../utils/bantu');

// Sesi mode "akhir" yang ditinggalkan (tidak pernah selesai) dianggap usai setelah 3 jam,
// supaya kunci soal yang disimpan dari sesi itu tidak tertahan selamanya.
const BATAS_SESI_MS = 3 * 60 * 60 * 1000;
const POTONG = 200; // batas id per permintaan .in() agar URL tidak terlalu panjang

const idPositif = (n) => Number.isInteger(n) && n > 0;

function potong(arr) {
  const hasil = [];
  for (let i = 0; i < arr.length; i += POTONG) hasil.push(arr.slice(i, i + POTONG));
  return hasil;
}

// Kunci dan pembahasan ditahan selama sesi asal bermode "akhir" masih berjalan.
function sesiMasihBerjalan(sesi) {
  if (!sesi || sesi.selesai_at || sesi.pengaturan?.umpan_balik !== 'akhir') return false;
  return Date.now() - new Date(sesi.mulai_at).getTime() < BATAS_SESI_MS;
}

// GET /api/soal-tersimpan/id
exports.daftarId = bungkus(async (req, res) => {
  const rows = periksa(
    await supabase.from('soal_tersimpan').select('soal_id').eq('profil_id', req.user.id).order('disimpan_at', { ascending: false })
  );
  res.json({ soal_ids: rows.map((r) => r.soal_id) });
});

// GET /api/soal-tersimpan
exports.daftar = bungkus(async (req, res) => {
  const simpanan = periksa(
    await supabase
      .from('soal_tersimpan')
      .select('soal_id, sesi_id, disimpan_at')
      .eq('profil_id', req.user.id)
      .order('disimpan_at', { ascending: false })
  );
  if (simpanan.length === 0) return res.json({ soal: [] });

  const soalIds = simpanan.map((r) => r.soal_id);
  const sesiIds = [...new Set(simpanan.map((r) => r.sesi_id).filter(Boolean))];

  const [soalRows, sesiRows, jawabanRows] = await Promise.all([
    Promise.all(potong(soalIds).map(async (ids) => periksa(
      await supabase
        .from('soal')
        .select('id, pertanyaan, gambar_url, pembahasan, wacana:wacana_id (isi), materi:materi_id (id, nama, subtes:subtes_id (id, nama)), opsi (id, label, isi, is_benar)')
        .in('id', ids)
    ))),
    Promise.all(potong(sesiIds).map(async (ids) => periksa(
      await supabase.from('sesi').select('id, pengaturan, mulai_at, selesai_at').eq('profil_id', req.user.id).in('id', ids)
    ))),
    Promise.all(potong(sesiIds).map(async (ids) => periksa(
      await supabase.from('jawaban').select('sesi_id, soal_id, opsi_id, is_benar').in('sesi_id', ids)
    ))),
  ]);

  const petaSoal = new Map(soalRows.flat().map((s) => [s.id, s]));
  const petaSesi = new Map(sesiRows.flat().map((s) => [s.id, s]));
  const petaJawab = new Map(jawabanRows.flat().map((j) => [`${j.sesi_id}:${j.soal_id}`, j]));

  const soal = simpanan
    .filter((r) => petaSoal.has(r.soal_id))
    .map((r) => {
      const s = petaSoal.get(r.soal_id);
      const terkunci = sesiMasihBerjalan(petaSesi.get(r.sesi_id));
      const j = !terkunci && r.sesi_id ? petaJawab.get(`${r.sesi_id}:${r.soal_id}`) : null;
      const opsi = [...s.opsi]
        .sort((a, b) => a.label.localeCompare(b.label))
        .map(({ is_benar: isBenar, ...o }) => (terkunci ? o : { ...o, is_benar: isBenar }));
      return {
        id: s.id,
        pertanyaan: s.pertanyaan,
        gambar_url: s.gambar_url,
        wacana: s.wacana ? s.wacana.isi : null,
        materi: { id: s.materi.id, nama: s.materi.nama },
        subtes: s.materi.subtes ? { id: s.materi.subtes.id, nama: s.materi.subtes.nama } : null,
        opsi,
        pembahasan: terkunci ? null : s.pembahasan,
        jawaban_opsi_id: j ? j.opsi_id : null,
        benar: j ? j.is_benar : null,
        terkunci,
        disimpan_at: r.disimpan_at,
      };
    });

  res.json({ soal });
});

// POST /api/soal-tersimpan   body { soal_id, sesi_id? }   (aman dipanggil berulang)
exports.simpan = bungkus(async (req, res) => {
  const { soal_id: soalId, sesi_id: sesiId = null } = req.body || {};
  if (!idPositif(soalId)) throw new Galat('VALIDASI', 'soal_id wajib berupa angka.');
  if (sesiId !== null && !idPositif(sesiId)) throw new Galat('VALIDASI', 'sesi_id tidak valid.');

  const soal = periksa(await supabase.from('soal').select('id, try_out_id').eq('id', soalId).maybeSingle());
  if (!soal) throw new Galat('TIDAK_DITEMUKAN', 'Soal tidak ditemukan.');
  if (soal.try_out_id !== null) throw new Galat('VALIDASI', 'Hanya soal latihan yang bisa disimpan.');

  if (sesiId !== null) {
    const sesi = periksa(await supabase.from('sesi').select('id, profil_id, jenis').eq('id', sesiId).maybeSingle());
    if (!sesi || sesi.jenis !== 'latihan') throw new Galat('TIDAK_DITEMUKAN', 'Sesi latihan tidak ditemukan.');
    if (sesi.profil_id !== req.user.id) throw new Galat('BUKAN_PEMILIK', 'Sesi ini bukan milik Anda.');
  }

  await pastikanProfil(req.user.id);
  // Simpanan pertama yang menang: menyimpan ulang tidak mengubah sesi asal maupun waktunya.
  periksa(
    await supabase
      .from('soal_tersimpan')
      .upsert({ profil_id: req.user.id, soal_id: soalId, sesi_id: sesiId }, { onConflict: 'profil_id,soal_id', ignoreDuplicates: true })
  );
  res.status(201).json({ soal_id: soalId, tersimpan: true });
});

// DELETE /api/soal-tersimpan/:soalId   (aman dipanggil berulang)
exports.hapus = bungkus(async (req, res) => {
  const soalId = idParam(req.params.soalId, 'soalId');
  periksa(await supabase.from('soal_tersimpan').delete().eq('profil_id', req.user.id).eq('soal_id', soalId));
  res.json({ soal_id: soalId, tersimpan: false });
});
