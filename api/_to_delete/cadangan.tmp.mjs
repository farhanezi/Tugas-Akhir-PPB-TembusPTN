import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';
const sb = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const keluar = process.env.HOME + '/uji-web/cadangan/';
const tabel = ['subtes', 'materi', 'submateri', 'wacana', 'try_out', 'soal', 'opsi', 'target_prodi', 'profil', 'sesi', 'sesi_subtes', 'jawaban', 'progres_materi', 'progres_submateri'];
for (const t of tabel) {
  let hasil = [], dari = 0;
  for (;;) {
    const { data, error } = await sb.from(t).select('*').range(dari, dari + 999);
    if (error) { console.log(t, 'GALAT', error.message); break; }
    hasil = hasil.concat(data); if (data.length < 1000) break; dari += 1000;
  }
  fs.writeFileSync(keluar + t + '.json', JSON.stringify(hasil));
  console.log(t.padEnd(16), String(hasil.length).padStart(5), 'baris');
}
const { data: u } = await sb.auth.admin.listUsers({ perPage: 200 });
fs.writeFileSync(keluar + 'auth_users.json', JSON.stringify(u.users.map((x) => ({ id: x.id, email: x.email, created_at: x.created_at, user_metadata: x.user_metadata }))));
console.log('auth_users'.padEnd(16), String(u.users.length).padStart(5), 'akun (tanpa kata sandi)');
