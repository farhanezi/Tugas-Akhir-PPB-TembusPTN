-- =====================================================================
-- Soal latihan: Pengetahuan Kuantitatif (100 soal). Orisinal, ditulis untuk TembusPTN.
-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).
-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).
-- =====================================================================

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-001', m.id, 'mudah', 'Hasil dari 2/5 + 3/10 adalah ….', 'Samakan penyebut: 2/5 = 4/10, sehingga 4/10 + 3/10 = 7/10. Kesalahan umum adalah menjumlahkan pembilang dan penyebut secara langsung (5/15).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5/15', false),
  ('B', '1/2', false),
  ('C', '3/5', false),
  ('D', '7/10', true),
  ('E', '4/5', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-002', m.id, 'mudah', 'Harga sebuah sepatu Rp150.000. Karena promo, harganya naik 20% untuk edisi terbatas. Harga sepatu edisi terbatas adalah ….', 'Kenaikan 20% dari 150.000 adalah 30.000. Harga baru = 150.000 + 30.000 = Rp180.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp160.000', false),
  ('B', 'Rp170.000', false),
  ('C', 'Rp175.000', false),
  ('D', 'Rp180.000', true),
  ('E', 'Rp200.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-003', m.id, 'mudah', 'Nilai dari 5² − 3 × 4 adalah ….', 'Kerjakan pangkat dan perkalian lebih dulu: 5² = 25 dan 3 × 4 = 12, sehingga 25 − 12 = 13.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '13', true),
  ('B', '15', false),
  ('C', '17', false),
  ('D', '20', false),
  ('E', '25', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-004', m.id, 'mudah', 'KPK dari 12 dan 18 adalah ….', '12 = 2² × 3 dan 18 = 2 × 3². KPK mengambil pangkat terbesar tiap faktor: 2² × 3² = 36.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '24', false),
  ('C', '30', false),
  ('D', '36', true),
  ('E', '72', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-005', m.id, 'mudah', 'Hasil dari 0,25 × 80 adalah ….', '0,25 sama dengan 1/4, sehingga 1/4 × 80 = 20.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', false),
  ('B', '8', false),
  ('C', '10', false),
  ('D', '15', false),
  ('E', '20', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-006', m.id, 'mudah', 'Perbandingan banyak kelereng Ani dan Budi adalah 3 : 5. Jika kelereng Budi berjumlah 40, banyak kelereng Ani adalah ….', 'Satu bagian = 40 : 5 = 8. Kelereng Ani = 3 × 8 = 24.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15', false),
  ('B', '24', true),
  ('C', '30', false),
  ('D', '40', false),
  ('E', '64', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-007', m.id, 'mudah', 'Banyak bilangan prima antara 20 dan 30 adalah ….', 'Bilangan antara 20 dan 30 yang prima hanya 23 dan 29, jadi ada 2 bilangan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '2', true),
  ('C', '3', false),
  ('D', '4', false),
  ('E', '5', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-008', m.id, 'mudah', 'Nilai dari √144 + √81 adalah ….', '√144 = 12 dan √81 = 9, sehingga jumlahnya 21.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15', false),
  ('B', '18', false),
  ('C', '19', false),
  ('D', '21', true),
  ('E', '225', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-009', m.id, 'mudah', 'Jika 3ˣ⁺¹ = 81, nilai x adalah ….', '81 = 3⁴, sehingga x + 1 = 4 dan x = 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3', true),
  ('B', '4', false),
  ('C', '5', false),
  ('D', '6', false),
  ('E', '8', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-010', m.id, 'sedang', 'Hasil dari (2⁴ × 4³) : 8 adalah ….', 'Ubah ke basis 2: 4³ = 2⁶ dan 8 = 2³. Maka 2⁴ × 2⁶ : 2³ = 2⁷ = 128.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '32', false),
  ('B', '64', false),
  ('C', '96', false),
  ('D', '128', true),
  ('E', '256', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-011', m.id, 'sedang', 'Jumlah tiga bilangan genap berurutan adalah 78. Bilangan terbesar di antara ketiganya adalah ….', 'Misalkan bilangan tengahnya n, maka (n − 2) + n + (n + 2) = 3n = 78, sehingga n = 26. Bilangan terbesar = n + 2 = 28.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '20', false),
  ('B', '22', false),
  ('C', '24', false),
  ('D', '26', false),
  ('E', '28', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-012', m.id, 'sedang', 'Hasil dari (3/4 : 3/8) × 5/2 adalah ….', '3/4 : 3/8 = 3/4 × 8/3 = 2. Lalu 2 × 5/2 = 5.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5/4', false),
  ('B', '5/2', false),
  ('C', '4', false),
  ('D', '5', true),
  ('E', '15/4', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-013', m.id, 'sedang', 'Banyak bilangan bulat positif kurang dari 100 yang habis dibagi 6 adalah ….', 'Bilangan yang habis dibagi 6 dan kurang dari 100 adalah 6, 12, ..., 96. Banyaknya = 96 : 6 = 16.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '16', true),
  ('B', '17', false),
  ('C', '18', false),
  ('D', '20', false),
  ('E', '24', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-014', m.id, 'sedang', 'Sebuah tas berharga Rp400.000. Toko memberi diskon 25%, lalu diskon tambahan 20% dari harga setelah diskon pertama. Harga yang dibayar adalah ….', 'Setelah diskon 25%, harga = 400.000 × 0,75 = 300.000. Setelah diskon 20%, harga = 300.000 × 0,8 = Rp240.000. Dua diskon tidak boleh dijumlahkan menjadi 45% (itu akan menghasilkan Rp220.000).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp220.000', false),
  ('B', 'Rp240.000', true),
  ('C', 'Rp260.000', false),
  ('D', 'Rp280.000', false),
  ('E', 'Rp300.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-015', m.id, 'sedang', 'Diketahui a = 48 dan b = 72.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) FPB dari a dan b adalah 12.
(2) KPK dari a dan b adalah 144.
(3) Jumlah a dan b habis dibagi 7.
(4) Selisih b dan a habis dibagi 8.', 'FPB(48, 72) = 24, bukan 12, sehingga (1) salah. KPK = 48 × 72 : 24 = 144, sehingga (2) benar. a + b = 120 dan 120 : 7 tidak bulat, sehingga (3) salah. b − a = 24 dan 24 : 8 = 3, sehingga (4) benar. Pernyataan yang benar: (2) dan (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1), (2), dan (3) SAJA', false),
  ('B', '(1) dan (3) SAJA', false),
  ('C', '(2) dan (4) SAJA', true),
  ('D', '(4) SAJA', false),
  ('E', 'SEMUA PILIHAN', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-016', m.id, 'sedang', 'Angka satuan dari 3²⁰²⁵ adalah ….', 'Angka satuan pangkat 3 berulang dengan pola 3, 9, 7, 1 (periode 4). Karena 2025 dibagi 4 bersisa 1, angka satuannya sama dengan 3¹, yaitu 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '3', true),
  ('C', '5', false),
  ('D', '7', false),
  ('E', '9', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-017', m.id, 'sedang', 'Uang Andi, Bima, dan Cici berjumlah Rp70.000 dengan perbandingan Andi : Bima : Cici = 8 : 12 : 15. Uang Cici adalah ….', 'Jumlah perbandingan = 8 + 12 + 15 = 35. Uang Cici = 15/35 × 70.000 = Rp30.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp16.000', false),
  ('B', 'Rp20.000', false),
  ('C', 'Rp24.000', false),
  ('D', 'Rp28.000', false),
  ('E', 'Rp30.000', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-018', m.id, 'sedang', 'Pak Rahmat menabung Rp2.000.000 dengan bunga tunggal 6% per tahun. Setelah 9 bulan, jumlah tabungannya adalah ….', 'Bunga 9 bulan = 2.000.000 × 6% × 9/12 = 90.000. Jumlah tabungan = 2.000.000 + 90.000 = Rp2.090.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp2.060.000', false),
  ('B', 'Rp2.090.000', true),
  ('C', 'Rp2.120.000', false),
  ('D', 'Rp2.180.000', false),
  ('E', 'Rp2.270.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-019', m.id, 'sedang', 'Bilangan bulat positif terkecil yang jika dibagi 7 bersisa 3 dan jika dibagi 5 bersisa 2 adalah ….', 'Bilangan yang bersisa 3 jika dibagi 7: 3, 10, 17, 24, ... Periksa sisa pembagian 5: 3 (sisa 3), 10 (sisa 0), 17 (sisa 2). Jadi bilangan terkecilnya 17.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', false),
  ('B', '10', false),
  ('C', '12', false),
  ('D', '17', true),
  ('E', '22', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-020', m.id, 'mudah', 'Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = 30% dari 80
Q = 40% dari 60', 'P = 0,3 × 80 = 24 dan Q = 0,4 × 60 = 24. Kedua kuantitas sama besar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', false),
  ('C', 'Kuantitas P sama dengan Q.', true),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-021', m.id, 'sedang', 'Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = 2³⁰
Q = 3²⁰', 'Samakan pangkatnya: 2³⁰ = (2³)¹⁰ = 8¹⁰ dan 3²⁰ = (3²)¹⁰ = 9¹⁰. Karena 8 < 9 dengan pangkat yang sama, P kurang dari Q.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', true),
  ('C', 'Kuantitas P sama dengan Q.', false),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-022', m.id, 'sedang', 'Bilangan real x memenuhi x² = 16. Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = x
Q = 0', 'Persamaan x² = 16 memberi x = 4 atau x = −4. Jika x = 4, P lebih dari Q, tetapi jika x = −4, P kurang dari Q. Hubungan keduanya tidak dapat ditentukan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', false),
  ('C', 'Kuantitas P sama dengan Q.', false),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-023', m.id, 'sedang', 'Apakah bilangan bulat n habis dibagi 6?
Putuskan apakah pernyataan (1) dan (2) berikut cukup untuk menjawab pertanyaan tersebut.
(1) n habis dibagi 3.
(2) n adalah bilangan genap.', 'Pernyataan (1) saja tidak cukup (n bisa 9 yang tidak habis dibagi 6). Pernyataan (2) saja juga tidak cukup (n bisa 4). Jika keduanya digabung, n habis dibagi 2 dan 3 sehingga pasti habis dibagi 6. Jadi dua pernyataan bersama-sama cukup, tetapi satu pernyataan saja tidak cukup.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (2) SAJA tidak cukup.', false),
  ('B', 'Pernyataan (2) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (1) SAJA tidak cukup.', false),
  ('C', 'DUA pernyataan BERSAMA-SAMA cukup untuk menjawab pertanyaan, tetapi SATU pernyataan SAJA tidak cukup.', true),
  ('D', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan dan pernyataan (2) SAJA cukup.', false),
  ('E', 'Pernyataan (1) dan pernyataan (2) tidak cukup untuk menjawab pertanyaan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-024', m.id, 'sulit', 'Jumlah semua digit dari bilangan 2¹² × 5⁹ adalah ….', '2¹² × 5⁹ = 2³ × (2⁹ × 5⁹) = 8 × 10⁹ = 8.000.000.000. Jumlah digitnya 8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '8', true),
  ('B', '9', false),
  ('C', '10', false),
  ('D', '12', false),
  ('E', '14', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-025', m.id, 'sulit', 'Banyak pembagi positif dari 360 adalah ….', '360 = 2³ × 3² × 5¹. Banyak pembagi positif = (3 + 1)(2 + 1)(1 + 1) = 4 × 3 × 2 = 24.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '18', false),
  ('B', '20', false),
  ('C', '24', true),
  ('D', '30', false),
  ('E', '36', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-026', m.id, 'sulit', 'Angka satuan dari 2²⁰²⁶ + 3²⁰²⁶ adalah ….', 'Angka satuan 2ⁿ berulang 2, 4, 8, 6 dan angka satuan 3ⁿ berulang 3, 9, 7, 1, keduanya berperiode 4. 2026 dibagi 4 bersisa 2, sehingga satuan 2²⁰²⁶ adalah 4 dan satuan 3²⁰²⁶ adalah 9. Jumlahnya 4 + 9 = 13, jadi angka satuannya 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '3', true),
  ('C', '5', false),
  ('D', '7', false),
  ('E', '9', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-026'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-027', m.id, 'sulit', 'Kran A dapat mengisi penuh sebuah bak dalam 6 jam, kran B dalam 12 jam, sedangkan kebocoran di dasar bak dapat mengosongkan bak penuh dalam 36 jam. Jika kedua kran dibuka bersamaan dengan kebocoran yang tetap ada, bak yang kosong akan penuh dalam ….', 'Dalam 1 jam, kran A mengisi 1/6 bagian, kran B 1/12 bagian, dan kebocoran mengurangi 1/36 bagian. Laju bersih = 6/36 + 3/36 − 1/36 = 8/36 = 2/9 bagian per jam. Waktu penuh = 1 : 2/9 = 9/2 = 4,5 jam.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3 jam', false),
  ('B', '3,5 jam', false),
  ('C', '4 jam', false),
  ('D', '4,2 jam', false),
  ('E', '4,5 jam', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-027'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-BIL-028', m.id, 'sulit', 'Bilangan bulat positif terkecil n sehingga 1.440n merupakan kuadrat sempurna adalah ….', '1.440 = 2⁵ × 3² × 5. Agar menjadi kuadrat sempurna, semua pangkat prima harus genap. Pangkat 2 dan 5 masih ganjil, sehingga n minimal 2 × 5 = 10. Hasilnya 14.400 = 120².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Bilangan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '5', false),
  ('C', '10', true),
  ('D', '20', false),
  ('E', '40', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-BIL-028'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-001', m.id, 'mudah', 'Sebuah persegi panjang berukuran 12 cm × 5 cm. Panjang diagonalnya adalah ... cm.', 'Diagonal persegi panjang membentuk segitiga siku-siku dengan sisi 12 dan 5. Panjang diagonal = √(12² + 5²) = √169 = 13 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '13', true),
  ('B', '14', false),
  ('C', '15', false),
  ('D', '17', false),
  ('E', '60', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-002', m.id, 'mudah', 'Keliling sebuah lingkaran adalah 44 cm (π = 22/7). Jari-jari lingkaran tersebut adalah ... cm.', 'Keliling = 2πr, sehingga r = 44 : (2 × 22/7) = 44 : (44/7) = 7 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', false),
  ('B', '7', true),
  ('C', '11', false),
  ('D', '14', false),
  ('E', '22', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-003', m.id, 'mudah', 'Sebuah segitiga memiliki alas 10 cm dan tinggi 8 cm. Luas segitiga tersebut adalah ... cm².', 'Luas segitiga = ½ × alas × tinggi = ½ × 10 × 8 = 40 cm². Jika lupa mengalikan ½, hasilnya 80.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '18', false),
  ('B', '28', false),
  ('C', '40', true),
  ('D', '80', false),
  ('E', '100', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-004', m.id, 'mudah', 'Volume sebuah kubus dengan panjang rusuk 6 cm adalah ... cm³.', 'Volume kubus = rusuk³ = 6 × 6 × 6 = 216 cm³.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '36', false),
  ('B', '108', false),
  ('C', '144', false),
  ('D', '216', true),
  ('E', '324', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-005', m.id, 'mudah', 'Dua sudut sebuah segitiga berukuran 50° dan 60°. Besar sudut ketiga adalah ….', 'Jumlah sudut dalam segitiga 180°. Sudut ketiga = 180° − 50° − 60° = 70°.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '40°', false),
  ('B', '50°', false),
  ('C', '60°', false),
  ('D', '65°', false),
  ('E', '70°', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-006', m.id, 'mudah', 'Sebuah trapesium memiliki sisi sejajar 8 cm dan 12 cm serta tinggi 5 cm. Luas trapesium tersebut adalah ... cm².', 'Luas trapesium = ½ × (jumlah sisi sejajar) × tinggi = ½ × (8 + 12) × 5 = 50 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '50', true),
  ('B', '60', false),
  ('C', '80', false),
  ('D', '100', false),
  ('E', '120', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-007', m.id, 'mudah', 'Jumlah seluruh sudut dalam sebuah segi enam adalah ….', 'Jumlah sudut dalam segi-n = (n − 2) × 180°. Untuk n = 6, jumlahnya 4 × 180° = 720°.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '540°', false),
  ('B', '720°', true),
  ('C', '900°', false),
  ('D', '1.080°', false),
  ('E', '1.260°', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-008', m.id, 'sedang', 'Sebuah tabung memiliki jari-jari alas 7 cm dan tinggi 10 cm. Dengan π = 22/7, volume tabung tersebut adalah ... cm³.', 'Volume tabung = πr²t = 22/7 × 49 × 10 = 22 × 7 × 10 = 1.540 cm³.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '440', false),
  ('B', '770', false),
  ('C', '1.540', true),
  ('D', '3.080', false),
  ('E', '6.160', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-009', m.id, 'sedang', 'Sebuah kubus memiliki volume 125 cm³. Luas permukaan kubus tersebut adalah ... cm².', 'Rusuk kubus = ∛125 = 5 cm. Luas permukaan = 6 × rusuk² = 6 × 25 = 150 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '75', false),
  ('B', '100', false),
  ('C', '125', false),
  ('D', '150', true),
  ('E', '250', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-010', m.id, 'sedang', 'Sebuah juring lingkaran memiliki sudut pusat 90° dan jari-jari 14 cm. Dengan π = 22/7, luas juring tersebut adalah ... cm².', 'Luas juring = (90°/360°) × πr² = ¼ × 22/7 × 196 = ¼ × 616 = 154 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '49', false),
  ('B', '77', false),
  ('C', '98', false),
  ('D', '132', false),
  ('E', '154', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-011', m.id, 'sedang', 'Diagonal-diagonal sebuah belah ketupat panjangnya 16 cm dan 12 cm. Keliling belah ketupat tersebut adalah ... cm.', 'Diagonal saling berpotongan tegak lurus di tengah, membentuk segitiga siku-siku dengan sisi 8 dan 6. Sisi belah ketupat = √(64 + 36) = 10 cm. Keliling = 4 × 10 = 40 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '40', true),
  ('B', '44', false),
  ('C', '48', false),
  ('D', '56', false),
  ('E', '96', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-012', m.id, 'sedang', 'Sebuah tangga sepanjang 13 m bersandar pada dinding tegak. Jarak kaki tangga ke dinding adalah 5 m. Tinggi ujung atas tangga dari tanah adalah ... m.', 'Tangga, dinding, dan tanah membentuk segitiga siku-siku dengan sisi miring 13 m. Tinggi = √(13² − 5²) = √(169 − 25) = √144 = 12 m.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '8', false),
  ('B', '12', true),
  ('C', '14', false),
  ('D', '15', false),
  ('E', '18', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-013', m.id, 'sedang', 'Jarak antara titik A(2, 3) dan titik B(8, 11) pada bidang koordinat adalah ….', 'Selisih koordinat x = 6 dan selisih koordinat y = 8. Jarak = √(6² + 8²) = √100 = 10.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
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
where so.kode = 'PK-GEO-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-014', m.id, 'sedang', 'Segitiga dengan titik sudut O(0, 0), P(6, 0), dan Q(0, 8) memiliki luas ….', 'Segitiga siku-siku di O dengan alas OP = 6 dan tinggi OQ = 8. Luas = ½ × 6 × 8 = 24.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '12', false),
  ('B', '14', false),
  ('C', '20', false),
  ('D', '24', true),
  ('E', '48', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-015', m.id, 'sulit', 'Segitiga ABC sebangun dengan segitiga PQR. Sisi AB = 6 cm bersesuaian dengan sisi PQ = 9 cm. Jika luas segitiga ABC adalah 24 cm², luas segitiga PQR adalah ... cm².', 'Perbandingan luas dua bangun sebangun sama dengan kuadrat perbandingan sisi. Luas PQR = 24 × (9/6)² = 24 × 9/4 = 54 cm². Jika memakai perbandingan sisi saja tanpa dikuadratkan, hasilnya 36 (salah).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '36', false),
  ('B', '40', false),
  ('C', '45', false),
  ('D', '48', false),
  ('E', '54', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-016', m.id, 'sedang', 'Sebuah kerucut memiliki jari-jari alas 3 cm dan tinggi 4 cm. Luas selimut kerucut tersebut adalah ... cm².', 'Garis pelukis kerucut s = √(3² + 4²) = 5 cm. Luas selimut = πrs = π × 3 × 5 = 15π cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15π', true),
  ('B', '20π', false),
  ('C', '24π', false),
  ('D', '36π', false),
  ('E', '48π', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-017', m.id, 'sedang', 'Sebuah segitiga sama kaki memiliki panjang kaki 13 cm dan alas 10 cm. Luas segitiga tersebut adalah ... cm².', 'Garis tinggi dari puncak membagi alas menjadi dua bagian 5 cm. Tinggi = √(13² − 5²) = 12 cm. Luas = ½ × 10 × 12 = 60 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '30', false),
  ('B', '60', true),
  ('C', '65', false),
  ('D', '120', false),
  ('E', '130', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-018', m.id, 'sedang', 'Dua garis sejajar dipotong oleh sebuah garis lain. Dua sudut dalam sepihak berukuran (3x + 20)° dan (5x − 40)°. Nilai x adalah ….', 'Sudut dalam sepihak berjumlah 180°. Maka (3x + 20) + (5x − 40) = 180, yaitu 8x − 20 = 180 dan x = 25. Pengecekan: 95° + 85° = 180°.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '20', false),
  ('B', '22', false),
  ('C', '25', true),
  ('D', '28', false),
  ('E', '30', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-019', m.id, 'sedang', 'Sebuah prisma tegak memiliki alas berbentuk segitiga siku-siku dengan sisi tegak 6 cm dan 8 cm. Jika tinggi prisma 10 cm, volume prisma tersebut adalah ... cm³.', 'Luas alas = ½ × 6 × 8 = 24 cm². Volume = luas alas × tinggi = 24 × 10 = 240 cm³.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '48', false),
  ('B', '120', false),
  ('C', '160', false),
  ('D', '240', true),
  ('E', '480', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-020', m.id, 'sedang', 'Sebuah persegi panjang berukuran 12 cm × 8 cm berkeliling 40 cm. Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = luas persegi panjang tersebut
Q = luas persegi yang juga berkeliling 40 cm', 'Luas persegi panjang P = 12 × 8 = 96 cm². Persegi berkeliling 40 cm memiliki sisi 10 cm, sehingga Q = 100 cm². Jadi P kurang dari Q. Untuk keliling yang sama, persegi memberikan luas terbesar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', true),
  ('C', 'Kuantitas P sama dengan Q.', false),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-021', m.id, 'sulit', 'Sebuah balok berukuran 8 cm × 6 cm × 24 cm.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Volume balok adalah 1.152 cm³.
(2) Luas permukaan balok adalah 768 cm².
(3) Panjang diagonal ruang balok adalah 26 cm.
(4) Panjang diagonal bidang pada sisi berukuran 8 cm × 6 cm adalah 12 cm.', '(1) Volume = 8 × 6 × 24 = 1.152, benar. (2) Luas permukaan = 2(48 + 192 + 144) = 768, benar. (3) Diagonal ruang = √(64 + 36 + 576) = √676 = 26, benar. (4) Diagonal bidang 8 × 6 = √(64 + 36) = 10, bukan 12, sehingga salah. Pernyataan benar: (1), (2), dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1), (2), dan (3) SAJA', true),
  ('B', '(1) dan (3) SAJA', false),
  ('C', '(2) dan (4) SAJA', false),
  ('D', '(4) SAJA', false),
  ('E', 'SEMUA PILIHAN', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-022', m.id, 'sulit', 'Persegi panjang ABCD memiliki keliling 28 cm, dengan AB = 8 cm.
Apakah luas persegi panjang ABCD lebih dari 48 cm²?
Putuskan apakah pernyataan (1) dan (2) berikut cukup untuk menjawab pertanyaan tersebut.
(1) Keliling persegi panjang ABCD adalah 28 cm.
(2) Panjang AB adalah 8 cm.', 'Pernyataan (1) saja tidak cukup: panjang + lebar = 14, sehingga luas bisa 48 (6 × 8), 40 (4 × 10), atau 49 (7 × 7). Pernyataan (2) saja tidak cukup karena sisi lainnya belum diketahui. Bersama-sama, sisi lainnya 14 − 8 = 6 cm sehingga luas tepat 48 cm² dan tidak lebih dari 48. Jawabannya pasti, jadi dua pernyataan bersama-sama cukup.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (2) SAJA tidak cukup.', false),
  ('B', 'Pernyataan (2) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (1) SAJA tidak cukup.', false),
  ('C', 'DUA pernyataan BERSAMA-SAMA cukup untuk menjawab pertanyaan, tetapi SATU pernyataan SAJA tidak cukup.', true),
  ('D', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan dan pernyataan (2) SAJA cukup.', false),
  ('E', 'Pernyataan (1) dan pernyataan (2) tidak cukup untuk menjawab pertanyaan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-023', m.id, 'sulit', 'Sebuah lingkaran terletak tepat di dalam persegi berukuran sisi 14 cm (lingkaran menyinggung keempat sisi persegi). Dengan π = 22/7, luas daerah di dalam persegi tetapi di luar lingkaran adalah ... cm².', 'Diameter lingkaran = sisi persegi = 14 cm, sehingga r = 7 cm. Luas lingkaran = 22/7 × 49 = 154 cm². Luas persegi = 196 cm². Daerah di luar lingkaran = 196 − 154 = 42 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '21', false),
  ('B', '42', true),
  ('C', '49', false),
  ('D', '154', false),
  ('E', '196', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-GEO-024', m.id, 'sulit', 'Segitiga ABC siku-siku di B dengan AB = 6 cm dan BC = 8 cm. Titik D terletak pada AC sehingga BD tegak lurus AC. Panjang BD adalah ... cm.', 'AC = √(36 + 64) = 10 cm. Luas segitiga dapat dihitung dengan dua cara: ½ × AB × BC = ½ × AC × BD. Maka 6 × 8 = 10 × BD, sehingga BD = 4,8 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Geometri'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3,6', false),
  ('B', '4,2', false),
  ('C', '4,5', false),
  ('D', '4,8', true),
  ('E', '5,0', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-GEO-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-001', m.id, 'mudah', 'Jika 3x − 7 = 14, nilai x adalah ….', '3x = 14 + 7 = 21, sehingga x = 21 : 3 = 7.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '7', true),
  ('B', '9', false),
  ('C', '11', false),
  ('D', '14', false),
  ('E', '21', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-002', m.id, 'mudah', 'Diketahui f(x) = 2x² − 3. Nilai f(3) adalah ….', 'f(3) = 2(3)² − 3 = 2 × 9 − 3 = 18 − 3 = 15.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3', false),
  ('B', '9', false),
  ('C', '12', false),
  ('D', '14', false),
  ('E', '15', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-003', m.id, 'mudah', 'Jika x + y = 10 dan x − y = 4, nilai x adalah ….', 'Jumlahkan kedua persamaan: 2x = 14, sehingga x = 7 (dan y = 3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3', false),
  ('B', '5', false),
  ('C', '7', true),
  ('D', '9', false),
  ('E', '14', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-004', m.id, 'mudah', 'Gradien garis yang melalui titik (1, 2) dan (3, 8) adalah ….', 'Gradien = (y₂ − y₁)/(x₂ − x₁) = (8 − 2)/(3 − 1) = 6/2 = 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '3', true),
  ('C', '4', false),
  ('D', '6', false),
  ('E', '8', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-005', m.id, 'mudah', 'Himpunan penyelesaian dari 2x + 5 > 11 adalah ….', '2x > 11 − 5 = 6, sehingga x > 3. Tanda pertidaksamaan tidak berubah karena kedua ruas dibagi bilangan positif.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'x < 3', false),
  ('B', 'x > 8', false),
  ('C', 'x < 8', false),
  ('D', 'x > 3', true),
  ('E', 'x > 6', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-006', m.id, 'mudah', 'Hasil kali akar-akar persamaan x² − 7x + 12 = 0 adalah ….', 'Untuk ax² + bx + c = 0, hasil kali akar = c/a = 12/1 = 12. Akar-akarnya 3 dan 4, sehingga 3 × 4 = 12. Angka 7 adalah jumlah akar-akarnya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '−7', false),
  ('B', '3', false),
  ('C', '4', false),
  ('D', '7', false),
  ('E', '12', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-007', m.id, 'mudah', 'Diketahui f(x) = x + 4 dan g(x) = 2x. Nilai (f ∘ g)(5) adalah ….', '(f ∘ g)(5) = f(g(5)). g(5) = 10, lalu f(10) = 10 + 4 = 14. Urutan terbalik, (g ∘ f)(5), menghasilkan 18.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '14', true),
  ('B', '18', false),
  ('C', '20', false),
  ('D', '24', false),
  ('E', '29', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-008', m.id, 'mudah', 'Jika 3(x − 2) = 2(x + 1), nilai x adalah ….', '3x − 6 = 2x + 2, sehingga x = 2 + 6 = 8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4', false),
  ('B', '6', false),
  ('C', '8', true),
  ('D', '10', false),
  ('E', '12', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-009', m.id, 'sedang', 'Persamaan garis yang melalui titik (0, −3) dengan gradien 2 adalah ….', 'Titik (0, −3) berada pada sumbu y sehingga c = −3. Dengan gradien 2, persamaan garisnya y = 2x − 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'y = −2x − 3', false),
  ('B', 'y = 2x + 3', false),
  ('C', 'y = 2x − 3', true),
  ('D', 'y = −3x + 2', false),
  ('E', 'y = 3x − 2', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-010', m.id, 'sedang', 'Diketahui a dan b bilangan real. Berapakah nilai a + b?
Putuskan apakah pernyataan (1) dan (2) berikut cukup untuk menjawab pertanyaan tersebut.
(1) a − b = 2.
(2) a = b + 2.', 'Pernyataan (1) dan (2) memuat informasi yang sama, yaitu a − b = 2. Dengan satu persamaan untuk dua bilangan, nilai a + b tidak dapat ditentukan (misalnya a = 3, b = 1 memberi 4, sedangkan a = 5, b = 3 memberi 8). Jadi pernyataan (1) dan (2) tidak cukup, bahkan bila digabungkan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (2) SAJA tidak cukup.', false),
  ('B', 'Pernyataan (2) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (1) SAJA tidak cukup.', false),
  ('C', 'DUA pernyataan BERSAMA-SAMA cukup untuk menjawab pertanyaan, tetapi SATU pernyataan SAJA tidak cukup.', false),
  ('D', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan dan pernyataan (2) SAJA cukup.', false),
  ('E', 'Pernyataan (1) dan pernyataan (2) tidak cukup untuk menjawab pertanyaan.', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-011', m.id, 'sedang', 'Himpunan penyelesaian dari x² − 4x − 5 ≤ 0 adalah ….', 'Faktorkan: (x − 5)(x + 1) ≤ 0. Pembuat nolnya x = −1 dan x = 5. Parabola terbuka ke atas, sehingga nilainya ≤ 0 di antara kedua akar: −1 ≤ x ≤ 5.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '−1 ≤ x ≤ 5', true),
  ('B', 'x ≤ −1 atau x ≥ 5', false),
  ('C', '−5 ≤ x ≤ 1', false),
  ('D', 'x ≤ −5 atau x ≥ 1', false),
  ('E', '1 ≤ x ≤ 5', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-012', m.id, 'sedang', 'Jika 2x + 3y = 12 dan x − y = 1, nilai xy adalah ….', 'Dari x − y = 1 diperoleh x = y + 1. Substitusi: 2(y + 1) + 3y = 12, sehingga 5y = 10 dan y = 2, lalu x = 3. Maka xy = 3 × 2 = 6.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '2', false),
  ('C', '3', false),
  ('D', '5', false),
  ('E', '6', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-013', m.id, 'sedang', 'Diketahui f(x) = 3x − 5.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) f(2) = 1.
(2) f⁻¹(10) = 3.
(3) f⁻¹(x) = (x + 5)/3.
(4) Grafik f memotong sumbu y di titik (0, 5).', '(1) f(2) = 6 − 5 = 1, benar. (2) f⁻¹(10) = (10 + 5)/3 = 5, bukan 3, sehingga salah. (3) Invers dari y = 3x − 5 adalah x = (y + 5)/3, benar. (4) f(0) = −5, sehingga grafik memotong sumbu y di (0, −5), salah. Pernyataan benar: (1) dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1), (2), dan (3) SAJA', false),
  ('B', '(1) dan (3) SAJA', true),
  ('C', '(2) dan (4) SAJA', false),
  ('D', '(4) SAJA', false),
  ('E', 'SEMUA PILIHAN', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-014', m.id, 'sedang', 'Nilai minimum fungsi y = x² − 6x + 5 adalah ….', 'Titik puncak berada di x = −b/(2a) = 6/2 = 3. Nilai minimum = 3² − 6(3) + 5 = 9 − 18 + 5 = −4.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '−9', false),
  ('B', '−6', false),
  ('C', '−5', false),
  ('D', '−4', true),
  ('E', '5', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-015', m.id, 'sedang', 'Jika a + b = 5 dan ab = 6, nilai a² + b² adalah ….', 'a² + b² = (a + b)² − 2ab = 25 − 12 = 13. Bentuk (a + b)² saja bernilai 25.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '13', true),
  ('B', '19', false),
  ('C', '25', false),
  ('D', '31', false),
  ('E', '37', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-016', m.id, 'sedang', 'Harga 2 buku dan 3 pensil adalah Rp19.000, sedangkan harga 3 buku dan 2 pensil adalah Rp21.000. Harga 1 buku dan 1 pensil adalah ….', 'Jumlahkan kedua persamaan: 5 buku + 5 pensil = 40.000, sehingga 1 buku + 1 pensil = Rp8.000. (Harga satuannya: buku Rp5.000 dan pensil Rp3.000.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp7.000', false),
  ('B', 'Rp8.000', true),
  ('C', 'Rp8.500', false),
  ('D', 'Rp9.000', false),
  ('E', 'Rp9.500', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-017', m.id, 'sedang', 'Jumlah semua nilai x yang memenuhi |2x − 3| = 7 adalah ….', '|2x − 3| = 7 berarti 2x − 3 = 7 atau 2x − 3 = −7. Diperoleh x = 5 atau x = −2. Jumlahnya 5 + (−2) = 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '2', false),
  ('C', '3', true),
  ('D', '5', false),
  ('E', '7', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-018', m.id, 'sedang', 'Diketahui f(x) = −x² + 4x + 1.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Grafik f terbuka ke atas.
(2) Nilai maksimum f adalah 5.
(3) Sumbu simetri grafik f adalah x = −2.
(4) f(0) = 1.', '(1) Koefisien x² negatif (−1), sehingga grafik terbuka ke bawah; pernyataan salah. (2) Sumbu simetri x = −4/(2 × (−1)) = 2, nilai maksimum = −4 + 8 + 1 = 5, benar. (3) Sumbu simetri x = 2, bukan −2, salah. (4) f(0) = 1, benar. Pernyataan benar: (2) dan (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1), (2), dan (3) SAJA', false),
  ('B', '(1) dan (3) SAJA', false),
  ('C', '(2) dan (4) SAJA', true),
  ('D', '(4) SAJA', false),
  ('E', 'SEMUA PILIHAN', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-019', m.id, 'sedang', 'Diketahui f(x) = x² + 1 dan g(x) = x − 2. Nilai (g ∘ f)(3) adalah ….', '(g ∘ f)(3) = g(f(3)). f(3) = 9 + 1 = 10, lalu g(10) = 10 − 2 = 8. Jika urutannya terbalik, (f ∘ g)(3) = f(1) = 2.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '8', true),
  ('C', '10', false),
  ('D', '11', false),
  ('E', '12', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-020', m.id, 'sedang', 'Diketahui fungsi f(x) = x² − 4x + 7. Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = nilai minimum f(x)
Q = 3', 'Titik puncak di x = 4/2 = 2, sehingga nilai minimum f = 4 − 8 + 7 = 3. Jadi P = 3 dan Q = 3, kedua kuantitas sama.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', false),
  ('C', 'Kuantitas P sama dengan Q.', true),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-021', m.id, 'sedang', 'Bilangan real a bernilai positif dan bilangan real b bernilai negatif. Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = a − b
Q = a + b', 'Selisih P − Q = (a − b) − (a + b) = −2b. Karena b negatif, −2b positif, sehingga P selalu lebih dari Q untuk semua nilai a dan b yang memenuhi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', true),
  ('B', 'Kuantitas P kurang dari Q.', false),
  ('C', 'Kuantitas P sama dengan Q.', false),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-022', m.id, 'sulit', 'Persamaan kuadrat x² − 6x + k = 0 memiliki dua akar real yang selisihnya 4. Nilai k adalah ….', 'Misalkan akarnya x₁ dan x₂ dengan x₁ + x₂ = 6 dan x₁ − x₂ = 4. Diperoleh x₁ = 5 dan x₂ = 1. Maka k = x₁ × x₂ = 5.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', true),
  ('B', '8', false),
  ('C', '9', false),
  ('D', '10', false),
  ('E', '12', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-023', m.id, 'sulit', 'Jika f(x − 1) = 2x + 3, nilai f(5) adalah ….', 'Agar x − 1 = 5, dipilih x = 6. Maka f(5) = 2(6) + 3 = 15. Menyubstitusi x = 5 langsung (13) adalah kesalahan umum.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '9', false),
  ('B', '11', false),
  ('C', '13', false),
  ('D', '15', true),
  ('E', '17', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-024', m.id, 'sulit', 'Persamaan kuadrat x² + px + 12 = 0 memiliki akar-akar x₁ dan x₂ dengan x₁² + x₂² = 25. Nilai p² adalah ….', 'x₁ + x₂ = −p dan x₁x₂ = 12. Maka x₁² + x₂² = (x₁ + x₂)² − 2x₁x₂ = p² − 24 = 25, sehingga p² = 49.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '25', false),
  ('B', '36', false),
  ('C', '49', true),
  ('D', '64', false),
  ('E', '81', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-025', m.id, 'sulit', 'Parabola y = x² + bx + c memotong sumbu x di titik (1, 0) dan (3, 0). Nilai b + c adalah ….', 'Karena memotong sumbu x di x = 1 dan x = 3, y = (x − 1)(x − 3) = x² − 4x + 3. Maka b = −4 dan c = 3, sehingga b + c = −1.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '−4', false),
  ('B', '−1', true),
  ('C', '0', false),
  ('D', '3', false),
  ('E', '4', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-ALJ-026', m.id, 'sulit', 'Jika x + y = 7 dan xy = 10, nilai x³ + y³ adalah ….', 'Gunakan identitas x³ + y³ = (x + y)³ − 3xy(x + y) = 343 − 3 × 10 × 7 = 343 − 210 = 133. Nilai 343 hanyalah (x + y)³.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Aljabar dan Fungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '133', true),
  ('B', '147', false),
  ('C', '153', false),
  ('D', '169', false),
  ('E', '343', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-ALJ-026'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-001', m.id, 'mudah', 'Rata-rata dari data 4, 6, 8, 10, dan 12 adalah ….', 'Jumlah data = 4 + 6 + 8 + 10 + 12 = 40. Rata-rata = 40 : 5 = 8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4', false),
  ('B', '5', false),
  ('C', '6', false),
  ('D', '7', false),
  ('E', '8', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-002', m.id, 'mudah', 'Median dari data 3, 9, 5, 7, dan 1 adalah ….', 'Urutkan data: 1, 3, 5, 7, 9. Karena banyak data 5 (ganjil), median adalah data tengah, yaitu 5. Median tidak boleh diambil dari data yang belum diurutkan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3', false),
  ('B', '4', false),
  ('C', '5', true),
  ('D', '6', false),
  ('E', '7', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-003', m.id, 'mudah', 'Modus dari data 2, 3, 3, 4, 5, 3, 6 adalah ….', 'Modus adalah nilai yang paling sering muncul. Angka 3 muncul tiga kali, lebih banyak daripada angka lain.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '3', true),
  ('B', '4', false),
  ('C', '5', false),
  ('D', '6', false),
  ('E', '7', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-004', m.id, 'mudah', 'Sebuah kartu diambil secara acak dari 10 kartu bernomor 1 sampai 10. Peluang terambil kartu bernomor genap adalah ….', 'Kartu bernomor genap: 2, 4, 6, 8, 10 (5 kartu) dari 10 kartu. Peluangnya 5/10 = 1/2.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/5', false),
  ('B', '1/2', true),
  ('C', '3/5', false),
  ('D', '7/10', false),
  ('E', '9/10', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-005', m.id, 'mudah', 'Dalam sebuah kantong terdapat 3 bola merah dan 5 bola biru. Satu bola diambil secara acak. Peluang terambil bola biru adalah ….', 'Total bola = 3 + 5 = 8, dengan 5 di antaranya biru. Peluang = 5/8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/8', false),
  ('B', '3/8', false),
  ('C', '1/2', false),
  ('D', '3/5', false),
  ('E', '5/8', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-006', m.id, 'sedang', 'Sembilan siswa memiliki rata-rata nilai 70. Setelah satu siswa lagi dengan nilai 80 bergabung, rata-rata nilai kesepuluh siswa menjadi ….', 'Jumlah nilai sembilan siswa = 9 × 70 = 630. Setelah ditambah 80 menjadi 710. Rata-rata baru = 710 : 10 = 71.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '71', true),
  ('B', '72', false),
  ('C', '73', false),
  ('D', '75', false),
  ('E', '80', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-007', m.id, 'sedang', 'Median dari data 2, 4, 4, 5, 7, 8, 9, 10 adalah ….', 'Data sudah terurut dan berjumlah 8 (genap). Median = rata-rata dua data tengah, yaitu data ke-4 (5) dan ke-5 (7): (5 + 7)/2 = 6.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4', false),
  ('B', '5', false),
  ('C', '6', true),
  ('D', '7', false),
  ('E', '8', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-008', m.id, 'sedang', 'Dua buah dadu dilempar bersamaan satu kali. Peluang jumlah mata kedua dadu sama dengan 8 adalah ….', 'Pasangan dengan jumlah 8: (2,6), (3,5), (4,4), (5,3), (6,2), yaitu 5 pasangan dari 36 kemungkinan. Peluangnya 5/36.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/12', false),
  ('B', '5/36', true),
  ('C', '1/6', false),
  ('D', '7/36', false),
  ('E', '1/4', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-009', m.id, 'sedang', 'Dari 7 orang akan dipilih 3 orang untuk mengikuti lomba, tanpa memperhatikan urutan. Banyak cara memilih adalah ….', 'Karena urutan tidak diperhatikan, gunakan kombinasi: C(7,3) = 7!/(3! × 4!) = (7 × 6 × 5)/(3 × 2 × 1) = 35.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '10', false),
  ('B', '21', false),
  ('C', '30', false),
  ('D', '35', true),
  ('E', '42', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-010', m.id, 'sedang', 'Dari 5 orang calon akan dipilih seorang ketua, seorang sekretaris, dan seorang bendahara (tidak ada yang merangkap). Banyak susunan pengurus yang mungkin adalah ….', 'Karena jabatan berbeda, urutan diperhatikan sehingga memakai permutasi: P(5,3) = 5 × 4 × 3 = 60.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '10', false),
  ('B', '15', false),
  ('C', '60', true),
  ('D', '120', false),
  ('E', '125', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-011', m.id, 'sedang', 'Kelas A terdiri atas 40 siswa dengan rata-rata nilai 72, sedangkan kelas B terdiri atas 60 siswa dengan rata-rata nilai 82. Rata-rata nilai seluruh siswa kedua kelas adalah ….', 'Jumlah nilai kelas A = 40 × 72 = 2.880 dan kelas B = 60 × 82 = 4.920. Rata-rata gabungan = (2.880 + 4.920) : 100 = 78. Nilai 77 adalah kesalahan karena hanya merata-ratakan 72 dan 82.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '72', false),
  ('B', '77', false),
  ('C', '78', true),
  ('D', '80', false),
  ('E', '82', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-012', m.id, 'sedang', 'Sebuah kotak berisi 4 bola merah dan 6 bola putih. Dua bola diambil satu per satu tanpa pengembalian. Peluang kedua bola yang terambil berwarna merah adalah ….', 'Peluang bola pertama merah = 4/10. Setelah satu merah diambil, tersisa 3 merah dari 9 bola, sehingga peluang kedua merah = 3/9. Peluang keduanya = 4/10 × 3/9 = 12/90 = 2/15. (Nilai 4/25 muncul bila pengambilan dengan pengembalian.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/15', false),
  ('B', '2/15', true),
  ('C', '4/25', false),
  ('D', '4/15', false),
  ('E', '2/5', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-013', m.id, 'sedang', 'Sebuah koin dilempar tiga kali. Peluang muncul paling sedikit satu sisi angka adalah ….', 'Gunakan komplemen. Peluang tidak ada angka sama sekali (ketiganya gambar) = 1/8. Maka peluang paling sedikit satu angka = 1 − 1/8 = 7/8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/8', false),
  ('B', '1/2', false),
  ('C', '5/8', false),
  ('D', '3/4', false),
  ('E', '7/8', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-014', m.id, 'sedang', 'Nilai ujian sekelompok siswa disajikan pada tabel berikut.
Nilai 6 : 2 siswa
Nilai 7 : 5 siswa
Nilai 8 : 8 siswa
Nilai 9 : 3 siswa
Nilai 10 : 2 siswa
Rata-rata nilai siswa tersebut adalah ….', 'Jumlah siswa = 2 + 5 + 8 + 3 + 2 = 20. Jumlah nilai = 12 + 35 + 64 + 27 + 20 = 158. Rata-rata = 158 : 20 = 7,9.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '7,5', false),
  ('B', '7,7', false),
  ('C', '7,8', false),
  ('D', '7,9', true),
  ('E', '8,1', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-015', m.id, 'sedang', 'Diketahui data: 2, 4, 4, 6, 8, 12.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Rata-rata data adalah 5.
(2) Median data adalah 5.
(3) Modus data adalah 6.
(4) Jangkauan data adalah 10.', '(1) Rata-rata = 36 : 6 = 6, bukan 5, sehingga salah. (2) Median = (4 + 6)/2 = 5, benar. (3) Modus adalah 4 (muncul dua kali), bukan 6, salah. (4) Jangkauan = 12 − 2 = 10, benar. Pernyataan benar: (2) dan (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1), (2), dan (3) SAJA', false),
  ('B', '(1) dan (3) SAJA', false),
  ('C', '(2) dan (4) SAJA', true),
  ('D', '(4) SAJA', false),
  ('E', 'SEMUA PILIHAN', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-016', m.id, 'sedang', 'Sebuah dadu dilempar satu kali. Berdasarkan informasi yang diberikan, manakah hubungan antara kuantitas P dan Q berikut yang benar?
P = peluang muncul mata dadu prima
Q = peluang muncul mata dadu yang merupakan faktor dari 6', 'Mata dadu prima: 2, 3, 5, sehingga P = 3/6 = 1/2. Faktor dari 6 yang ada pada dadu: 1, 2, 3, 6, sehingga Q = 4/6 = 2/3. Karena 1/2 < 2/3, P kurang dari Q.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuantitas P lebih dari Q.', false),
  ('B', 'Kuantitas P kurang dari Q.', true),
  ('C', 'Kuantitas P sama dengan Q.', false),
  ('D', 'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-017', m.id, 'sedang', 'Terdapat lima bilangan bulat. Apakah rata-rata kelima bilangan tersebut lebih dari 10?
Putuskan apakah pernyataan (1) dan (2) berikut cukup untuk menjawab pertanyaan tersebut.
(1) Median kelima bilangan tersebut adalah 12.
(2) Jumlah kelima bilangan tersebut adalah 55.', 'Pernyataan (1) saja tidak cukup: median 12 tidak menentukan rata-rata (misalnya 1, 2, 12, 13, 14 memiliki rata-rata 8,4 sedangkan 10, 11, 12, 13, 14 memiliki rata-rata 12). Pernyataan (2) saja cukup karena rata-rata = 55 : 5 = 11, yang lebih dari 10. Jadi hanya pernyataan (2) yang cukup.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (2) SAJA tidak cukup.', false),
  ('B', 'Pernyataan (2) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (1) SAJA tidak cukup.', true),
  ('C', 'DUA pernyataan BERSAMA-SAMA cukup untuk menjawab pertanyaan, tetapi SATU pernyataan SAJA tidak cukup.', false),
  ('D', 'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan dan pernyataan (2) SAJA cukup.', false),
  ('E', 'Pernyataan (1) dan pernyataan (2) tidak cukup untuk menjawab pertanyaan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-018', m.id, 'sulit', 'Empat siswa dan tiga siswi akan duduk berjajar dalam satu baris. Jika ketiga siswi harus duduk berdampingan, banyak susunan duduk yang mungkin adalah ….', 'Anggap ketiga siswi sebagai satu kelompok. Bersama 4 siswa, ada 5 objek yang diatur dalam 5! = 120 cara. Di dalam kelompok, siswi dapat diatur dalam 3! = 6 cara. Total = 120 × 6 = 720. Nilai 5.040 (7!) mengabaikan syarat berdampingan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '720', true),
  ('B', '1.440', false),
  ('C', '2.880', false),
  ('D', '4.320', false),
  ('E', '5.040', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-019', m.id, 'sulit', 'Dari 6 pria dan 4 wanita akan dibentuk tim beranggotakan 4 orang dengan syarat minimal terdapat 2 wanita. Banyak tim yang dapat dibentuk adalah ….', 'Ada tiga kemungkinan. Dua wanita dan dua pria: C(4,2) × C(6,2) = 6 × 15 = 90. Tiga wanita dan satu pria: C(4,3) × C(6,1) = 4 × 6 = 24. Empat wanita: C(4,4) = 1. Total = 90 + 24 + 1 = 115.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '90', false),
  ('B', '115', true),
  ('C', '120', false),
  ('D', '155', false),
  ('E', '210', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-020', m.id, 'sulit', 'Banyak bilangan tiga angka yang habis dibagi 5 dan semua angkanya berbeda adalah ….', 'Angka satuan harus 0 atau 5. Jika satuannya 0: angka ratusan 9 pilihan (1 sampai 9) dan puluhan 8 pilihan, sehingga 9 × 8 = 72. Jika satuannya 5: ratusan 8 pilihan (1 sampai 9 kecuali 5) dan puluhan 8 pilihan (0 sampai 9 kecuali 5 dan angka ratusan), sehingga 8 × 8 = 64. Total = 72 + 64 = 136.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '100', false),
  ('B', '120', false),
  ('C', '128', false),
  ('D', '136', true),
  ('E', '144', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-021', m.id, 'sulit', 'Rata-rata lima bilangan adalah 8. Jika rata-rata tiga bilangan pertama adalah 7, rata-rata dua bilangan terakhir adalah ….', 'Jumlah kelima bilangan = 5 × 8 = 40. Jumlah tiga bilangan pertama = 3 × 7 = 21. Jumlah dua bilangan terakhir = 40 − 21 = 19, sehingga rata-ratanya 19 : 2 = 9,5.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '8', false),
  ('B', '8,5', false),
  ('C', '9', false),
  ('D', '9,2', false),
  ('E', '9,5', true)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PK-STA-022', m.id, 'sulit', 'Tiga buah dadu dilempar bersamaan satu kali. Peluang jumlah ketiga mata dadu sama dengan 10 adalah ….', 'Banyak hasil seluruhnya 6³ = 216. Susunan terurut dengan jumlah 10 ada 27: (1,3,6) dan (1,4,5) masing-masing 6 susunan, (2,2,6) dan (3,3,4) masing-masing 3 susunan, (2,3,5) 6 susunan, serta (2,4,4) 3 susunan, sehingga 6 + 6 + 3 + 3 + 6 + 3 = 27. Peluangnya 27/216 = 1/8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan Kuantitatif' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1/12', false),
  ('B', '1/9', false),
  ('C', '1/8', true),
  ('D', '5/36', false),
  ('E', '1/6', false)
) as v (label, isi, is_benar)
where so.kode = 'PK-STA-022'
on conflict (soal_id, label) do nothing;
