// Pembantu format tampilan (bahasa Indonesia).
const angka = (n) => String(n).replace('.', ',');

// 195 -> "3 jam 15 menit", 42.5 -> "42,5 menit"
export function durasiTeks(menit) {
  const m = Number(menit);
  if (m < 60) return `${angka(m)} menit`;
  const j = Math.floor(m / 60);
  const s = Math.round((m - j * 60) * 10) / 10;
  return s ? `${j} jam ${angka(s)} menit` : `${j} jam`;
}
export function durasiSingkat(menit) {
  const m = Number(menit);
  if (m < 60) return `${angka(m)} m`;
  const j = Math.floor(m / 60);
  const s = Math.round(m - j * 60);
  return s ? `${j} j ${s} m` : `${j} j`;
}
// 767 detik -> "12.47"
export function menitDetik(detik) {
  const d = Math.max(0, Math.floor(detik));
  return `${Math.floor(d / 60)}.${String(d % 60).padStart(2, '0')}`;
}
export const menit = angka;
const BULAN = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
export function tanggalPendek(iso) {
  const t = new Date(iso);
  return Number.isNaN(t.getTime()) ? '' : `${t.getDate()} ${BULAN[t.getMonth()]}`;
}
export const bulat = (n) => (n == null || Number.isNaN(Number(n)) ? null : Math.round(Number(n)));
