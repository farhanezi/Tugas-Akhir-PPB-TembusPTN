import { createClient } from '@supabase/supabase-js';
const sb = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const { data: subtes } = await sb.from('subtes').select('id, nama, urutan, jumlah_soal_resmi, durasi_menit').order('urutan');
const { data: materi } = await sb.from('materi').select('id, subtes_id, nama');
const { data: soal } = await sb.from('soal').select('id, materi_id, try_out_id, kesulitan, format, wacana_id, gambar_url');
for (const s of subtes) {
  const mid = new Set(materi.filter((m) => m.subtes_id === s.id).map((m) => m.id));
  const x = soal.filter((q) => mid.has(q.materi_id) && !q.try_out_id);
  const k = (v) => x.filter((q) => q.kesulitan === v).length;
  console.log(`${s.urutan}. ${s.nama} | resmi ${s.jumlah_soal_resmi} soal, ${s.durasi_menit} mnt | latihan ${x.length} (mudah ${k('mudah')}, sedang ${k('sedang')}, sulit ${k('sulit')}), wacana ${x.filter((q) => q.wacana_id).length}, gambar ${x.filter((q) => q.gambar_url).length}`);
}
