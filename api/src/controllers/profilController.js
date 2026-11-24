const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { periksa, pastikanProfil, materiSelesai } = require('../utils/bantu');

async function targetDenganId(id) {
  if (!id) return null;
  return periksa(
    await supabase.from('target_prodi').select('id, ptn, prodi, skor_target, sumber, tahun').eq('id', id).maybeSingle()
  );
}

// GET /api/profil
exports.ambil = bungkus(async (req, res) => {
  const profil = periksa(
    await supabase.from('profil').select('id, nama, target_prodi_id').eq('id', req.user.id).maybeSingle()
  );
  // Profil bisa sudah ada (dibuat otomatis saat mulai latihan) tapi masih kosong.
  // Kosong = belum pernah onboarding; tampilan boleh mengingat "dilewati" di sisi klien.
  if (!profil || (profil.nama == null && profil.target_prodi_id == null)) {
    return res.json({ perlu_onboarding: true, email: req.user.email });
  }

  const [target, tryOut, materi] = await Promise.all([
    targetDenganId(profil.target_prodi_id),
    supabase
      .from('sesi')
      .select('skor')
      .eq('profil_id', req.user.id)
      .eq('jenis', 'try_out')
      .not('selesai_at', 'is', null),
    materiSelesai(req.user.id),
  ]);
  const skor = periksa(tryOut).map((r) => Number(r.skor)).filter((n) => !Number.isNaN(n));

  res.json({
    perlu_onboarding: false,
    email: req.user.email,
    nama: profil.nama,
    target,
    ringkasan: {
      try_out_selesai: skor.length,
      skor_tertinggi: skor.length ? Math.max(...skor) : null,
      materi_selesai: materi.size,
    },
  });
});

// PUT /api/profil  { nama?, target_prodi_id? }  (target_prodi_id: null = hapus target)
exports.simpan = bungkus(async (req, res) => {
  const { nama, target_prodi_id: targetId } = req.body || {};
  const ubah = { id: req.user.id };

  if (nama !== undefined) {
    if (typeof nama !== 'string' || nama.trim().length === 0 || nama.trim().length > 60) {
      throw new Galat('VALIDASI', 'Nama harus berupa teks 1-60 karakter.');
    }
    ubah.nama = nama.trim();
  }
  if (targetId !== undefined) {
    if (targetId !== null) {
      if (!Number.isInteger(targetId) || targetId <= 0) throw new Galat('VALIDASI', 'target_prodi_id tidak valid.');
      if (!(await targetDenganId(targetId))) throw new Galat('VALIDASI', 'Target prodi tidak ditemukan.');
    }
    ubah.target_prodi_id = targetId;
  }
  if (Object.keys(ubah).length === 1) throw new Galat('VALIDASI', 'Tidak ada data yang diubah.');

  periksa(await supabase.from('profil').upsert(ubah, { onConflict: 'id' }));
  const baru = periksa(
    await supabase.from('profil').select('id, nama, target_prodi_id').eq('id', req.user.id).single()
  );
  res.json({ nama: baru.nama, target: await targetDenganId(baru.target_prodi_id) });
});

// GET /api/target-prodi  (jumlahnya kecil, kelompokkan per PTN di tampilan)
exports.daftarTarget = bungkus(async (req, res) => {
  res.json(
    periksa(
      await supabase
        .from('target_prodi')
        .select('id, ptn, prodi, skor_target, sumber, tahun')
        .order('ptn')
        .order('prodi')
    )
  );
});
