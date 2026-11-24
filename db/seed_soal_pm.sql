-- =====================================================================
-- Soal latihan: Penalaran Matematika (100 soal). Orisinal, ditulis untuk TembusPTN.
-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).
-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).
-- =====================================================================

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-BAS-001') then
    insert into wacana (isi) values ('Toko Langkah Baru membeli 40 pasang sepatu dengan harga Rp180.000 per pasang. Biaya angkut seluruh sepatu Rp400.000. Sepatu ditawarkan dengan label harga Rp260.000 per pasang. Pada minggu pertama terjual 25 pasang sesuai label harga, lalu sisanya dijual dengan diskon 20% dari label harga dan habis terjual.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-001', m.id, w, 'mudah', 'Total modal yang dikeluarkan toko (harga pembelian ditambah biaya angkut) adalah ….', 'Harga pembelian = 40 × 180.000 = 7.200.000. Ditambah biaya angkut 400.000, total modal = Rp7.600.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp7.200.000', false),
      ('B', 'Rp7.600.000', true),
      ('C', 'Rp7.800.000', false),
      ('D', 'Rp8.000.000', false),
      ('E', 'Rp8.400.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-002', m.id, w, 'mudah', 'Pendapatan toko dari penjualan minggu pertama adalah ….', 'Pada minggu pertama terjual 25 pasang dengan harga label Rp260.000, sehingga pendapatannya 25 × 260.000 = Rp6.500.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp5.800.000', false),
      ('B', 'Rp6.200.000', false),
      ('C', 'Rp6.400.000', false),
      ('D', 'Rp6.500.000', true),
      ('E', 'Rp7.800.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-003', m.id, w, 'sedang', 'Harga jual sepasang sepatu setelah diskon 20% adalah ….', 'Diskon 20% dari 260.000 adalah 52.000. Harga setelah diskon = 260.000 − 52.000 = Rp208.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp208.000', true),
      ('B', 'Rp220.000', false),
      ('C', 'Rp234.000', false),
      ('D', 'Rp240.000', false),
      ('E', 'Rp250.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-004', m.id, w, 'sulit', 'Laba yang diperoleh toko dari seluruh penjualan sepatu adalah ….', 'Sepatu yang dijual dengan diskon = 40 − 25 = 15 pasang, pendapatannya 15 × 208.000 = 3.120.000. Total pendapatan = 6.500.000 + 3.120.000 = 9.620.000. Laba = 9.620.000 − 7.600.000 = Rp2.020.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp1.420.000', false),
      ('B', 'Rp1.620.000', false),
      ('C', 'Rp1.820.000', false),
      ('D', 'Rp1.920.000', false),
      ('E', 'Rp2.020.000', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-BAS-005') then
    insert into wacana (isi) values ('Dina menabung Rp5.000.000 pada sebuah bank dengan bunga tunggal 8% per tahun. Bunga yang diperoleh dikenai pajak sebesar 20% dari besar bunga tersebut, dan pajak langsung dipotong dari bunga.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-005', m.id, w, 'mudah', 'Bunga yang diterima Dina selama 18 bulan, sebelum dikenai pajak, adalah ….', 'Bunga = pokok × persentase × lama (tahun) = 5.000.000 × 8% × 1,5 = Rp600.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp400.000', false),
      ('B', 'Rp500.000', false),
      ('C', 'Rp600.000', true),
      ('D', 'Rp800.000', false),
      ('E', 'Rp900.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-006', m.id, w, 'sedang', 'Besar pajak atas bunga selama 18 bulan adalah ….', 'Bunga 18 bulan = Rp600.000. Pajak 20% dari bunga = 0,2 × 600.000 = Rp120.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp120.000', true),
      ('B', 'Rp160.000', false),
      ('C', 'Rp200.000', false),
      ('D', 'Rp240.000', false),
      ('E', 'Rp300.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-007', m.id, w, 'sedang', 'Setelah pajak dipotong, total uang yang diterima Dina pada akhir bulan ke-18 adalah ….', 'Bunga bersih = 600.000 − 120.000 = 480.000. Total uang = 5.000.000 + 480.000 = Rp5.480.000. Angka Rp5.600.000 belum memperhitungkan pajak.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp5.120.000', false),
      ('B', 'Rp5.380.000', false),
      ('C', 'Rp5.400.000', false),
      ('D', 'Rp5.480.000', true),
      ('E', 'Rp5.600.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-008', m.id, w, 'sulit', 'Dina ingin memperoleh bunga bersih (setelah pajak) sebesar Rp640.000. Lama Dina harus menabung adalah ….', 'Bunga bersih 640.000 adalah 80% dari bunga kotor, sehingga bunga kotor = 640.000 : 0,8 = 800.000. Bunga per bulan = 5.000.000 × 8% : 12 ≈ 33.333. Lama = 800.000 : 33.333 = 24 bulan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '12 bulan', false),
      ('B', '24 bulan', true),
      ('C', '30 bulan', false),
      ('D', '36 bulan', false),
      ('E', '48 bulan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-BAS-009') then
    insert into wacana (isi) values ('Pada sebuah peta berskala 1 : 250.000, jarak kota P ke kota Q adalah 12 cm. Budi berangkat dari kota P pukul 07.30 mengendarai sepeda motor dengan kecepatan tetap 45 km/jam menuju kota Q.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-009', m.id, w, 'mudah', 'Jarak sebenarnya antara kota P dan kota Q adalah ….', 'Jarak sebenarnya = 12 cm × 250.000 = 3.000.000 cm = 30.000 m = 30 km.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '3 km', false),
      ('B', '12 km', false),
      ('C', '18 km', false),
      ('D', '25 km', false),
      ('E', '30 km', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-010', m.id, w, 'sedang', 'Waktu yang dibutuhkan Budi untuk menempuh perjalanan dari P ke Q adalah ….', 'Waktu = jarak : kecepatan = 30 km : 45 km/jam = 2/3 jam = 40 menit.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '30 menit', false),
      ('B', '35 menit', false),
      ('C', '40 menit', true),
      ('D', '45 menit', false),
      ('E', '50 menit', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-011', m.id, w, 'sedang', 'Budi tiba di kota Q pada pukul ….', 'Budi berangkat pukul 07.30 dan menempuh perjalanan selama 40 menit, sehingga tiba pukul 07.30 + 0.40 = 08.10.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '08.10', true),
      ('B', '08.15', false),
      ('C', '08.20', false),
      ('D', '08.30', false),
      ('E', '08.40', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-BAS-012', m.id, w, 'sulit', 'Jika Budi mengendarai motor dengan kecepatan tetap 60 km/jam, perjalanan P ke Q akan lebih cepat ... dibandingkan dengan kecepatan 45 km/jam.', 'Dengan 60 km/jam, waktu tempuh = 30 : 60 = 0,5 jam = 30 menit. Dengan 45 km/jam waktunya 40 menit. Selisihnya 40 − 30 = 10 menit.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '5 menit', false),
      ('B', '8 menit', false),
      ('C', '9 menit', false),
      ('D', '10 menit', true),
      ('E', '15 menit', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-BAS-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-013', m.id, 'mudah', 'Harga sebuah barang Rp100.000. Harga tersebut dinaikkan 10%, kemudian diturunkan 10% dari harga setelah naik. Harga akhir barang tersebut adalah ….', 'Setelah naik 10%: 100.000 × 1,1 = 110.000. Setelah turun 10%: 110.000 × 0,9 = Rp99.000. Kenaikan dan penurunan persentase yang sama tidak saling meniadakan karena dasar perhitungannya berbeda.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp90.000', false),
  ('B', 'Rp95.000', false),
  ('C', 'Rp99.000', true),
  ('D', 'Rp100.000', false),
  ('E', 'Rp110.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-014', m.id, 'sedang', 'Sebuah proyek dapat diselesaikan oleh 8 pekerja dalam 15 hari. Jika proyek yang sama dikerjakan oleh 12 pekerja dengan kemampuan yang sama, proyek selesai dalam ….', 'Banyak pekerja dan lama pengerjaan berbanding terbalik. Total beban kerja = 8 × 15 = 120 pekerja-hari. Dengan 12 pekerja: 120 : 12 = 10 hari.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '8 hari', false),
  ('B', '10 hari', true),
  ('C', '12 hari', false),
  ('D', '20 hari', false),
  ('E', '22,5 hari', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-015', m.id, 'sedang', 'Sebuah pita sepanjang 150 cm dipotong 2/5 bagian untuk membungkus kado. Dari sisa pita, 1/3 bagian dipakai untuk hiasan. Panjang pita yang masih tersisa adalah ….', 'Pita yang dipotong = 2/5 × 150 = 60 cm, sisa 90 cm. Hiasan memakai 1/3 × 90 = 30 cm. Sisa akhir = 90 − 30 = 60 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '30 cm', false),
  ('B', '45 cm', false),
  ('C', '50 cm', false),
  ('D', '55 cm', false),
  ('E', '60 cm', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-016', m.id, 'sedang', 'Seorang pedagang menjual sebuah barang seharga Rp270.000 dan mengalami kerugian 10%. Harga pembelian barang tersebut adalah ….', 'Rugi 10% berarti harga jual = 90% dari harga beli. Harga beli = 270.000 : 0,9 = Rp300.000. Menambah 10% pada harga jual (Rp297.000) adalah kesalahan karena persentase dihitung dari harga beli.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp243.000', false),
  ('B', 'Rp297.000', false),
  ('C', 'Rp300.000', true),
  ('D', 'Rp310.000', false),
  ('E', 'Rp324.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-017', m.id, 'sedang', 'Sebuah lahan digambar pada peta berskala 1 : 2.000 dengan luas 50 cm² pada peta. Luas lahan sebenarnya adalah ….', 'Pada luas, perbandingan skala dikuadratkan. Luas sebenarnya = 50 × 2.000² cm² = 200.000.000 cm². Karena 1 m² = 10.000 cm², luasnya 20.000 m².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '100 m²', false),
  ('B', '2.000 m²', false),
  ('C', '10.000 m²', false),
  ('D', '20.000 m²', true),
  ('E', '200.000 m²', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-018', m.id, 'mudah', 'Sebuah mobil menempuh 12 km untuk setiap 1 liter bensin. Harga bensin Rp10.000 per liter. Biaya bensin untuk perjalanan 180 km adalah ….', 'Bensin yang dibutuhkan = 180 : 12 = 15 liter. Biaya = 15 × 10.000 = Rp150.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp120.000', false),
  ('B', 'Rp135.000', false),
  ('C', 'Rp150.000', true),
  ('D', 'Rp180.000', false),
  ('E', 'Rp216.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-019', m.id, 'sulit', 'Lampu A berkedip setiap 6 detik dan lampu B berkedip setiap 8 detik. Keduanya berkedip bersamaan pada detik ke-0. Dalam rentang detik ke-1 sampai detik ke-180, kedua lampu berkedip bersamaan sebanyak ... kali.', 'Kedua lampu berkedip bersamaan setiap KPK(6, 8) = 24 detik, yaitu pada detik ke-24, 48, 72, ... Banyaknya dalam 180 detik = ⌊180 : 24⌋ = 7 kali (detik ke-24 sampai ke-168).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '7', true),
  ('B', '8', false),
  ('C', '9', false),
  ('D', '10', false),
  ('E', '12', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-BAS-020', m.id, 'sulit', 'Sebanyak 40 liter larutan gula berkadar 25% ditambah 10 liter air murni. Kadar gula larutan sekarang adalah ….', 'Banyak gula = 25% × 40 = 10 liter. Volume larutan baru = 40 + 10 = 50 liter. Kadar baru = 10/50 = 20%.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Bilangan dan Aritmetika Sosial'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15%', false),
  ('B', '20%', true),
  ('C', '22,5%', false),
  ('D', '25%', false),
  ('E', '30%', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-BAS-020'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-PBH-001') then
    insert into wacana (isi) values ('Pak Rudi menyusun balok kayu menjadi tangga bertingkat. Tingkat pertama (paling atas) berisi 3 balok, tingkat kedua 5 balok, tingkat ketiga 7 balok, dan seterusnya dengan pertambahan balok yang tetap pada setiap tingkat berikutnya.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-001', m.id, w, 'mudah', 'Banyak balok pada tingkat ke-10 adalah ….', 'Barisan aritmetika dengan suku pertama 3 dan beda 2. Suku ke-10 = 3 + (10 − 1) × 2 = 21 balok.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '21', true),
      ('B', '23', false),
      ('C', '25', false),
      ('D', '27', false),
      ('E', '30', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-002', m.id, w, 'sedang', 'Banyak balok yang dibutuhkan untuk membuat tangga sampai tingkat ke-10 adalah ….', 'Jumlah n suku pertama deret aritmetika: Sₙ = n/2 × (U₁ + Uₙ). S₁₀ = 10/2 × (3 + 21) = 5 × 24 = 120 balok.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '100', false),
      ('B', '110', false),
      ('C', '120', true),
      ('D', '130', false),
      ('E', '210', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-003', m.id, w, 'sedang', 'Pak Rudi hanya memiliki 260 balok. Banyak tingkat tangga terbanyak yang dapat dibuat secara penuh adalah ….', 'Sₙ = n/2 × (2 × 3 + (n − 1) × 2) = n(n + 2). Untuk n = 15 diperlukan 15 × 17 = 255 balok (cukup), sedangkan n = 16 memerlukan 16 × 18 = 288 balok (tidak cukup). Jadi tangga terbanyak 15 tingkat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '12', false),
      ('B', '13', false),
      ('C', '14', false),
      ('D', '15', true),
      ('E', '16', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-004', m.id, w, 'sulit', 'Setelah tangga dengan tingkat terbanyak selesai dibuat dari 260 balok, banyak balok yang tersisa adalah ….', 'Tangga 15 tingkat memerlukan 15 × 17 = 255 balok. Sisa balok = 260 − 255 = 5.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '0', false),
      ('B', '5', true),
      ('C', '8', false),
      ('D', '15', false),
      ('E', '17', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-PBH-005') then
    insert into wacana (isi) values ('Sebuah koloni bakteri awalnya berjumlah 50 sel. Setiap 3 jam, setiap sel membelah menjadi dua sel.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-005', m.id, w, 'mudah', 'Jumlah bakteri setelah 12 jam adalah ….', 'Dalam 12 jam terjadi 12 : 3 = 4 kali pembelahan. Jumlah bakteri = 50 × 2⁴ = 50 × 16 = 800.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '200', false),
      ('B', '400', false),
      ('C', '800', true),
      ('D', '1.600', false),
      ('E', '3.200', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-006', m.id, w, 'sedang', 'Jumlah bakteri mencapai 1.600 sel setelah ... jam.', '1.600 : 50 = 32 = 2⁵, berarti terjadi 5 kali pembelahan. Waktunya = 5 × 3 jam = 15 jam.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '6', false),
      ('B', '9', false),
      ('C', '12', false),
      ('D', '15', true),
      ('E', '18', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-007', m.id, w, 'mudah', 'Selisih jumlah bakteri pada jam ke-12 dan jam ke-9 adalah ….', 'Pada jam ke-9 terjadi 3 pembelahan, jumlahnya 50 × 8 = 400. Pada jam ke-12 jumlahnya 800. Selisihnya 800 − 400 = 400.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '400', true),
      ('B', '450', false),
      ('C', '600', false),
      ('D', '750', false),
      ('E', '800', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-008', m.id, w, 'sulit', 'Setelah 18 jam, sebanyak 40% bakteri mati karena pemberian antibiotik. Jumlah bakteri yang masih hidup adalah ….', 'Dalam 18 jam terjadi 6 kali pembelahan, sehingga jumlahnya 50 × 2⁶ = 3.200. Bakteri yang hidup 60% × 3.200 = 1.920.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1.280', false),
      ('B', '1.600', false),
      ('C', '1.800', false),
      ('D', '1.900', false),
      ('E', '1.920', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-PBH-009') then
    insert into wacana (isi) values ('Dari 60 siswa kelas XII, 35 siswa gemar basket, 28 siswa gemar voli, dan 12 siswa gemar keduanya.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-009', m.id, w, 'mudah', 'Banyak siswa yang gemar basket saja adalah ….', 'Yang gemar basket saja = gemar basket − gemar keduanya = 35 − 12 = 23 siswa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '12', false),
      ('B', '23', true),
      ('C', '28', false),
      ('D', '35', false),
      ('E', '47', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-010', m.id, w, 'mudah', 'Banyak siswa yang tidak gemar basket maupun voli adalah ….', 'Siswa yang gemar basket atau voli = 35 + 28 − 12 = 51. Yang tidak gemar keduanya = 60 − 51 = 9 siswa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '5', false),
      ('B', '7', false),
      ('C', '9', true),
      ('D', '12', false),
      ('E', '16', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-011', m.id, w, 'sedang', 'Banyak siswa yang gemar tepat satu dari kedua olahraga tersebut adalah ….', 'Basket saja = 35 − 12 = 23 dan voli saja = 28 − 12 = 16. Gemar tepat satu = 23 + 16 = 39 siswa. Angka 51 adalah banyak siswa yang gemar sekurang-kurangnya satu olahraga.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '28', false),
      ('B', '35', false),
      ('C', '37', false),
      ('D', '39', true),
      ('E', '51', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-PBH-012', m.id, w, 'sulit', 'Satu siswa dipilih secara acak dari 60 siswa tersebut. Peluang siswa yang terpilih gemar voli saja adalah ….', 'Siswa yang gemar voli saja = 28 − 12 = 16. Peluang = 16/60 = 4/15.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '4/15', true),
      ('B', '1/3', false),
      ('C', '7/15', false),
      ('D', '7/12', false),
      ('E', '3/5', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-PBH-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-013', m.id, 'mudah', 'Diberikan barisan 2, 5, 10, 17, 26, ... Suku ke-8 barisan tersebut adalah ….', 'Suku-sukunya mengikuti pola n² + 1: 1² + 1 = 2, 2² + 1 = 5, 3² + 1 = 10, dan seterusnya. Suku ke-8 = 8² + 1 = 65.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '50', false),
  ('B', '55', false),
  ('C', '60', false),
  ('D', '64', false),
  ('E', '65', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-014', m.id, 'sedang', 'Pada suatu barisan aritmetika, suku ke-5 adalah 17 dan suku ke-9 adalah 33. Suku ke-20 barisan tersebut adalah ….', 'Beda b = (33 − 17)/(9 − 5) = 4. Suku pertama a = 17 − 4 × 4 = 1. Suku ke-20 = 1 + 19 × 4 = 77.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '70', false),
  ('B', '77', true),
  ('C', '79', false),
  ('D', '80', false),
  ('E', '82', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-015', m.id, 'sedang', 'Jumlah enam suku pertama barisan 3, 6, 12, 24, ... adalah ….', 'Barisan geometri dengan a = 3 dan rasio r = 2. S₆ = a(rⁿ − 1)/(r − 1) = 3(64 − 1)/1 = 189.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '96', false),
  ('B', '126', false),
  ('C', '189', true),
  ('D', '192', false),
  ('E', '378', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-016', m.id, 'sedang', 'Diketahui n(A) = 20, n(B) = 15, dan n(A ∩ B) = 5. Nilai n(A ∪ B) adalah ….', 'n(A ∪ B) = n(A) + n(B) − n(A ∩ B) = 20 + 15 − 5 = 30.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15', false),
  ('B', '20', false),
  ('C', '25', false),
  ('D', '30', true),
  ('E', '40', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-017', m.id, 'sedang', 'Sebuah segitiga sama sisi disusun dari 3 batang korek api. Dua segitiga yang berdampingan memerlukan 5 batang, tiga segitiga berdampingan memerlukan 7 batang, dan seterusnya dengan pola tetap. Banyak batang korek api untuk membuat 25 segitiga berdampingan adalah ….', 'Banyak batang membentuk barisan 3, 5, 7, ... dengan rumus suku ke-n: 2n + 1. Untuk n = 25 diperoleh 2 × 25 + 1 = 51 batang. Mengalikan 3 × 25 = 75 mengabaikan sisi yang dipakai bersama.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '51', true),
  ('B', '53', false),
  ('C', '60', false),
  ('D', '75', false),
  ('E', '77', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-018', m.id, 'sedang', 'Bilangan segitiga membentuk barisan 1, 3, 6, 10, 15, ... Suku ke-12 barisan tersebut adalah ….', 'Suku ke-n bilangan segitiga adalah n(n + 1)/2. Untuk n = 12: 12 × 13/2 = 78.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '66', false),
  ('B', '78', true),
  ('C', '84', false),
  ('D', '90', false),
  ('E', '144', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-019', m.id, 'sulit', 'Diketahui A = {1, 2, 3, 4, 5}. Banyak himpunan bagian dari A yang memuat anggota 1 tetapi tidak memuat anggota 5 adalah ….', 'Anggota 1 harus ada dan anggota 5 tidak boleh ada. Anggota yang bebas dipilih hanya 2, 3, dan 4, masing-masing boleh masuk atau tidak. Banyak himpunan bagian = 2³ = 8.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '3', false),
  ('C', '4', false),
  ('D', '6', false),
  ('E', '8', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-PBH-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-PBH-020', m.id, 'sulit', 'Diketahui barisan aritmetika 4, 9, 14, 19, ...
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Suku ke-10 adalah 49.
(2) Beda barisan adalah 5.
(3) Jumlah 10 suku pertama adalah 265.
(4) Bilangan 126 merupakan anggota barisan.', '(1) U₁₀ = 4 + 9 × 5 = 49, benar. (2) Beda = 9 − 4 = 5, benar. (3) S₁₀ = 10/2 × (4 + 49) = 265, benar. (4) Anggota barisan berbentuk 4 + 5(n − 1), sehingga selisih dengan 4 harus kelipatan 5. 126 − 4 = 122 bukan kelipatan 5, jadi salah. Pernyataan benar: (1), (2), dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Pola Bilangan dan Himpunan'
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
where so.kode = 'PM-PBH-020'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-AFP-001') then
    insert into wacana (isi) values ('Sebuah bioskop menjual tiket reguler seharga Rp40.000 dan tiket VIP seharga Rp70.000. Pada satu pertunjukan terjual 120 tiket dengan total pendapatan Rp6.000.000.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-001', m.id, w, 'mudah', 'Banyak tiket VIP yang terjual pada pertunjukan tersebut adalah ….', 'Misalkan tiket VIP = y, sehingga reguler = 120 − y. Pendapatan: 40.000(120 − y) + 70.000y = 6.000.000, yaitu 4.800.000 + 30.000y = 6.000.000. Maka y = 1.200.000 : 30.000 = 40 tiket.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '20', false),
      ('B', '30', false),
      ('C', '40', true),
      ('D', '80', false),
      ('E', '90', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-002', m.id, w, 'mudah', 'Pendapatan dari penjualan tiket reguler adalah ….', 'Tiket VIP = 40, sehingga tiket reguler = 120 − 40 = 80. Pendapatan reguler = 80 × 40.000 = Rp3.200.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp3.200.000', true),
      ('B', 'Rp3.600.000', false),
      ('C', 'Rp4.000.000', false),
      ('D', 'Rp4.800.000', false),
      ('E', 'Rp5.200.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-003', m.id, w, 'sedang', 'Pada pertunjukan lain terjual 120 tiket dengan total pendapatan Rp7.200.000. Banyak tiket VIP yang terjual adalah ….', 'Dengan cara yang sama: 40.000(120 − y) + 70.000y = 7.200.000, yaitu 4.800.000 + 30.000y = 7.200.000. Maka y = 2.400.000 : 30.000 = 80 tiket.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '50', false),
      ('B', '60', false),
      ('C', '70', false),
      ('D', '80', true),
      ('E', '90', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-004', m.id, w, 'sedang', 'Perbandingan banyak tiket reguler dan tiket VIP pada pertunjukan pertama adalah ….', 'Pada pertunjukan pertama terjual 80 tiket reguler dan 40 tiket VIP. Perbandingannya 80 : 40 = 2 : 1.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1 : 2', false),
      ('B', '1 : 3', false),
      ('C', '3 : 1', false),
      ('D', '3 : 2', false),
      ('E', '2 : 1', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-AFP-005') then
    insert into wacana (isi) values ('Taksi A menetapkan tarif buka Rp8.000 ditambah Rp4.000 untuk setiap kilometer. Taksi B menetapkan tarif buka Rp12.000 ditambah Rp3.000 untuk setiap kilometer.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-005', m.id, w, 'mudah', 'Biaya perjalanan sejauh 10 km dengan Taksi A adalah ….', 'Biaya = tarif buka + tarif per km × jarak = 8.000 + 4.000 × 10 = Rp48.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp40.000', false),
      ('B', 'Rp48.000', true),
      ('C', 'Rp52.000', false),
      ('D', 'Rp60.000', false),
      ('E', 'Rp80.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-006', m.id, w, 'sedang', 'Kedua taksi menetapkan biaya yang sama untuk perjalanan sejauh ….', 'Samakan biaya: 8.000 + 4.000x = 12.000 + 3.000x. Maka 1.000x = 4.000 sehingga x = 4 km.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '4 km', true),
      ('B', '5 km', false),
      ('C', '6 km', false),
      ('D', '8 km', false),
      ('E', '10 km', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-007', m.id, w, 'sedang', 'Untuk perjalanan sejauh 15 km, selisih biaya antara kedua taksi adalah ….', 'Taksi A: 8.000 + 4.000 × 15 = 68.000. Taksi B: 12.000 + 3.000 × 15 = 57.000. Selisihnya 68.000 − 57.000 = Rp11.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp5.000', false),
      ('B', 'Rp8.000', false),
      ('C', 'Rp9.000', false),
      ('D', 'Rp11.000', true),
      ('E', 'Rp15.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-008', m.id, w, 'sulit', 'Agar biaya Taksi B lebih hemat paling sedikit Rp20.000 dibandingkan Taksi A, jarak perjalanan minimal harus ….', 'Selisih biaya A − B = (8.000 + 4.000x) − (12.000 + 3.000x) = 1.000x − 4.000. Syaratnya 1.000x − 4.000 ≥ 20.000, sehingga x ≥ 24 km.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '20 km', false),
      ('B', '22 km', false),
      ('C', '24 km', true),
      ('D', '26 km', false),
      ('E', '28 km', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-AFP-009') then
    insert into wacana (isi) values ('Pak Anton memiliki pagar kawat sepanjang 40 m. Ia memagari sebuah kebun berbentuk persegi panjang dengan memanfaatkan tembok sebagai salah satu sisinya, sehingga pagar hanya dipasang pada tiga sisi. Lebar kebun (sisi yang tegak lurus tembok) adalah x meter.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-009', m.id, w, 'mudah', 'Jika x = 8, luas kebun adalah ... m².', 'Panjang kebun (sejajar tembok) = 40 − 2x = 40 − 16 = 24 m. Luas = 8 × 24 = 192 m².'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '128', false),
      ('B', '160', false),
      ('C', '176', false),
      ('D', '184', false),
      ('E', '192', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-010', m.id, w, 'sedang', 'Luas kebun paling besar tercapai ketika x sama dengan ... m.', 'Luas L(x) = x(40 − 2x) = −2x² + 40x. Nilai maksimum terjadi di x = −b/(2a) = −40/(2 × (−2)) = 10 m.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '8', false),
      ('B', '10', true),
      ('C', '12', false),
      ('D', '16', false),
      ('E', '20', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-011', m.id, w, 'sedang', 'Luas kebun maksimum yang dapat dibuat Pak Anton adalah ... m².', 'Pada x = 10, panjang = 40 − 20 = 20 m. Luas maksimum = 10 × 20 = 200 m².'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '160', false),
      ('B', '180', false),
      ('C', '200', true),
      ('D', '240', false),
      ('E', '400', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-AFP-012', m.id, w, 'sulit', 'Kebun dengan luas 192 m² dapat dibuat dengan dua kemungkinan lebar. Jumlah kedua kemungkinan lebar tersebut adalah ... m.', 'x(40 − 2x) = 192 menjadi 2x² − 40x + 192 = 0, atau x² − 20x + 96 = 0. Faktorkan: (x − 8)(x − 12) = 0, sehingga x = 8 atau x = 12. Jumlahnya 20 (sama dengan −b/a).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '8', false),
      ('B', '12', false),
      ('C', '16', false),
      ('D', '20', true),
      ('E', '24', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-AFP-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-013', m.id, 'mudah', 'Jika 3x + 2y = 16 dan x − y = 2, nilai x + y adalah ….', 'Dari x − y = 2 diperoleh x = y + 2. Substitusi: 3(y + 2) + 2y = 16, sehingga 5y = 10, y = 2 dan x = 4. Maka x + y = 6.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', true),
  ('B', '8', false),
  ('C', '10', false),
  ('D', '12', false),
  ('E', '14', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-014', m.id, 'mudah', 'Himpunan penyelesaian dari 5 − 2x ≥ 9 adalah ….', '−2x ≥ 9 − 5 = 4. Kedua ruas dibagi −2, tanda pertidaksamaan berbalik, sehingga x ≤ −2.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'x ≥ −2', false),
  ('B', 'x ≤ −2', true),
  ('C', 'x ≥ 2', false),
  ('D', 'x ≤ 2', false),
  ('E', 'x ≤ −7', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-015', m.id, 'sedang', 'Hasil kali akar-akar persamaan 2x² − 7x + 3 = 0 adalah ….', 'Untuk ax² + bx + c = 0, hasil kali akar = c/a = 3/2. Akar-akarnya 3 dan 1/2 (jumlahnya 7/2).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '−7/2', false),
  ('B', '1/2', false),
  ('C', '3/2', true),
  ('D', '3', false),
  ('E', '7/2', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-016', m.id, 'sedang', 'Fungsi linear f(x) = ax + b memenuhi f(1) = 5 dan f(3) = 11. Nilai f(10) adalah ….', 'a + b = 5 dan 3a + b = 11. Kurangkan: 2a = 6, sehingga a = 3 dan b = 2. Maka f(10) = 3 × 10 + 2 = 32.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '28', false),
  ('B', '30', false),
  ('C', '31', false),
  ('D', '32', true),
  ('E', '35', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-017', m.id, 'sedang', 'Nilai x yang memenuhi 2ˣ⁺¹ + 2ˣ = 24 adalah ….', '2ˣ⁺¹ = 2 × 2ˣ, sehingga 2 × 2ˣ + 2ˣ = 3 × 2ˣ = 24. Maka 2ˣ = 8 = 2³ dan x = 3.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '0', false),
  ('B', '1', false),
  ('C', '2', false),
  ('D', '2,5', false),
  ('E', '3', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-018', m.id, 'sedang', 'Jumlah semua nilai x yang memenuhi x² − 6x + 9 = 25 adalah ….', 'Ruas kiri adalah (x − 3)², sehingga (x − 3)² = 25 dan x − 3 = 5 atau x − 3 = −5. Diperoleh x = 8 atau x = −2, jumlahnya 6.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4', false),
  ('B', '6', true),
  ('C', '8', false),
  ('D', '10', false),
  ('E', '16', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-019', m.id, 'sulit', 'Diketahui fungsi g(x) = x² − 4x − 5.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Akar-akar persamaan g(x) = 0 adalah −5 dan 1.
(2) Sumbu simetri grafik g adalah x = 2.
(3) Nilai minimum g adalah 5.
(4) Grafik g memotong sumbu y di titik (0, −5).', '(1) g(x) = (x − 5)(x + 1), akarnya 5 dan −1, bukan −5 dan 1, sehingga salah. (2) Sumbu simetri x = −b/(2a) = 4/2 = 2, benar. (3) g(2) = 4 − 8 − 5 = −9, jadi nilai minimumnya −9, bukan 5, salah. (4) g(0) = −5, benar. Pernyataan benar: (2) dan (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
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
where so.kode = 'PM-AFP-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-AFP-020', m.id, 'sulit', 'Banyak bilangan bulat x yang memenuhi |x − 4| < 3 adalah ….', '|x − 4| < 3 berarti −3 < x − 4 < 3, atau 1 < x < 7. Bilangan bulat yang memenuhi: 2, 3, 4, 5, 6, yaitu 5 bilangan. (1 dan 7 tidak termasuk karena pertidaksamaannya tegas.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Aljabar, Fungsi, dan Persamaan'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '5', true),
  ('B', '6', false),
  ('C', '7', false),
  ('D', '11', false),
  ('E', '13', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-AFP-020'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-GP-001') then
    insert into wacana (isi) values ('Sebuah kolam renang berbentuk persegi panjang berukuran 20 m × 12 m. Di sekeliling kolam dibuat jalan setapak dengan lebar yang sama di semua sisi, yaitu 2 m.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-001', m.id, w, 'mudah', 'Luas permukaan kolam renang tersebut adalah ... m².', 'Luas persegi panjang = panjang × lebar = 20 × 12 = 240 m².'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '64', false),
      ('B', '128', false),
      ('C', '200', false),
      ('D', '224', false),
      ('E', '240', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-002', m.id, w, 'sedang', 'Luas jalan setapak yang mengelilingi kolam adalah ... m².', 'Ukuran kolam beserta jalan setapak adalah (20 + 2 × 2) × (12 + 2 × 2) = 24 × 16 = 384 m². Luas jalan setapak = 384 − 240 = 144 m².'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '112', false),
      ('B', '128', false),
      ('C', '144', true),
      ('D', '152', false),
      ('E', '160', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-003', m.id, w, 'sedang', 'Seluruh jalan setapak akan dipasangi keramik dengan harga Rp150.000 per m². Biaya yang diperlukan untuk keramik adalah ….', 'Luas jalan setapak 144 m², sehingga biaya = 144 × Rp150.000 = Rp21.600.000.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Rp14.400.000', false),
      ('B', 'Rp16.800.000', false),
      ('C', 'Rp18.000.000', false),
      ('D', 'Rp21.600.000', true),
      ('E', 'Rp36.000.000', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-004', m.id, w, 'sulit', 'Di sepanjang batas luar jalan setapak dipasang tiang lampu dengan jarak antartiang 4 m. Tiang pertama dipasang di salah satu sudut. Banyak tiang lampu yang diperlukan adalah ….', 'Batas luar berbentuk persegi panjang 24 m × 16 m dengan keliling 2(24 + 16) = 80 m. Karena batas tersebut membentuk lintasan tertutup, banyak tiang = 80 : 4 = 20 buah (tiang terakhir bertemu tiang pertama, sehingga tidak ada tiang tambahan).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '16', false),
      ('B', '20', true),
      ('C', '24', false),
      ('D', '40', false),
      ('E', '80', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-GP-005') then
    insert into wacana (isi) values ('Sebuah tangki air berbentuk tabung tegak dengan jari-jari alas 7 dm dan tinggi 10 dm. Gunakan π = 22/7 dan 1 dm³ = 1 liter.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-005', m.id, w, 'mudah', 'Kapasitas maksimum tangki tersebut adalah ... liter.', 'Volume tabung = πr²t = 22/7 × 7 × 7 × 10 = 1.540 dm³. Karena 1 dm³ = 1 liter, kapasitasnya 1.540 liter.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '154', false),
      ('B', '440', false),
      ('C', '770', false),
      ('D', '1.078', false),
      ('E', '1.540', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-006', m.id, w, 'mudah', 'Jika tangki terisi 3/4 bagian, volume air di dalam tangki adalah ... liter.', 'Volume air = 3/4 × 1.540 = 1.155 liter.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '385', false),
      ('B', '770', false),
      ('C', '1.078', false),
      ('D', '1.155', true),
      ('E', '1.540', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-007', m.id, w, 'sedang', 'Tangki yang masih kosong diisi air dengan debit 35 liter per menit. Waktu yang diperlukan hingga tangki penuh adalah ... menit.', 'Waktu = volume : debit = 1.540 : 35 = 44 menit.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '35', false),
      ('B', '42', false),
      ('C', '44', true),
      ('D', '45', false),
      ('E', '48', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-008', m.id, w, 'sedang', 'Tangki tersebut akan dicat pada seluruh permukaan luarnya kecuali tutup bagian atas (alas dan selimut saja). Luas bagian yang dicat adalah ... dm².', 'Luas alas = πr² = 22/7 × 49 = 154 dm². Luas selimut = 2πrt = 2 × 22/7 × 7 × 10 = 440 dm². Jumlahnya 154 + 440 = 594 dm².'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '594', true),
      ('B', '748', false),
      ('C', '880', false),
      ('D', '1.034', false),
      ('E', '1.540', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-GP-009') then
    insert into wacana (isi) values ('Pada pukul 09.00, sebuah tiang bendera setinggi 6 m memiliki bayangan sepanjang 4 m, sedangkan sebuah gedung di dekatnya memiliki bayangan sepanjang 30 m. Tiang dan gedung berdiri tegak lurus pada tanah datar.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-009', m.id, w, 'mudah', 'Tinggi gedung tersebut adalah ... m.', 'Pada waktu yang sama, tinggi benda sebanding dengan panjang bayangannya. Tinggi gedung : 30 = 6 : 4, sehingga tinggi gedung = 6 × 30 : 4 = 45 m.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '45', true),
      ('B', '60', false),
      ('C', '90', false),
      ('D', '120', false),
      ('E', '180', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-010', m.id, w, 'sedang', 'Pada pukul 11.00, bayangan tiang bendera menjadi 2 m. Pada saat itu panjang bayangan gedung adalah ... m.', 'Perbandingan tinggi benda dan bayangannya adalah 6 : 2 = 3 : 1. Bayangan gedung = 45 : 3 = 15 m.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '6', false),
      ('B', '9', false),
      ('C', '10', false),
      ('D', '12', false),
      ('E', '15', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-011', m.id, w, 'sulit', 'Pada pukul 09.00, jarak dari ujung bayangan gedung ke puncak gedung adalah ... m.', 'Gedung (45 m) dan bayangannya (30 m) membentuk segitiga siku-siku. Jarak yang ditanyakan adalah sisi miringnya: √(45² + 30²) = √(2.025 + 900) = √2.925 = √(225 × 13) = 15√13 m.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '15√5', false),
      ('B', '45', false),
      ('C', '15√11', false),
      ('D', '15√13', true),
      ('E', '75', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-GP-012', m.id, w, 'mudah', 'Perbandingan tinggi gedung dan tinggi tiang bendera adalah ….', 'Tinggi gedung : tinggi tiang = 45 : 6 = 15 : 2.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '2 : 15', false),
      ('B', '15 : 2', true),
      ('C', '15 : 4', false),
      ('D', '45 : 4', false),
      ('E', '5 : 1', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-GP-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-013', m.id, 'mudah', 'Sebuah roda berdiameter 28 cm. Dengan π = 22/7, keliling roda tersebut adalah ... cm.', 'Keliling lingkaran = πd = 22/7 × 28 = 88 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '44', false),
  ('B', '88', true),
  ('C', '154', false),
  ('D', '176', false),
  ('E', '616', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-014', m.id, 'sedang', 'Segitiga ABC siku-siku di B dengan AB = 9 cm dan BC = 12 cm. Jarak titik B ke sisi AC adalah ... cm.', 'AC = √(9² + 12²) = 15 cm. Luas segitiga = ½ × 9 × 12 = 54 cm². Juga luas = ½ × AC × t, sehingga ½ × 15 × t = 54 dan t = 108 : 15 = 7,2 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '4,5', false),
  ('B', '6,0', false),
  ('C', '6,5', false),
  ('D', '7,0', false),
  ('E', '7,2', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-015', m.id, 'sedang', 'Sebuah trapesium sama kaki memiliki sisi sejajar 10 cm dan 16 cm, serta panjang kaki 5 cm. Luas trapesium tersebut adalah ... cm².', 'Selisih sisi sejajar 16 − 10 = 6, sehingga setiap sisi samping memiliki proyeksi 3 cm. Tinggi = √(5² − 3²) = 4 cm. Luas = ½ × (10 + 16) × 4 = 52 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '52', true),
  ('B', '56', false),
  ('C', '60', false),
  ('D', '65', false),
  ('E', '80', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-016', m.id, 'sedang', 'Sebuah kubus memiliki volume 343 cm³. Luas permukaan kubus tersebut adalah ... cm².', 'Rusuk = ∛343 = 7 cm. Luas permukaan = 6 × 7² = 294 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '196', false),
  ('B', '252', false),
  ('C', '294', true),
  ('D', '343', false),
  ('E', '588', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-017', m.id, 'sedang', 'Sebuah balok berukuran 4 cm × 4 cm × 7 cm. Panjang diagonal ruang balok tersebut adalah ... cm.', 'Diagonal ruang = √(p² + l² + t²) = √(16 + 16 + 49) = √81 = 9 cm.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '7', false),
  ('C', '8', false),
  ('D', '9', true),
  ('E', '15', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-018', m.id, 'sulit', 'Persegi panjang ABCD memiliki AB = 12 cm dan BC = 5 cm.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Panjang diagonal AC adalah 13 cm.
(2) Keliling persegi panjang ABCD adalah 30 cm.
(3) Luas persegi panjang ABCD adalah 60 cm².
(4) Jarak titik B ke diagonal AC adalah 5 cm.', '(1) AC = √(12² + 5²) = 13 cm, benar. (2) Keliling = 2(12 + 5) = 34 cm, bukan 30 cm, salah. (3) Luas = 12 × 5 = 60 cm², benar. (4) Jarak B ke AC = (12 × 5) : 13 = 60/13 cm, bukan 5 cm, salah. Pernyataan benar: (1) dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
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
where so.kode = 'PM-GP-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-019', m.id, 'sulit', 'Sebuah segitiga siku-siku memiliki sisi miring 13 cm dan salah satu sisi siku-sikunya 5 cm. Jari-jari lingkaran dalam segitiga tersebut adalah ... cm.', 'Sisi siku-siku lainnya = √(13² − 5²) = 12 cm. Jari-jari lingkaran dalam segitiga siku-siku = (a + b − c) : 2 = (5 + 12 − 13) : 2 = 2 cm. (Cek dengan luas: 30 = r × (5 + 12 + 13) : 2 sehingga r = 2.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '1', false),
  ('B', '1,5', false),
  ('C', '2', true),
  ('D', '2,5', false),
  ('E', '3', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-GP-020', m.id, 'sulit', 'Pada setiap titik sudut sebuah persegi berukuran sisi 14 cm digambar seperempat lingkaran berjari-jari 7 cm dengan pusat di titik sudut tersebut. Dengan π = 22/7, luas daerah di dalam persegi yang berada di luar keempat seperempat lingkaran tersebut adalah ... cm².', 'Empat seperempat lingkaran berjari-jari sama membentuk luas satu lingkaran penuh = 22/7 × 7² = 154 cm². Kedua seperempat lingkaran yang bertetangga hanya bersentuhan di titik tengah sisi persegi (jarak pusat 14 = 7 + 7), sehingga tidak saling tumpang tindih. Luas persegi = 196 cm², maka luas sisanya = 196 − 154 = 42 cm².'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Geometri dan Pengukuran'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '42', true),
  ('B', '49', false),
  ('C', '154', false),
  ('D', '196', false),
  ('E', '238', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-GP-020'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-SP-001') then
    insert into wacana (isi) values ('Nilai ulangan matematika 10 siswa adalah 6, 7, 7, 8, 8, 8, 9, 9, 10, 10.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-001', m.id, w, 'mudah', 'Rata-rata nilai ulangan kesepuluh siswa tersebut adalah ….', 'Jumlah nilai = 6 + 7 + 7 + 8 + 8 + 8 + 9 + 9 + 10 + 10 = 82. Rata-rata = 82 : 10 = 8,2.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '7,6', false),
      ('B', '7,8', false),
      ('C', '8,0', false),
      ('D', '8,1', false),
      ('E', '8,2', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-002', m.id, w, 'mudah', 'Median dari data nilai tersebut adalah ….', 'Data sudah terurut dan berjumlah 10. Median adalah rata-rata data ke-5 dan ke-6, yaitu (8 + 8) : 2 = 8.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '6', false),
      ('B', '7', false),
      ('C', '7,5', false),
      ('D', '8', true),
      ('E', '8,2', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-003', m.id, w, 'sedang', 'Seorang siswa baru bergabung dan mengikuti ulangan susulan sehingga rata-rata nilai menjadi 8,0. Nilai siswa baru tersebut adalah ….', 'Setelah siswa baru bergabung ada 11 siswa dengan rata-rata 8,0, sehingga jumlah nilai = 88. Nilai siswa baru = 88 − 82 = 6.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '5', false),
      ('B', '6', true),
      ('C', '7', false),
      ('D', '8', false),
      ('E', '9', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-004', m.id, w, 'sulit', 'Dua siswa susulan mengikuti ulangan dan memperoleh nilai yang sama. Agar rata-rata nilai ke-12 siswa paling sedikit 8,5, nilai minimal masing-masing siswa susulan adalah ….', 'Misalkan nilai masing-masing siswa susulan x. Syaratnya (82 + 2x) : 12 ≥ 8,5, yaitu 82 + 2x ≥ 102, sehingga x ≥ 10. Nilai minimalnya 10.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '8', false),
      ('B', '9', false),
      ('C', '9,5', false),
      ('D', '9,8', false),
      ('E', '10', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-SP-005') then
    insert into wacana (isi) values ('Dua dadu bermata enam (angka 1 sampai 6) dilempar bersamaan satu kali.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-005', m.id, w, 'mudah', 'Peluang munculnya jumlah mata dadu 7 adalah ….', 'Pasangan berjumlah 7: (1,6), (2,5), (3,4), (4,3), (5,2), (6,1), yaitu 6 pasangan dari 36 kemungkinan. Peluangnya 6/36 = 1/6.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/12', false),
      ('B', '1/9', false),
      ('C', '1/6', true),
      ('D', '1/4', false),
      ('E', '1/3', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-006', m.id, w, 'sedang', 'Peluang munculnya jumlah mata dadu yang habis dibagi 4 adalah ….', 'Jumlah 4 muncul dalam 3 cara, jumlah 8 dalam 5 cara, dan jumlah 12 dalam 1 cara, sehingga ada 3 + 5 + 1 = 9 kejadian dari 36. Peluangnya 9/36 = 1/4.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/9', false),
      ('B', '5/36', false),
      ('C', '1/6', false),
      ('D', '1/4', true),
      ('E', '1/3', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-007', m.id, w, 'sedang', 'Peluang paling sedikit satu dadu menunjukkan angka 6 adalah ….', 'Kejadian komplemen: tidak ada dadu yang menunjukkan 6, yaitu 5 × 5 = 25 pasangan. Maka peluang paling sedikit satu angka 6 = 1 − 25/36 = 11/36.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/36', false),
      ('B', '5/36', false),
      ('C', '1/6', false),
      ('D', '5/18', false),
      ('E', '11/36', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-008', m.id, w, 'sulit', 'Diketahui jumlah kedua mata dadu adalah 8. Peluang bahwa kedua dadu menunjukkan angka yang sama adalah ….', 'Karena jumlahnya sudah diketahui 8, ruang sampelnya hanya (2,6), (3,5), (4,4), (5,3), (6,2), yaitu 5 pasangan. Hanya (4,4) yang kedua angkanya sama, sehingga peluangnya 1/5 (bukan 1/36).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/36', false),
      ('B', '1/5', true),
      ('C', '1/4', false),
      ('D', '1/3', false),
      ('E', '1/2', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PM-SP-009') then
    insert into wacana (isi) values ('Sebuah kotak berisi 5 bola merah, 3 bola biru, dan 2 bola hijau. Semua bola identik kecuali warnanya. Dua bola diambil sekaligus secara acak dari kotak.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-009', m.id, w, 'mudah', 'Banyak cara berbeda pengambilan dua bola sekaligus dari kotak tersebut adalah ….', 'Pengambilan sekaligus tidak memperhatikan urutan, sehingga banyak cara = C(10, 2) = (10 × 9) : 2 = 45.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '45', true),
      ('B', '50', false),
      ('C', '90', false),
      ('D', '100', false),
      ('E', '120', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-010', m.id, w, 'sedang', 'Peluang kedua bola yang terambil berwarna merah adalah ….', 'Cara mengambil 2 bola merah dari 5 = C(5, 2) = 10. Peluangnya 10/45 = 2/9.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/9', false),
      ('B', '1/5', false),
      ('C', '2/9', true),
      ('D', '1/4', false),
      ('E', '1/3', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-011', m.id, w, 'sedang', 'Peluang terambilnya dua bola dengan warna berbeda adalah ….', 'Dua bola berwarna sama: merah C(5,2) = 10, biru C(3,2) = 3, hijau C(2,2) = 1, jumlahnya 14 cara. Peluang berwarna sama = 14/45, sehingga peluang berwarna berbeda = 1 − 14/45 = 31/45.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '1/45', false),
      ('B', '14/45', false),
      ('C', '22/45', false),
      ('D', '2/3', false),
      ('E', '31/45', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PM-SP-012', m.id, w, 'sedang', 'Peluang terambilnya paling sedikit satu bola hijau adalah ….', 'Komplemen: tidak ada bola hijau, berarti kedua bola diambil dari 8 bola lainnya dengan C(8,2) = 28 cara. Peluang = 1 − 28/45 = 17/45.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '17/45', true),
      ('B', '22/45', false),
      ('C', '28/45', false),
      ('D', '2/3', false),
      ('E', '4/5', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PM-SP-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-013', m.id, 'mudah', 'Rata-rata lima bilangan adalah 12. Jika bilangan keenam yang bernilai 18 ditambahkan, rata-rata keenam bilangan menjadi ….', 'Jumlah lima bilangan = 12 × 5 = 60. Setelah ditambah 18, jumlahnya 78 untuk 6 bilangan, sehingga rata-ratanya 78 : 6 = 13.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '12,5', false),
  ('B', '13', true),
  ('C', '14', false),
  ('D', '15', false),
  ('E', '30', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-014', m.id, 'mudah', 'Jangkauan (selisih nilai terbesar dan terkecil) dari data 4, 9, 2, 15, 7, 11 adalah ….', 'Nilai terbesar 15 dan nilai terkecil 2, sehingga jangkauan = 15 − 2 = 13.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '10', false),
  ('B', '11', false),
  ('C', '12', false),
  ('D', '13', true),
  ('E', '14', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-015', m.id, 'sedang', 'Rata-rata nilai ujian 30 siswa adalah 72. Di antara mereka terdapat 20 siswa putri dengan rata-rata nilai 75. Rata-rata nilai siswa putra adalah ….', 'Jumlah nilai seluruh siswa = 72 × 30 = 2.160. Jumlah nilai siswa putri = 75 × 20 = 1.500. Siswa putra berjumlah 10 orang dengan jumlah nilai 2.160 − 1.500 = 660, sehingga rata-ratanya 66.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '60', false),
  ('B', '62', false),
  ('C', '64', false),
  ('D', '65', false),
  ('E', '66', true)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-016', m.id, 'sedang', 'Dari 6 anggota OSIS akan dipilih seorang ketua, seorang sekretaris, dan seorang bendahara, dengan setiap orang hanya memegang satu jabatan. Banyak susunan pengurus yang mungkin adalah ….', 'Urutan (jabatan) diperhatikan, sehingga banyak susunan = 6 × 5 × 4 = 120.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '20', false),
  ('B', '60', false),
  ('C', '90', false),
  ('D', '120', true),
  ('E', '216', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-017', m.id, 'sedang', 'Sebuah kelas yang terdiri dari 20 siswa memperoleh nilai kuis sebagai berikut: nilai 5 diperoleh 3 siswa, nilai 6 diperoleh 5 siswa, nilai 7 diperoleh 8 siswa, dan nilai 8 diperoleh 4 siswa. Rata-rata nilai kuis kelas tersebut adalah ….', 'Jumlah nilai = 5 × 3 + 6 × 5 + 7 × 8 + 8 × 4 = 15 + 30 + 56 + 32 = 133. Rata-rata = 133 : 20 = 6,65.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6,25', false),
  ('B', '6,50', false),
  ('C', '6,65', true),
  ('D', '6,75', false),
  ('E', '7,00', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-018', m.id, 'sulit', 'Diberikan data: 4, 6, 6, 8, 11, 6, 9.
Pernyataan mana saja yang bernilai benar berdasarkan informasi di atas?
(1) Modus data tersebut adalah 6.
(2) Median data tersebut adalah 7.
(3) Jangkauan data tersebut adalah 7.
(4) Rata-rata data tersebut kurang dari 7.', 'Data terurut: 4, 6, 6, 6, 8, 9, 11. (1) Angka 6 muncul paling sering (3 kali), benar. (2) Median = data ke-4 = 6, bukan 7, salah. (3) Jangkauan = 11 − 4 = 7, benar. (4) Rata-rata = 50/7 ≈ 7,14 yang lebih dari 7, salah. Pernyataan benar: (1) dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
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
where so.kode = 'PM-SP-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-019', m.id, 'sulit', 'Sebuah tim yang terdiri dari 4 orang akan dibentuk dari 6 siswa putra dan 4 siswa putri. Banyak cara membentuk tim tersebut dengan syarat terdapat paling sedikit 2 siswa putri adalah ….', 'Semua cara memilih 4 dari 10 siswa = C(10, 4) = 210. Dikurangi tim tanpa putri C(6, 4) = 15 dan tim dengan tepat 1 putri 4 × C(6, 3) = 4 × 20 = 80. Maka 210 − 15 − 80 = 115. (Cek langsung: 6 × 15 + 4 × 6 + 1 = 115.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '115', true),
  ('B', '130', false),
  ('C', '195', false),
  ('D', '205', false),
  ('E', '210', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PM-SP-020', m.id, 'sulit', 'Peluang Ani lulus seleksi adalah 0,8 dan peluang Budi lulus seleksi adalah 0,7. Keduanya mengikuti seleksi secara terpisah dan hasilnya saling bebas. Peluang tepat satu di antara mereka yang lulus adalah ….', 'Tepat satu lulus berarti (Ani lulus dan Budi tidak) atau (Ani tidak dan Budi lulus). Peluangnya 0,8 × 0,3 + 0,2 × 0,7 = 0,24 + 0,14 = 0,38.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Matematika' and m.nama = 'Statistika dan Peluang'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '0,14', false),
  ('B', '0,24', false),
  ('C', '0,38', true),
  ('D', '0,56', false),
  ('E', '0,94', false)
) as v (label, isi, is_benar)
where so.kode = 'PM-SP-020'
on conflict (soal_id, label) do nothing;
