const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { periksa } = require('../utils/bantu');
const { hitungRekomendasi } = require('../services/rekomendasiService');
const { daftarUntuk } = require('./tryOutController');

// GET /api/rekomendasi
exports.rekomendasi = bungkus(async (req, res) => {
  res.json(await hitungRekomendasi(req.user.id));
});

// GET /api/dashboard  (satu paket: banner + rekomendasi + try out untuk kartu)
exports.dashboard = bungkus(async (req, res) => {
  const profil = periksa(
    await supabase.from('profil').select('nama, target_prodi_id').eq('id', req.user.id).maybeSingle()
  );
  const [target, skorRows, rekomendasi, tryOut] = await Promise.all([
    profil && profil.target_prodi_id
      ? supabase.from('target_prodi').select('ptn, prodi, skor_target').eq('id', profil.target_prodi_id).maybeSingle()
      : { data: null, error: null },
    supabase.from('sesi').select('skor').eq('profil_id', req.user.id).eq('jenis', 'try_out').not('selesai_at', 'is', null),
    hitungRekomendasi(req.user.id),
    daftarUntuk(req.user.id),
  ]);
  const t = periksa(target);
  const skor = periksa(skorRows).map((r) => Number(r.skor)).filter((n) => !Number.isNaN(n));
  const tertinggi = skor.length ? Math.max(...skor) : null;

  let banner;
  if (!t) {
    banner = { status: 'belum_ada_target' };
  } else if (tertinggi === null) {
    banner = { status: 'belum_ada_try_out', target: { ...t, skor_target: Number(t.skor_target) } };
  } else {
    const selisih = Math.round((Number(t.skor_target) - tertinggi) * 10) / 10;
    banner = {
      status: selisih > 0 ? 'menuju' : 'di_atas_target',
      target: { ...t, skor_target: Number(t.skor_target) },
      skor_tertinggi: tertinggi,
      selisih: Math.max(0, selisih),
      label: 'estimasi',
    };
  }

  res.json({ nama: profil ? profil.nama : null, banner, rekomendasi, try_out: tryOut });
});
