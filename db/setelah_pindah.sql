-- =====================================================================
-- Jalankan di SQL Editor proyek BARU, sesudah api/scripts/pindah-db.js --jalankan selesai.
-- Menyalin baris dengan id tetap tidak menggeser penghitung id otomatis, sehingga
-- tanpa ini seed berikutnya (mis. soal baru) bisa gagal karena id bentrok.
-- Aman dijalankan ulang.
-- =====================================================================
select setval(pg_get_serial_sequence('materi',       'id'), coalesce((select max(id) from materi),       0) + 1, false);
select setval(pg_get_serial_sequence('submateri',    'id'), coalesce((select max(id) from submateri),    0) + 1, false);
select setval(pg_get_serial_sequence('wacana',       'id'), coalesce((select max(id) from wacana),       0) + 1, false);
select setval(pg_get_serial_sequence('try_out',      'id'), coalesce((select max(id) from try_out),      0) + 1, false);
select setval(pg_get_serial_sequence('soal',         'id'), coalesce((select max(id) from soal),         0) + 1, false);
select setval(pg_get_serial_sequence('opsi',         'id'), coalesce((select max(id) from opsi),         0) + 1, false);
select setval(pg_get_serial_sequence('target_prodi', 'id'), coalesce((select max(id) from target_prodi), 0) + 1, false);
