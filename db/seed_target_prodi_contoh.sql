-- TembusPTN: target prodi CONTOH (12 baris) supaya halaman Pilih Target bisa dicoba.
-- SEMUA skor_target di sini ANGKA KARANGAN pada skala estimasi 200-800, BUKAN data asli.
-- Baris contoh ditandai sumber = 'CONTOH'. Ganti dengan data publik asli sebelum rilis.
-- Aman dijalankan ulang (Supabase > SQL Editor > tempel > Run).

insert into target_prodi (ptn, prodi, skor_target, sumber, tahun) values
  ('Institut Teknologi Bandung', 'STEI-K', 695, 'CONTOH', 2025),
  ('Institut Teknologi Bandung', 'FTI', 672, 'CONTOH', 2025),
  ('Institut Teknologi Bandung', 'FMIPA', 641, 'CONTOH', 2025),
  ('Universitas Indonesia', 'Ilmu Komputer', 702, 'CONTOH', 2025),
  ('Universitas Indonesia', 'Teknik Elektro', 655, 'CONTOH', 2025),
  ('Universitas Gadjah Mada', 'Teknologi Informasi', 668, 'CONTOH', 2025),
  ('Universitas Gadjah Mada', 'Ilmu Komputer', 674, 'CONTOH', 2025),
  ('Institut Teknologi Sepuluh Nopember', 'Teknik Informatika', 655, 'CONTOH', 2025),
  ('Institut Teknologi Sepuluh Nopember', 'Sistem Informasi', 632, 'CONTOH', 2025),
  ('Universitas Diponegoro', 'Informatika', 628, 'CONTOH', 2025),
  ('Universitas Diponegoro', 'Teknik Komputer', 615, 'CONTOH', 2025),
  ('Universitas Brawijaya', 'Teknik Informatika', 622, 'CONTOH', 2025)
on conflict (ptn, prodi) do update
  set skor_target = excluded.skor_target, sumber = excluded.sumber, tahun = excluded.tahun;

-- PEMBERSIHAN (jalankan sebelum rilis, setelah data asli masuk).
-- Pengguna yang memilih target contoh akan kembali tanpa target.
-- update profil set target_prodi_id = null
--   where target_prodi_id in (select id from target_prodi where sumber = 'CONTOH');
-- delete from target_prodi where sumber = 'CONTOH';
