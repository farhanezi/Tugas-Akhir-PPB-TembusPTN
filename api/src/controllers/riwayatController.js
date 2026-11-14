const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { periksa } = require('../utils/bantu');

const UKURAN_HALAMAN = 10;

// GET /api/riwayat?jenis=try_out|latihan&halaman=1   (hanya sesi yang sudah selesai, terbaru dulu)
exports.riwayat = bungkus(async (req, res) => {
  const { jenis } = req.query;
  if (jenis !== undefined && !['latihan', 'try_out'].includes(jenis)) {
    throw new Galat('VALIDASI', 'jenis harus latihan atau try_out.');
  }
  const halaman = req.query.halaman === undefined ? 1 : Number(req.query.halaman);
  if (!Number.isInteger(halaman) || halaman < 1) throw new Galat('VALIDASI', 'halaman tidak valid.');

  let q = supabase
    .from('sesi')
    .select('id, jenis, try_out_id, pengaturan, selesai_at, skor', { count: 'exact' })
    .eq('profil_id', req.user.id)
    .not('selesai_at', 'is', null)
    .order('selesai_at', { ascending: false });
  if (jenis) q = q.eq('jenis', jenis);
  const dari = (halaman - 1) * UKURAN_HALAMAN;
  const { data, error, count } = await q.range(dari, dari + UKURAN_HALAMAN - 1);
  if (error) {
    console.error(error);
    throw new Galat('SERVER', 'Terjadi kesalahan pada database.');
  }

  const tryOutIds = [...new Set(data.filter((s) => s.try_out_id).map((s) => s.try_out_id))];
  const materiIds = [...new Set(data.flatMap((s) => (s.jenis === 'latihan' ? s.pengaturan.materi_ids : [])))];
  const latihanIds = data.filter((s) => s.jenis === 'latihan').map((s) => s.id);
  const [tryOut, materi, jawaban] = await Promise.all([
    tryOutIds.length ? supabase.from('try_out').select('id, judul').in('id', tryOutIds) : { data: [], error: null },
    materiIds.length ? supabase.from('materi').select('id, nama').in('id', materiIds) : { data: [], error: null },
    latihanIds.length ? supabase.from('jawaban').select('sesi_id, is_benar').in('sesi_id', latihanIds) : { data: [], error: null },
  ]);
  const judul = new Map(periksa(tryOut).map((t) => [t.id, t.judul]));
  const namaMateri = new Map(periksa(materi).map((m) => [m.id, m.nama]));
  const statLatihan = new Map();
  for (const j of periksa(jawaban)) {
    const s = statLatihan.get(j.sesi_id) || { benar: 0, total: 0 };
    s.total++;
    if (j.is_benar) s.benar++;
    statLatihan.set(j.sesi_id, s);
  }

  res.json({
    halaman,
    total: count || 0,
    jumlah_halaman: Math.max(1, Math.ceil((count || 0) / UKURAN_HALAMAN)),
    item: data.map((s) => {
      if (s.jenis === 'try_out') {
        return { sesi_id: s.id, jenis: 'try_out', judul: judul.get(s.try_out_id) || 'Try Out', selesai_at: s.selesai_at, skor: Number(s.skor) };
      }
      const nama = s.pengaturan.materi_ids.map((id) => namaMateri.get(id)).filter(Boolean);
      const st = statLatihan.get(s.id);
      return {
        sesi_id: s.id,
        jenis: 'latihan',
        judul: nama.length > 2 ? `${nama.slice(0, 2).join(', ')} dan ${nama.length - 2} materi lain` : nama.join(', ') || 'Latihan',
        selesai_at: s.selesai_at,
        jumlah_soal: s.pengaturan.jumlah,
        akurasi: st && st.total ? Math.round((st.benar / st.total) * 100) : null,
      };
    }),
  });
});
