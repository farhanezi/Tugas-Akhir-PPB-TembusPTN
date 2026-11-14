// Pemeriksaan database (hanya membaca). Jalankan: npm run cek-db
const supabase = require('../src/config/supabase');

async function hitung(tabel) {
  const { count, error } = await supabase.from(tabel).select('*', { count: 'exact', head: true });
  return error ? `ERROR: ${error.message}` : count;
}

(async () => {
  console.log('--- jumlah baris');
  for (const t of ['subtes', 'materi', 'soal', 'opsi', 'try_out', 'target_prodi', 'profil', 'sesi', 'jawaban']) {
    console.log(t.padEnd(14), await hitung(t));
  }
  console.log('--- view dan fungsi');
  const a = await supabase.from('v_stok_latihan').select('materi_id, jumlah');
  console.log('v_stok_latihan   ', a.error ? `ERROR: ${a.error.message}` : `${a.data.length} materi punya soal latihan, total ${a.data.reduce((j, r) => j + r.jumlah, 0)} soal`);
  const b = await supabase.from('v_try_out_subtes').select('try_out_id, subtes_id, jumlah_soal');
  console.log('v_try_out_subtes ', b.error ? `ERROR: ${b.error.message}` : b.data.map((r) => `TO${r.try_out_id}/subtes${r.subtes_id}:${r.jumlah_soal}`).join(' ') || '(kosong)');
  const c = await supabase.rpc('statistik_materi', { p_profil: '00000000-0000-0000-0000-000000000000' });
  console.log('statistik_materi ', c.error ? `ERROR: ${c.error.message}` : `ok (${c.data.length} baris)`);
  console.log('--- kualitas soal');
  const so = await supabase.from('soal').select('id, kode, opsi (is_benar)');
  if (so.error) return console.log('ERROR:', so.error.message);
  const rusak = so.data.filter((s) => s.opsi.length !== 5 || s.opsi.filter((o) => o.is_benar).length !== 1);
  console.log(`soal dicek: ${so.data.length}, tidak punya tepat 5 opsi dengan 1 kunci: ${rusak.length}${rusak.length ? ' -> ' + rusak.map((s) => s.kode || s.id).join(', ') : ''}`);
})();
