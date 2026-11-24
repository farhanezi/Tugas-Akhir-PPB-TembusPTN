import { api } from './api.js';

// Soal latihan hanya dikirim sekali oleh API saat sesi dibuat, jadi disimpan di perangkat
// (sessionStorage) supaya sesi tetap bisa dilanjutkan setelah halaman dimuat ulang.
const kunci = (id) => `tembusptn:latihan:${id}`;

export function bacaSesi(id) {
  try {
    return JSON.parse(sessionStorage.getItem(kunci(id)));
  } catch {
    return null;
  }
}
export function simpanSesi(sesi) {
  try {
    sessionStorage.setItem(kunci(sesi.sesi_id), JSON.stringify(sesi));
  } catch { /* penyimpanan penuh atau diblokir: sesi tetap jalan di memori */ }
}
export function hapusSesi(id) {
  try { sessionStorage.removeItem(kunci(id)); } catch { /* abaikan */ }
}

// Membuat sesi latihan baru dan mengembalikan id-nya.
export async function mulaiLatihan({ materi_ids, jumlah, umpan_balik }) {
  const hasil = await api('/latihan/sesi', { method: 'POST', body: { materi_ids, jumlah, mode: 'acak', umpan_balik } });
  simpanSesi({ sesi_id: hasil.sesi_id, umpan_balik: hasil.umpan_balik, soal: hasil.soal, jawab: {}, indeks: 0 });
  return hasil.sesi_id;
}
