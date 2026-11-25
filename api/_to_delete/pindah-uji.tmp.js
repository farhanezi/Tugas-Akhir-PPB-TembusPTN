// Memindahkan isi konten dari proyek Supabase LAMA ke proyek BARU (mis. region Singapura).
//
// Yang dipindah : subtes (hanya diperiksa), materi, submateri, wacana, try_out, soal, opsi, target_prodi.
// Tidak dipindah: akun login dan semua aktivitas pengguna (profil, sesi, jawaban, progres).
//                 Akun uji dibuat ulang di proyek baru lewat Authentication > Add user.
// Karakter \r (akhir baris Windows) di teks dibuang saat disalin.
//
// Persiapan:
//   1. Buat proyek baru, jalankan db/schema.sql di SQL Editor proyek baru.
//   2. Buat api/.env.baru berisi SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_ANON_KEY proyek baru.
// Pakai (dari folder api):
//   node scripts/pindah-db.js              -> uji kering: hanya membaca, tidak menulis apa pun
//   node scripts/pindah-db.js --jalankan   -> menyalin, lalu membandingkan isi kedua proyek
//   Setelah itu jalankan db/setelah_pindah.sql di SQL Editor proyek baru (menyetel penghitung id).
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

const ROOT = path.join(__dirname, '..');
function bacaEnv(nama) {
  const f = path.join(ROOT, nama);
  if (!fs.existsSync(f)) return null;
  const out = {};
  for (const baris of fs.readFileSync(f, 'utf8').split(/\r?\n/)) {
    const m = baris.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/);
    if (m) out[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
  return out;
}
const klien = (e) => createClient(e.SUPABASE_URL, e.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const TABEL = ['subtes', 'materi', 'submateri', 'wacana', 'try_out', 'soal', 'opsi', 'target_prodi'];
const bersih = (v) => (typeof v === 'string' ? v.replace(/\r/g, '') : v);

async function semuaBaris(sb, tabel) {
  let hasil = []; let dari = 0;
  for (;;) {
    const { data, error } = await sb.from(tabel).select('*').order('id').range(dari, dari + 999);
    if (error) throw new Error(`${tabel}: ${error.message}`);
    hasil = hasil.concat(data);
    if (data.length < 1000) return hasil;
    dari += 1000;
  }
}
const rapikan = (baris) => baris.map((r) => Object.fromEntries(Object.entries(r).map(([k, v]) => [k, bersih(v)])));
const sidik = (baris) => JSON.stringify(baris.map((r) => Object.fromEntries(Object.keys(r).sort().map((k) => [k, r[k]]))));

(async () => {
  const jalankan = process.argv.includes('--jalankan');
  const lama = bacaEnv('.env'); const baru = bacaEnv('.env');
  if (!lama || !lama.SUPABASE_URL) throw new Error('api/.env (proyek lama) tidak ditemukan atau kosong.');
  if (!baru || !baru.SUPABASE_URL || !baru.SUPABASE_SERVICE_ROLE_KEY) throw new Error('api/.env.baru belum ada atau belum lengkap (SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY).');
  const sbLama = klien(lama); const sbBaru = klien(baru);
  console.log(`Lama: ${lama.SUPABASE_URL}\nBaru: ${baru.SUPABASE_URL}\nMode: ${jalankan ? 'MENYALIN' : 'uji kering (hanya membaca)'}\n`);

  const data = {};
  for (const t of TABEL) {
    const mentah = await semuaBaris(sbLama, t);
    const cr = mentah.filter((r) => Object.values(r).some((v) => typeof v === 'string' && v.includes('\r'))).length;
    data[t] = rapikan(mentah);
    console.log(`Baca lama   ${t.padEnd(12)} ${String(data[t].length).padStart(5)} baris${cr ? `  (${cr} baris dibersihkan dari \\r)` : ''}`);
  }
  // proyek baru harus sudah punya tabel (schema.sql sudah dijalankan)
  const barisBaru = {};
  for (const t of TABEL) {
    try { barisBaru[t] = await semuaBaris(sbBaru, t); } catch (e) { throw new Error(`Proyek baru belum siap: ${e.message}. Sudah menjalankan db/schema.sql di proyek baru?`); }
  }
  const sub = (b) => b.map((r) => `${r.id}|${r.nama}`).join(',');
  if (sub(data.subtes) !== sub(barisBaru.subtes)) throw new Error('Isi tabel subtes di proyek baru berbeda dari lama (id atau nama). Periksa db/schema.sql.');
  for (const t of TABEL.filter((x) => x !== 'subtes')) if (barisBaru[t].length) console.log(`Perhatian: ${t} di proyek baru sudah berisi ${barisBaru[t].length} baris (akan ditimpa menurut id).`);
  if (!jalankan) { console.log('\nUji kering selesai. Tidak ada yang ditulis. Tambahkan --jalankan untuk menyalin.'); return; }

  for (const t of TABEL.filter((x) => x !== 'subtes')) {
    const baris = data[t];
    for (let i = 0; i < baris.length; i += 200) {
      const { error } = await sbBaru.from(t).upsert(baris.slice(i, i + 200), { onConflict: 'id' });
      if (error) throw new Error(`Gagal menyalin ${t} (baris ${i}): ${error.message}`);
    }
    console.log(`Salin       ${t.padEnd(12)} ${String(baris.length).padStart(5)} baris`);
  }
  console.log('\nMembandingkan isi kedua proyek...');
  let semuaSama = true;
  for (const t of TABEL) {
    const b = rapikan(await semuaBaris(sbBaru, t));
    const sama = sidik(b) === sidik(data[t]);
    semuaSama = semuaSama && sama;
    console.log(`${sama ? 'SAMA ' : 'BEDA '} ${t.padEnd(12)} lama ${String(data[t].length).padStart(5)} | baru ${String(b.length).padStart(5)}`);
  }
  console.log(semuaSama ? '\nSemua tabel sama. Langkah berikut: jalankan db/setelah_pindah.sql di SQL Editor proyek baru.' : '\nAda tabel yang berbeda. Jangan beralih dulu.');
  process.exit(semuaSama ? 0 : 1);
})().catch((e) => { console.error('GALAT:', e.message); process.exit(1); });
