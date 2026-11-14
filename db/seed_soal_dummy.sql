-- =====================================================================
-- SOAL DUMMY: hanya untuk menguji alur Latihan. BUKAN soal asli.
-- Semua kode berawalan DUMMY- dan pertanyaan berawalan [DUMMY].
-- Aman dijalankan ulang. Hapus sebelum rilis (lihat bagian bawah file).
-- =====================================================================

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-001', m.id, 'mudah', '[DUMMY] Hasil dari 3/4 + 1/8 adalah ...', 'Samakan penyebut: 3/4 = 6/8, sehingga 6/8 + 1/8 = 7/8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '7/8', true),
  ('B', '4/12', false),
  ('C', '1', false),
  ('D', '5/8', false),
  ('E', '3/2', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-002', m.id, 'mudah', '[DUMMY] 15% dari 240 adalah ...', '15% x 240 = 15/100 x 240 = 36.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '24', false),
  ('B', '30', false),
  ('C', '36', true),
  ('D', '42', false),
  ('E', '48', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-003', m.id, 'sedang', '[DUMMY] FPB dari 36 dan 48 adalah ...', '36 = 2^2 x 3^2 dan 48 = 2^4 x 3. FPB mengambil pangkat terkecil: 2^2 x 3 = 12.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '8', false),
  ('C', '12', true),
  ('D', '16', false),
  ('E', '24', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-004', m.id, 'sedang', '[DUMMY] Hasil dari 2^5 x 2^3 : 2^6 adalah ...', '2^5 x 2^3 = 2^8, lalu 2^8 : 2^6 = 2^2 = 4.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '4', true),
  ('C', '8', false),
  ('D', '16', false),
  ('E', '32', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-005', m.id, 'sulit', '[DUMMY] Angka satuan dari 7^2026 adalah ...', 'Angka satuan pangkat 7 berulang setiap 4: 7, 9, 3, 1. 2026 dibagi 4 bersisa 2, jadi satuannya 9.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '3', false),
  ('C', '5', false),
  ('D', '7', false),
  ('E', '9', true)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-006', m.id, 'mudah', '[DUMMY] Sebuah persegi memiliki luas 49 cm2. Keliling persegi tersebut adalah ... cm.', 'Sisi = akar 49 = 7 cm. Keliling = 4 x 7 = 28 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '14', false),
  ('B', '21', false),
  ('C', '28', true),
  ('D', '35', false),
  ('E', '49', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-007', m.id, 'sedang', '[DUMMY] Segitiga siku-siku memiliki sisi tegak 6 cm dan 8 cm. Panjang sisi miringnya adalah ... cm.', 'Pythagoras: akar(6^2 + 8^2) = akar(100) = 10.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '9', false),
  ('B', '10', true),
  ('C', '12', false),
  ('D', '14', false),
  ('E', '100', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-008', m.id, 'sedang', '[DUMMY] Luas lingkaran berjari-jari 7 cm (pi = 22/7) adalah ... cm2.', 'L = pi x r^2 = 22/7 x 49 = 154.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '44', false),
  ('B', '49', false),
  ('C', '77', false),
  ('D', '154', true),
  ('E', '308', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-009', m.id, 'sulit', '[DUMMY] Balok berukuran 6 cm x 4 cm x 3 cm. Panjang diagonal ruangnya adalah ... cm.', 'd = akar(p^2 + l^2 + t^2) = akar(36 + 16 + 9) = akar 61.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'akar 52', false),
  ('B', 'akar 61', true),
  ('C', 'akar 72', false),
  ('D', '7', false),
  ('E', '13', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-010', m.id, 'mudah', '[DUMMY] Jika 2x + 5 = 17, maka nilai x adalah ...', '2x = 17 - 5 = 12, sehingga x = 6.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4', false),
  ('B', '5', false),
  ('C', '6', true),
  ('D', '7', false),
  ('E', '11', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-011', m.id, 'sedang', '[DUMMY] Diketahui f(x) = 3x - 2. Nilai f(4) adalah ...', 'f(4) = 3(4) - 2 = 10.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '8', false),
  ('C', '10', true),
  ('D', '12', false),
  ('E', '14', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-012', m.id, 'sulit', '[DUMMY] Akar-akar persamaan x^2 - 5x + 6 = 0 adalah p dan q. Nilai p^2 + q^2 adalah ...', 'p + q = 5 dan pq = 6. p^2 + q^2 = (p+q)^2 - 2pq = 25 - 12 = 13.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', false),
  ('B', '10', false),
  ('C', '11', false),
  ('D', '13', true),
  ('E', '25', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-013', m.id, 'mudah', '[DUMMY] Sebuah dadu dilempar satu kali. Peluang muncul mata dadu genap adalah ...', 'Mata dadu genap: 2, 4, 6 (3 dari 6 kemungkinan), peluangnya 3/6 = 1/2.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/6', false),
  ('B', '1/3', false),
  ('C', '1/2', true),
  ('D', '2/3', false),
  ('E', '5/6', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'DUMMY-014', m.id, 'sedang', '[DUMMY] Rata-rata 5 bilangan adalah 12. Jika salah satu bilangan yang bernilai 20 dikeluarkan, rata-rata 4 bilangan sisanya adalah ...', 'Jumlah awal = 5 x 12 = 60. Setelah 20 dikeluarkan sisa 40, rata-ratanya 40 : 4 = 10.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '8', false),
  ('B', '9', false),
  ('C', '10', true),
  ('D', '11', false),
  ('E', '12', false)
) as v (label, isi, is_benar)
where so.kode = 'DUMMY-014'
on conflict (soal_id, label) do nothing;

-- Pembersihan (jalankan manual bila perlu, urutan penting):
-- delete from jawaban where soal_id in (select id from soal where kode like 'DUMMY-%');
-- delete from soal    where kode like 'DUMMY-%';   -- opsi ikut terhapus (on delete cascade)
