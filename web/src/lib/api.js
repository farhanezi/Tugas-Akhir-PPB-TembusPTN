import { supabase } from './supabase.js';

const DASAR = (import.meta.env.VITE_API_URL || 'http://localhost:3000').replace(/\/$/, '');

export class GalatApi extends Error {
  constructor(kode, pesan, status) {
    super(pesan);
    this.kode = kode;
    this.status = status;
  }
}

// Memanggil API dengan token login. Gagal selalu melempar GalatApi { kode, message, status }.
export async function api(path, { method = 'GET', body } = {}) {
  const { data } = await supabase.auth.getSession();
  const token = data.session?.access_token;
  if (!token) throw new GalatApi('BELUM_LOGIN', 'Silakan masuk terlebih dahulu.', 401);

  let res;
  try {
    res = await fetch(`${DASAR}/api${path}`, {
      method,
      headers: { Authorization: `Bearer ${token}`, ...(body !== undefined && { 'Content-Type': 'application/json' }) },
      body: body !== undefined ? JSON.stringify(body) : undefined,
    });
  } catch {
    throw new GalatApi('JARINGAN', 'Tidak bisa terhubung ke server. Periksa koneksimu lalu coba lagi.', 0);
  }

  const isi = await res.json().catch(() => null);
  if (!res.ok) {
    const e = isi?.error;
    if (res.status === 401) await supabase.auth.signOut(); // token kedaluwarsa: kembali ke halaman Masuk
    throw new GalatApi(e?.kode || 'SERVER', e?.pesan || 'Terjadi kesalahan pada server.', res.status);
  }
  return isi;
}
