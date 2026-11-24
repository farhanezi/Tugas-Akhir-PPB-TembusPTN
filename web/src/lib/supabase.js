import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL;
const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

// Tanpa .env aplikasi tetap terbuka dan menampilkan petunjuk, bukan layar putih.
export const terkonfigurasi = Boolean(url && anonKey);

// Dipakai HANYA untuk login/daftar/keluar. Semua data lewat API (RLS menutup akses langsung).
export const supabase = terkonfigurasi ? createClient(url, anonKey) : null;
