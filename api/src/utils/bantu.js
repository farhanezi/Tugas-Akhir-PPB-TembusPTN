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

// id materi yang sudah ditandai selesai oleh pengguna -> Set
async function materiSelesai(userId) {
  const rows = periksa(await supabase.from('progres_materi').select('materi_id').eq('profil_id', userId));
  return new Set(rows.map((r) => r.materi_id));
}

// materi_id -> jumlah soal latihan
async function stokLatihan() {
  const rows = periksa(await supabase.from('v_stok_latihan').select('materi_id, jumlah'));
  return new Map(rows.map((r) => [r.materi_id, r.jumlah]));
}

module.exports = { idParam, periksa, pastikanProfil, materiSelesai, stokLatihan };
