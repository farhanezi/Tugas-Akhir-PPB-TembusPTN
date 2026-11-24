const supabase = require('../config/supabase');
const { Galat } = require('./galat');

// Ambil id positif dari parameter URL, atau lempar 422.
function idParam(nilai, nama = 'id') {
  const n = Number(nilai);
  if (!Number.isInteger(n) || n <= 0) throw new Galat('VALIDASI', `Parameter ${nama} tidak valid.`);
  return n;
}

// Hasil query Supabase: lempar kalau ada error database.
function periksa({ data, error }) {
  if (error) {
    console.error(error);
    throw new Galat('SERVER', 'Terjadi kesalahan pada database.');
  }
  return data;
}

// Profil dibuat otomatis saat pertama dibutuhkan (progres, sesi, dst. menunjuk ke profil).
async function pastikanProfil(userId) {
  periksa(await supabase.from('profil').upsert({ id: userId }, { onConflict: 'id', ignoreDuplicates: true }));
}

// Progres sub materi pengguna: Set id sub materi selesai + Map materi_id -> { jumlah, selesai }
async function progresSubmateri(userId) {
  const [sub, prog] = await Promise.all([
    supabase.from('submateri').select('id, materi_id'),
    supabase.from('progres_submateri').select('submateri_id').eq('profil_id', userId),
  ]);
  const selesaiIds = new Set(periksa(prog).map((r) => r.submateri_id));
  const perMateri = new Map();
  for (const s of periksa(sub)) {
    const x = perMateri.get(s.materi_id) || { jumlah: 0, selesai: 0 };
    x.jumlah += 1;
    if (selesaiIds.has(s.id)) x.selesai += 1;
    perMateri.set(s.materi_id, x);
  }
  return { selesaiIds, perMateri };
}

// id materi yang selesai -> Set. Materi dengan sub materi selesai bila semua sub materinya selesai;
// materi tanpa sub materi memakai tanda langsung (progres_materi).
async function materiSelesai(userId) {
  const [{ perMateri }, langsung] = await Promise.all([
    progresSubmateri(userId),
    supabase.from('progres_materi').select('materi_id').eq('profil_id', userId),
  ]);
  const hasil = new Set();
  for (const [id, x] of perMateri) if (x.jumlah > 0 && x.selesai === x.jumlah) hasil.add(id);
  for (const r of periksa(langsung)) if (!perMateri.has(r.materi_id)) hasil.add(r.materi_id);
  return hasil;
}

// materi_id -> jumlah soal latihan
async function stokLatihan() {
  const rows = periksa(await supabase.from('v_stok_latihan').select('materi_id, jumlah'));
  return new Map(rows.map((r) => [r.materi_id, r.jumlah]));
}

module.exports = { idParam, periksa, pastikanProfil, progresSubmateri, materiSelesai, stokLatihan };
