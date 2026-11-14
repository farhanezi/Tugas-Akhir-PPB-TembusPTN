// Uji menyeluruh dengan database dan login ASLI. Jalankan: npm run uji
// Perlu di .env: UJI_EMAIL dan UJI_PASSWORD (akun uji yang dibuat di Supabase Authentication).
// Skrip ini menjalankan API di port acak, masuk memakai akun uji, lalu memanggil endpoint berurutan.
// Data aktivitas milik akun uji (sesi, jawaban, progres) dihapus di awal agar uji bisa diulang.
const { createClient } = require('@supabase/supabase-js');
const supabase = require('../src/config/supabase');
const app = require('../src/app');

const { UJI_EMAIL, UJI_PASSWORD, SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY } = process.env;
let lulus = 0;
let gagal = 0;
const cek = (nama, kondisi, info = '') => {
  kondisi ? lulus++ : gagal++;
  console.log(`${kondisi ? 'LULUS' : 'GAGAL'}  ${nama}${!kondisi && info ? `  -> ${info}` : ''}`);
  return kondisi;
};

async function main() {
  if (!UJI_EMAIL || !UJI_PASSWORD) {
    console.error('UJI_EMAIL / UJI_PASSWORD belum diisi di api/.env');
    process.exit(2);
  }
  const server = app.listen(0);
  const base = `http://127.0.0.1:${server.address().port}/api`;
  let token = null;
  const api = async (metode, jalur, body, tanpaToken) => {
    const res = await fetch(base + jalur, {
      method: metode,
      headers: { 'Content-Type': 'application/json', ...(token && !tanpaToken ? { Authorization: `Bearer ${token}` } : {}) },
      body: body ? JSON.stringify(body) : undefined,
    });
    let data = null;
    try { data = await res.json(); } catch { /* tanpa isi */ }
    return { status: res.status, data };
  };
  const kode = (r) => r.data && r.data.error && r.data.error.kode;

  try {
    // ---------- 0. dasar
    const h = await api('GET', '/health?db=1', null, true);
    cek('health + koneksi database', h.status === 200 && h.data.database === 'terhubung', JSON.stringify(h.data));
    cek('tanpa token ditolak (401 BELUM_LOGIN)', kode(await api('GET', '/profil', null, true)) === 'BELUM_LOGIN');
    cek('token ngawur ditolak', kode(await (async () => { token = 'ngawur'; const r = await api('GET', '/profil'); token = null; return r; })()) === 'BELUM_LOGIN');

    // ---------- 1. login (klien terpisah agar sesi login tidak bercampur dengan klien service_role)
    const klienLogin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false, autoRefreshToken: false } });
    const masuk = await klienLogin.auth.signInWithPassword({ email: UJI_EMAIL, password: UJI_PASSWORD });
    if (!cek('login akun uji', !masuk.error && masuk.data.session, masuk.error && masuk.error.message)) return;
    token = masuk.data.session.access_token;
    const uid = masuk.data.user.id;

    // bersihkan jejak uji sebelumnya (hanya milik akun uji)
    await supabase.from('sesi').delete().eq('profil_id', uid); // jawaban & sesi_subtes ikut terhapus (cascade)
    await supabase.from('progres_materi').delete().eq('profil_id', uid);
    await supabase.from('profil').delete().eq('id', uid);

    // ---------- 2. profil
    let r = await api('GET', '/profil');
    cek('profil baru: perlu_onboarding', r.status === 200 && r.data.perlu_onboarding === true, JSON.stringify(r.data));
    r = await api('PUT', '/profil', { nama: 'Akun Uji' });
    cek('PUT profil menyimpan nama', r.status === 200 && r.data.nama === 'Akun Uji', JSON.stringify(r.data));
    cek('PUT profil kosong -> 422', kode(await api('PUT', '/profil', {})) === 'VALIDASI');
    r = await api('GET', '/profil');
    cek('profil setelah onboarding', r.data.perlu_onboarding === false && r.data.ringkasan.materi_selesai === 0, JSON.stringify(r.data));
    r = await api('GET', '/target-prodi');
    cek('GET target-prodi (daftar)', r.status === 200 && Array.isArray(r.data), `${r.data.length} baris`);

    // ---------- 3. materi
    r = await api('GET', '/subtes');
    cek('GET subtes: 7 subtes', r.status === 200 && r.data.length === 7, `jumlah ${r.data && r.data.length}`);
    const subtesPK = r.data.find((s) => s.nama === 'Pengetahuan Kuantitatif');
    cek('subtes PK punya materi dan soal latihan', subtesPK && subtesPK.jumlah_materi > 0 && subtesPK.jumlah_soal_latihan > 0, JSON.stringify(subtesPK));
    r = await api('GET', `/subtes/${subtesPK.id}/materi`);
    cek('GET materi di subtes', r.status === 200 && r.data.materi.length > 0);
    const materiBerisi = r.data.materi.filter((m) => m.jumlah_soal_latihan > 0);
    const m1 = r.data.materi[0];
    r = await api('GET', `/materi/${m1.id}`);
    cek('GET detail materi (video/pdf kosong = null)', r.status === 200 && r.data.video_url === null && r.data.materi_sebelumnya_id === null && r.data.materi_berikutnya_id !== null, JSON.stringify(r.data));
    r = await api('POST', `/materi/${m1.id}/selesai`);
    cek('tandai selesai', r.status === 200 && r.data.selesai === true, JSON.stringify(r.data));
    r = await api('POST', `/materi/${m1.id}/selesai`);
    cek('tandai selesai dua kali aman', r.status === 200);
    r = await api('GET', `/subtes/${subtesPK.id}/materi`);
    cek('progres tercatat', r.data.materi.find((m) => m.id === m1.id).selesai === true);
    r = await api('DELETE', `/materi/${m1.id}/selesai`);
    cek('batal tandai selesai', r.status === 200 && r.data.selesai === false);
    cek('materi tidak ada -> 404', kode(await api('GET', '/materi/999999')) === 'TIDAK_DITEMUKAN');

    // ---------- 4. latihan
    const stokTotal = materiBerisi.reduce((j, m) => j + m.jumlah_soal_latihan, 0);
    cek('stok kurang -> STOK_KURANG', kode(await api('POST', '/latihan/sesi', { materi_ids: materiBerisi.map((m) => m.id), jumlah: stokTotal + 1 })) === 'STOK_KURANG');
    r = await api('POST', '/latihan/sesi', { materi_ids: materiBerisi.map((m) => m.id), jumlah: 3 });
    cek('mulai latihan 3 soal', r.status === 201 && r.data.soal.length === 3, JSON.stringify(r.data).slice(0, 200));
    const teks = JSON.stringify(r.data);
    cek('soal latihan TIDAK membawa kunci/pembahasan', !teks.includes('is_benar') && !teks.includes('pembahasan'));
    const sesiL = r.data.sesi_id;
    const soalL = r.data.soal;
    r = await api('POST', `/latihan/sesi/${sesiL}/jawaban`, { soal_id: soalL[0].id, opsi_id: soalL[0].opsi[0].id });
    cek('periksa jawaban: dapat benar/salah + kunci + pembahasan', r.status === 200 && typeof r.data.benar === 'boolean' && r.data.opsi_benar_id && r.data.pembahasan, JSON.stringify(r.data));
    cek('jawaban terkunci (409 SUDAH_DIJAWAB)', kode(await api('POST', `/latihan/sesi/${sesiL}/jawaban`, { soal_id: soalL[0].id, opsi_id: soalL[0].opsi[1].id })) === 'SUDAH_DIJAWAB');
    cek('opsi milik soal lain -> 422', kode(await api('POST', `/latihan/sesi/${sesiL}/jawaban`, { soal_id: soalL[1].id, opsi_id: soalL[0].opsi[0].id })) === 'VALIDASI');
    await api('POST', `/latihan/sesi/${sesiL}/jawaban`, { soal_id: soalL[1].id, opsi_id: soalL[1].opsi[0].id });
    r = await api('GET', `/sesi/${sesiL}/hasil`);
    cek('hasil sebelum selesai ditolak', r.status === 404);
    r = await api('POST', `/latihan/sesi/${sesiL}/selesai`);
    cek('selesaikan latihan', r.status === 200 && r.data.selesai_at);
    cek('jawab setelah selesai -> SESI_SELESAI', kode(await api('POST', `/latihan/sesi/${sesiL}/jawaban`, { soal_id: soalL[2].id, opsi_id: soalL[2].opsi[0].id })) === 'SESI_SELESAI');
    r = await api('GET', `/sesi/${sesiL}/hasil`);
    cek('hasil latihan: 2 dijawab, 1 belum', r.status === 200 && r.data.benar + r.data.salah === 2 && r.data.belum_dijawab === 1, JSON.stringify(r.data).slice(0, 200));

    // ---------- 5. try out
    r = await api('GET', '/try-out');
    const to = r.status === 200 && r.data.find((t) => t.judul.startsWith('[DUMMY]'));
    if (!cek('daftar try out memuat try out dummy', to, JSON.stringify(r.data))) return;
    cek('try out dummy: 2 subtes, 7 soal, status belum', to.jumlah_subtes === 2 && to.total_soal === 7 && to.status === 'belum', JSON.stringify(to));
    r = await api('GET', `/try-out/${to.id}`);
    const urut = r.data.subtes;
    cek('detail: subtes pertama aktif, kedua terkunci', urut[0].status === 'aktif' && urut[1].status === 'terkunci', JSON.stringify(urut.map((s) => s.status)));
    r = await api('POST', `/try-out/${to.id}/sesi`);
    cek('mulai sesi try out', r.status === 201 && r.data.sesi_id, JSON.stringify(r.data));
    const sesiT = r.data.sesi_id;
    r = await api('POST', `/try-out/${to.id}/sesi`);
    cek('mulai lagi mengembalikan sesi yang sama', r.status === 200 && r.data.sesi_id === sesiT);
    cek('subtes kedua terkunci (SUBTES_TERKUNCI)', kode(await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[1].id}/mulai`)) === 'SUBTES_TERKUNCI');
    r = await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[0].id}/mulai`);
    const tt = JSON.stringify(r.data);
    cek('mulai subtes pertama: ada soal, timer, TANPA kunci', r.status === 200 && r.data.soal.length === urut[0].jumlah_soal && r.data.batas_at && !tt.includes('is_benar') && !tt.includes('pembahasan'), tt.slice(0, 200));
    const menitBatas = (new Date(r.data.batas_at) - new Date(r.data.mulai_at)) / 60000;
    cek(`batas waktu sesuai durasi subtes (${urut[0].durasi_menit} menit)`, Math.abs(menitBatas - urut[0].durasi_menit) < 0.01, `${menitBatas}`);
    const soalT = r.data.soal;
    r = await api('PUT', `/try-out/sesi/${sesiT}/jawaban`, { soal_id: soalT[0].id, opsi_id: soalT[0].opsi[0].id, ragu: true });
    cek('simpan jawaban + ragu, ada sisa detik', r.status === 200 && r.data.tersimpan && r.data.sisa_detik > 0, JSON.stringify(r.data));
    r = await api('PUT', `/try-out/sesi/${sesiT}/jawaban`, { soal_id: soalT[0].id, opsi_id: soalT[0].opsi[2].id });
    cek('jawaban boleh diganti', r.status === 200);
    for (const s of soalT.slice(1)) await api('PUT', `/try-out/sesi/${sesiT}/jawaban`, { soal_id: s.id, opsi_id: s.opsi[1].id });
    r = await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[0].id}/mulai`);
    const lanjut = r.data.jawaban.find((j) => j.soal_id === soalT[0].id);
    cek('mulai ulang = melanjutkan (jawaban + ragu kembali)', r.status === 200 && r.data.jawaban.length === soalT.length && lanjut.opsi_id === soalT[0].opsi[2].id && lanjut.ragu === true, JSON.stringify(r.data.jawaban));
    r = await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[0].id}/selesai`);
    cek('selesai subtes pertama: skor 200-800, ada subtes berikutnya', r.status === 200 && r.data.skor_subtes >= 200 && r.data.skor_subtes <= 800 && r.data.subtes_berikutnya_id === urut[1].id && r.data.sesi_selesai === false, JSON.stringify(r.data));
    cek('jawab setelah subtes ditutup ditolak', kode(await api('PUT', `/try-out/sesi/${sesiT}/jawaban`, { soal_id: soalT[0].id, opsi_id: soalT[0].opsi[0].id })) === 'SUBTES_TERKUNCI');
    cek('buka subtes yang sudah selesai ditolak', kode(await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[0].id}/mulai`)) === 'SUBTES_TERKUNCI');
    cek('hasil sebelum semua subtes selesai ditolak', (await api('GET', `/sesi/${sesiT}/hasil`)).status === 404);
    r = await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[1].id}/mulai`);
    for (const s of r.data.soal) await api('PUT', `/try-out/sesi/${sesiT}/jawaban`, { soal_id: s.id, opsi_id: s.opsi[0].id });
    r = await api('POST', `/try-out/sesi/${sesiT}/subtes/${urut[1].id}/selesai`);
    cek('selesai subtes terakhir: sesi selesai', r.status === 200 && r.data.sesi_selesai === true && r.data.subtes_berikutnya_id === null, JSON.stringify(r.data));
    cek('try out sekali per pengguna (TRY_OUT_SUDAH_SELESAI)', kode(await api('POST', `/try-out/${to.id}/sesi`)) === 'TRY_OUT_SUDAH_SELESAI');
    r = await api('GET', `/sesi/${sesiT}/hasil`);
    cek('hasil try out: skor total, 2 subtes, soal + kunci', r.status === 200 && r.data.skor_total >= 200 && r.data.subtes.length === 2 && r.data.soal[0].soal[0].opsi.some((o) => o.is_benar), JSON.stringify(r.data).slice(0, 200));

    // ---------- 6. dashboard, rekomendasi, riwayat
    r = await api('GET', '/dashboard');
    cek('dashboard: banner belum_ada_target (belum memilih target)', r.status === 200 && r.data.banner.status === 'belum_ada_target' && r.data.try_out.length >= 1, JSON.stringify(r.data.banner));
    r = await api('GET', '/rekomendasi');
    cek('rekomendasi dari data dummy', r.status === 200 && ['materi', 'subtes', 'umum'].includes(r.data.status), JSON.stringify(r.data).slice(0, 200));
    r = await api('GET', '/riwayat');
    cek('riwayat: 1 latihan + 1 try out', r.status === 200 && r.data.total === 2 && r.data.item.some((i) => i.jenis === 'latihan') && r.data.item.some((i) => i.jenis === 'try_out'), JSON.stringify(r.data).slice(0, 250));
    cek('hasil sesi orang lain ditolak', (await api('GET', '/sesi/999999/hasil')).status === 404);

    // ---------- 6b. waktu habis (memundurkan mulai_at di data akun uji agar tidak perlu menunggu)
    await supabase.from('sesi').delete().eq('profil_id', uid);
    r = await api('POST', `/try-out/${to.id}/sesi`);
    cek('sesi baru setelah dihapus (untuk uji waktu habis)', r.status === 201, JSON.stringify(r.data));
    const sesiW = r.data.sesi_id;
    r = await api('POST', `/try-out/sesi/${sesiW}/subtes/${urut[0].id}/mulai`);
    const soalW = r.data.soal;
    await api('PUT', `/try-out/sesi/${sesiW}/jawaban`, { soal_id: soalW[0].id, opsi_id: soalW[0].opsi[0].id });
    const mundur = (menit) => new Date(Date.now() - menit * 60000).toISOString();
    await supabase.from('sesi_subtes').update({ mulai_at: mundur(urut[0].durasi_menit + 5) }).eq('sesi_id', sesiW).eq('subtes_id', urut[0].id);
    r = await api('PUT', `/try-out/sesi/${sesiW}/jawaban`, { soal_id: soalW[1].id, opsi_id: soalW[1].opsi[0].id });
    cek('jawaban setelah batas waktu -> WAKTU_HABIS', kode(r) === 'WAKTU_HABIS', JSON.stringify(r.data));
    const { data: ss1 } = await supabase.from('sesi_subtes').select('mulai_at, selesai_at, skor').eq('sesi_id', sesiW).eq('subtes_id', urut[0].id).single();
    cek('subtes ditutup tepat di batas waktunya dan sudah punya skor', ss1.selesai_at && Math.abs(new Date(ss1.selesai_at) - (new Date(ss1.mulai_at).getTime() + urut[0].durasi_menit * 60000)) < 1000 && ss1.skor !== null, JSON.stringify(ss1));
    const { data: jw } = await supabase.from('jawaban').select('is_benar').eq('sesi_id', sesiW).eq('soal_id', soalW[0].id).single();
    cek('jawaban yang sudah masuk ikut dinilai saat ditutup', jw.is_benar !== null, JSON.stringify(jw));
    r = await api('POST', `/try-out/sesi/${sesiW}/subtes/${urut[1].id}/mulai`);
    cek('subtes kedua terbuka setelah yang pertama ditutup waktu', r.status === 200, JSON.stringify(r.data).slice(0, 150));
    await supabase.from('sesi_subtes').update({ mulai_at: mundur(urut[1].durasi_menit + 5) }).eq('sesi_id', sesiW).eq('subtes_id', urut[1].id);
    r = await api('GET', `/try-out/${to.id}`);
    cek('GET detail menutup subtes kedaluwarsa -> try out selesai', r.status === 200 && r.data.status === 'selesai' && r.data.skor !== null, JSON.stringify(r.data).slice(0, 200));
    cek('hasil bisa dibuka setelah ditutup oleh waktu', (await api('GET', `/sesi/${sesiW}/hasil`)).status === 200);

    // ---------- 7. keamanan: anon key tidak boleh membaca kunci jawaban langsung
    if (process.env.SUPABASE_ANON_KEY) {
      const anon = createClient(SUPABASE_URL, process.env.SUPABASE_ANON_KEY, { auth: { persistSession: false } });
      const o = await anon.from('opsi').select('is_benar').limit(1);
      cek('RLS: anon key tidak bisa membaca tabel opsi', !o.error && o.data.length === 0, JSON.stringify(o).slice(0, 150));
    }
  } finally {
    server.close();
  }
}

main()
  .catch((e) => { gagal++; console.error('GALAT tak terduga:', e); })
  .finally(() => {
    console.log(`\nSelesai: ${lulus} lulus, ${gagal} gagal`);
    process.exit(gagal ? 1 : 0);
  });
