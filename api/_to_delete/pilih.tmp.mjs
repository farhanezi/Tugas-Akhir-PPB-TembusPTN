import { createClient } from '@supabase/supabase-js';
import fs from 'node:fs';
const sb = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
function rng(a) { return () => { a |= 0; a = (a + 0x6d2b79f5) | 0; let t = Math.imul(a ^ (a >>> 15), 1 | a); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; }; }
const acak = rng(20261119);
const mengacak = (arr) => { const a = [...arr]; for (let i = a.length - 1; i > 0; i--) { const j = Math.floor(acak() * (i + 1)); [a[i], a[j]] = [a[j], a[i]]; } return a; };
const ambilSemua = async (tabel, kolom) => { let hasil = [], dari = 0; for (;;) { const { data, error } = await sb.from(tabel).select(kolom).range(dari, dari + 999); if (error) throw error; hasil = hasil.concat(data); if (data.length < 1000) return hasil; dari += 1000; } };
const subtes = (await sb.from('subtes').select('id, nama, urutan').order('urutan')).data;
const materi = (await sb.from('materi').select('id, subtes_id, nama, urutan').order('urutan')).data;
const soal = await ambilSemua('soal', 'id, kode, materi_id, try_out_id, kesulitan, wacana_id, format');
const opsi = await ambilSemua('opsi', 'soal_id, is_benar');
const jmlOpsi = {}, jmlBenar = {};
for (const o of opsi) { jmlOpsi[o.soal_id] = (jmlOpsi[o.soal_id] || 0) + 1; jmlBenar[o.soal_id] = (jmlBenar[o.soal_id] || 0) + (o.is_benar ? 1 : 0); }
const layak = (q) => !q.try_out_id && q.kode && jmlOpsi[q.id] === 5 && jmlBenar[q.id] === 1 && q.format === 'pilihan_ganda';
const kuota = { 1: 10, 2: 5, 3: 5, 4: 5, 7: 4 }; // per materi, menurut urutan subtes
const urutKes = { mudah: 0, sedang: 1, sulit: 2 };
const target = (n) => { const m = Math.round(n * 0.25), x = Math.round(n * 0.25); return { mudah: m, sedang: n - m - x, sulit: x }; };
const terpilih = []; const ringkas = [];
for (const s of subtes.filter((x) => kuota[x.urutan])) {
  const n = kuota[s.urutan]; let nomor = 0; const baris = [];
  const daftarMateri = materi.filter((m) => m.subtes_id === s.id);
  for (const [iM, m] of daftarMateri.entries()) {
    const calon = soal.filter((q) => q.materi_id === m.id && layak(q));
    const grup = {}; calon.filter((q) => q.wacana_id).forEach((q) => { (grup[q.wacana_id] ||= []).push(q); });
    const tunggal = calon.filter((q) => !q.wacana_id);
    const butuh = target(n); const pilih = [];
    const pakaiGrup = Object.keys(grup).length > 0 && (s.urutan !== 7 || iM === 0 || iM === 4) && n >= 4;
    if (pakaiGrup) {
      const g = mengacak(Object.values(grup).filter((x) => x.length <= n))[0];
      g.sort((a, b) => a.kode.localeCompare(b.kode)); pilih.push(...g); g.forEach((q) => butuh[q.kesulitan]--);
    }
    let sisa = n - pilih.length; const kolam = mengacak(tunggal);
    while (sisa > 0) {
      const urut = Object.entries(butuh).sort((a, b) => b[1] - a[1]);
      let q = null;
      for (const [k] of urut) { q = kolam.find((x) => x.kesulitan === k && !pilih.includes(x)); if (q) { butuh[k]--; break; } }
      if (!q) q = kolam.find((x) => !pilih.includes(x));
      if (!q) throw new Error(`stok kurang: ${s.nama} / ${m.nama}`);
      pilih.push(q); sisa--;
    }
    const grupDulu = pilih.filter((q) => q.wacana_id); const lepas = pilih.filter((q) => !q.wacana_id).sort((a, b) => urutKes[a.kesulitan] - urutKes[b.kesulitan] || a.kode.localeCompare(b.kode));
    for (const q of [...grupDulu, ...lepas]) { nomor++; terpilih.push({ kode: q.kode, nomor, subtes: s.nama }); baris.push({ materi: m.nama, ...q }); }
  }
  const k = (v) => baris.filter((q) => q.kesulitan === v).length;
  ringkas.push(`${s.urutan}. ${s.nama}: ${baris.length} soal (mudah ${k('mudah')}, sedang ${k('sedang')}, sulit ${k('sulit')}), wacana ${baris.filter((q) => q.wacana_id).length} soal`);
  for (const m of daftarMateri) ringkas.push(`     ${m.nama}: ${baris.filter((q) => q.materi === m.nama).length}`);
}
console.log(ringkas.join('\n')); console.log('Total dipilih:', terpilih.length, ' kode unik:', new Set(terpilih.map((x) => x.kode)).size);
fs.writeFileSync('/tmp/pilihan.json', JSON.stringify(terpilih));
