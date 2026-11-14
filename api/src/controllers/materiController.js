const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { idParam, periksa, pastikanProfil, materiSelesai, stokLatihan } = require('../utils/bantu');

// GET /api/subtes
exports.daftarSubtes = bungkus(async (req, res) => {
  const [subtes, materi, selesai, stok] = await Promise.all([
    supabase.from('subtes').select('id, nama, kelompok, urutan, jumlah_soal_resmi, durasi_menit').order('urutan'),
    supabase.from('materi').select('id, subtes_id'),
    materiSelesai(req.user.id),
    stokLatihan(),
  ]);

  const materiPerSubtes = new Map();
  for (const m of periksa(materi)) {
    if (!materiPerSubtes.has(m.subtes_id)) materiPerSubtes.set(m.subtes_id, []);
    materiPerSubtes.get(m.subtes_id).push(m.id);
  }

  res.json(
    periksa(subtes).map((s) => {
      const ids = materiPerSubtes.get(s.id) || [];
      return {
        id: s.id,
        nama: s.nama,
        kelompok: s.kelompok,
        jumlah_materi: ids.length,
        materi_selesai: ids.filter((id) => selesai.has(id)).length,
        jumlah_soal_latihan: ids.reduce((jml, id) => jml + (stok.get(id) || 0), 0),
        jumlah_soal_resmi: s.jumlah_soal_resmi,
        durasi_menit: Number(s.durasi_menit),
        tersedia: ids.length > 0, // subtes tanpa materi tampil "Segera hadir"
      };
    })
  );
});

// GET /api/subtes/:id/materi
exports.materiDiSubtes = bungkus(async (req, res) => {
  const subtesId = idParam(req.params.id);
  const subtes = periksa(await supabase.from('subtes').select('id, nama').eq('id', subtesId).maybeSingle());
  if (!subtes) throw new Galat('TIDAK_DITEMUKAN', 'Subtes tidak ditemukan.');

  const [materi, selesai, stok] = await Promise.all([
    supabase.from('materi').select('id, nama, urutan').eq('subtes_id', subtesId).order('urutan').order('id'),
    materiSelesai(req.user.id),
    stokLatihan(),
  ]);

  res.json({
    subtes,
    materi: periksa(materi).map((m) => ({
      id: m.id,
      nama: m.nama,
      urutan: m.urutan,
      selesai: selesai.has(m.id),
      jumlah_soal_latihan: stok.get(m.id) || 0,
    })),
  });
});

// GET /api/materi/:id
exports.detailMateri = bungkus(async (req, res) => {
  const id = idParam(req.params.id);
  const m = periksa(
    await supabase
      .from('materi')
      .select('id, nama, urutan, subtes_id, video_url, pdf_url, subtes:subtes_id (id, nama)')
      .eq('id', id)
      .maybeSingle()
  );
  if (!m) throw new Galat('TIDAK_DITEMUKAN', 'Materi tidak ditemukan.');

  const [saudara, selesai] = await Promise.all([
    supabase.from('materi').select('id').eq('subtes_id', m.subtes_id).order('urutan').order('id'),
    materiSelesai(req.user.id),
  ]);
  const ids = periksa(saudara).map((r) => r.id);
  const i = ids.indexOf(m.id);

  res.json({
    id: m.id,
    nama: m.nama,
    subtes: m.subtes,
    video_url: m.video_url, // null = tampilkan "Segera hadir"
    pdf_url: m.pdf_url,
    selesai: selesai.has(m.id),
    materi_sebelumnya_id: i > 0 ? ids[i - 1] : null,
    materi_berikutnya_id: i < ids.length - 1 ? ids[i + 1] : null,
  });
});

async function pastikanMateriAda(id) {
  const ada = periksa(await supabase.from('materi').select('id').eq('id', id).maybeSingle());
  if (!ada) throw new Galat('TIDAK_DITEMUKAN', 'Materi tidak ditemukan.');
}

// POST /api/materi/:id/selesai (aman dipanggil berulang)
exports.tandaiSelesai = bungkus(async (req, res) => {
  const id = idParam(req.params.id);
  await pastikanMateriAda(id);
  await pastikanProfil(req.user.id);
  periksa(
    await supabase
      .from('progres_materi')
      .upsert({ profil_id: req.user.id, materi_id: id }, { onConflict: 'profil_id,materi_id', ignoreDuplicates: true })
  );
  res.json({ materi_id: id, selesai: true });
});

// DELETE /api/materi/:id/selesai
exports.batalSelesai = bungkus(async (req, res) => {
  const id = idParam(req.params.id);
  await pastikanMateriAda(id);
  periksa(await supabase.from('progres_materi').delete().eq('profil_id', req.user.id).eq('materi_id', id));
  res.json({ materi_id: id, selesai: false });
});
