import { createClient } from '@supabase/supabase-js';
const sb = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const { data: subtes } = await sb.from('subtes').select('id, nama, urutan').order('urutan');
const { data: materi } = await sb.from('materi').select('id, subtes_id, nama, urutan').order('urutan');
const { data: soal } = await sb.from('soal').select('id, kode, materi_id, try_out_id, kesulitan, wacana_id');
for (const s of subtes) {
  console.log(`\n## ${s.urutan}. ${s.nama}`);
  for (const m of materi.filter((x) => x.subtes_id === s.id)) {
    const x = soal.filter((q) => q.materi_id === m.id && !q.try_out_id);
    const g = {}; x.filter((q) => q.wacana_id).forEach((q) => { g[q.wacana_id] = (g[q.wacana_id] || 0) + 1; });
    const ukuran = Object.values(g);
    const k = (v) => x.filter((q) => q.kesulitan === v).length;
    console.log(`  ${m.nama}: ${x.length} (m${k('mudah')}/s${k('sedang')}/x${k('sulit')}) wacana ${ukuran.length} grup, ukuran [${ukuran.join(',')}] tunggal ${x.filter((q) => !q.wacana_id).length}`);
  }
}
