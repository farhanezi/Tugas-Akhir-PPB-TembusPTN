const { createClient } = require('@supabase/supabase-js');

const url = process.env.SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!url || !key) {
  console.warn('[peringatan] SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY belum diisi di .env');
}

// Klien dengan service_role: melewati RLS, jadi hanya dipakai di server.
const supabase = createClient(url || 'http://localhost', key || 'kosong', {
  auth: { persistSession: false, autoRefreshToken: false },
});

module.exports = supabase;
