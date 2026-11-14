-- =====================================================================
-- TRY OUT DUMMY MINI: hanya untuk menguji alur Try Out. BUKAN soal asli.
-- Isi: Pengetahuan Kuantitatif (4 soal) + Penalaran Matematika (3 soal).
-- Aman dijalankan ulang. Untuk menguji timer tanpa menunggu lama:
--   update subtes set durasi_menit = 1 where nama = 'Pengetahuan Kuantitatif';
-- lalu kembalikan: update subtes set durasi_menit = 20 where nama = 'Pengetahuan Kuantitatif';
-- =====================================================================
insert into try_out (judul, deskripsi, terbit)
values ('[DUMMY] Try Out Mini', 'Paket kecil untuk menguji alur. Bukan soal asli.', true)
on conflict (judul) do nothing;

with data (kode, subtes_nama, materi_nama, nomor, kesulitan, pertanyaan, pembahasan, o1, o2, o3, o4, o5, benar) as (values
  ('DUMMY-TO-001','Pengetahuan Kuantitatif','Bilangan',1,'mudah','25% dari 80 adalah ...','25% x 80 = 20.','10','15','20','25','40','C'),
  ('DUMMY-TO-002','Pengetahuan Kuantitatif','Aljabar dan Fungsi',2,'sedang','Jika 3x - 7 = 11, maka x = ...','3x = 18, sehingga x = 6.','4','6','5','7','8','B'),
  ('DUMMY-TO-003','Pengetahuan Kuantitatif','Geometri',3,'sedang','Persegi panjang berukuran 12 cm x 5 cm. Kelilingnya adalah ... cm.','K = 2 x (12 + 5) = 34.','17','30','60','34','64','D'),
  ('DUMMY-TO-004','Pengetahuan Kuantitatif','Statistika dan Peluang',4,'sulit','Rata-rata dari 6 data: 4, 6, 6, 8, 10, dan x adalah 7. Nilai x adalah ...','Jumlah seluruh data = 6 x 7 = 42. Jumlah lima data diketahui = 34, sehingga x = 8.','6','7','8','9','10','C'),
  ('DUMMY-TO-005','Penalaran Matematika','Bilangan dan Aritmetika Sosial',1,'mudah','Sebuah barang berharga Rp80.000 mendapat diskon 20%. Harga yang dibayar adalah ...','Diskon = 20% x 80.000 = 16.000. Harga bayar = 64.000.','Rp60.000','Rp62.000','Rp64.000','Rp68.000','Rp70.000','C'),
  ('DUMMY-TO-006','Penalaran Matematika','Pola Bilangan dan Himpunan',2,'sedang','Pola bilangan 2, 5, 8, 11, ... Suku ke-10 adalah ...','Beda = 3. U10 = 2 + 9 x 3 = 29.','26','29','27','30','32','B'),
  ('DUMMY-TO-007','Penalaran Matematika','Geometri dan Pengukuran',3,'sulit','Panjang persegi panjang dua kali lebarnya dan kelilingnya 36 cm. Luasnya adalah ... cm2.','Misal lebar l, panjang 2l. Keliling = 6l = 36, jadi l = 6 dan p = 12. Luas = 72.','54','64','81','96','72','E')
)
insert into soal (kode, materi_id, try_out_id, nomor, kesulitan, pertanyaan, pembahasan)
select d.kode, m.id, t.id, d.nomor, d.kesulitan, '[DUMMY] ' || d.pertanyaan, d.pembahasan
from data d
join subtes s on s.nama = d.subtes_nama
join materi m on m.subtes_id = s.id and m.nama = d.materi_nama
join try_out t on t.judul = '[DUMMY] Try Out Mini'
on conflict (kode) do nothing;

with data (kode, o1, o2, o3, o4, o5, benar) as (values
  ('DUMMY-TO-001','10','15','20','25','40','C'),
  ('DUMMY-TO-002','4','6','5','7','8','B'),
  ('DUMMY-TO-003','17','30','60','34','64','D'),
  ('DUMMY-TO-004','6','7','8','9','10','C'),
  ('DUMMY-TO-005','Rp60.000','Rp62.000','Rp64.000','Rp68.000','Rp70.000','C'),
  ('DUMMY-TO-006','26','29','27','30','32','B'),
  ('DUMMY-TO-007','54','64','81','96','72','E')
)
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.label = d.benar
from data d
join soal so on so.kode = d.kode
cross join lateral (values ('A', d.o1), ('B', d.o2), ('C', d.o3), ('D', d.o4), ('E', d.o5)) as v (label, isi)
on conflict (soal_id, label) do nothing;

-- Pembersihan (manual, urutan penting):
-- delete from jawaban where soal_id in (select id from soal where kode like 'DUMMY-TO-%');
-- delete from sesi_subtes where sesi_id in (select id from sesi where try_out_id in (select id from try_out where judul like '[DUMMY]%'));
-- delete from sesi where try_out_id in (select id from try_out where judul like '[DUMMY]%');
-- delete from soal where kode like 'DUMMY-TO-%';
-- delete from try_out where judul like '[DUMMY]%';
