-- =====================================================================
-- Soal latihan: Penalaran Umum (100 soal). Orisinal, ditulis untuk TembusPTN.
-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).
-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).
-- =====================================================================

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-001', m.id, 'mudah', 'Setiap kali hujan deras turun, selokan di depan SMP Harapan meluap dan menggenangi halaman sekolah. Selokan itu sudah tiga tahun tidak dikeruk. Di sekolah lain pada kawasan yang sama, selokan dikeruk setiap enam bulan dan halaman mereka tidak pernah tergenang.
Manakah pernyataan yang PALING MUNGKIN menjelaskan genangan di SMP Harapan?', 'Informasi yang dibandingkan hanyalah perawatan selokan: SMP Harapan tidak pernah mengeruk selama tiga tahun, sekolah lain mengeruk rutin dan tidak tergenang. Penjelasan paling mungkin adalah endapan yang menghambat aliran air. Pilihan lain tidak didukung informasi (curah hujan, bahan selokan, jumlah murid) atau justru akan mengurangi genangan (halaman lebih tinggi).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Curah hujan di sekitar SMP Harapan jauh lebih tinggi daripada di sekolah lain.', false),
  ('B', 'Halaman SMP Harapan dibangun lebih tinggi daripada jalan di sekitarnya.', false),
  ('C', 'Endapan di selokan yang lama tidak dikeruk menghambat aliran air hujan.', true),
  ('D', 'Sekolah lain memiliki lebih banyak murid yang membantu membersihkan halaman.', false),
  ('E', 'Selokan SMP Harapan terbuat dari bahan yang berbeda dari selokan sekolah lain.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-002', m.id, 'sedang', 'Seorang peneliti menyatakan bahwa siswa yang sarapan sebelum berangkat ke sekolah lebih mampu berkonsentrasi pada jam pelajaran pertama.
Manakah pernyataan yang, jika benar, PALING MEMPERKUAT pernyataan peneliti tersebut?', 'Pernyataan peneliti menghubungkan sarapan dengan konsentrasi. Percobaan pada siswa yang sama membandingkan hari sarapan dan hari tidak sarapan, sehingga faktor lain relatif terkendali dan hubungan sebab-akibatnya semakin kuat. Pilihan lain tidak membahas hubungan sarapan dengan konsentrasi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Banyak siswa sarapan di kantin sekolah.', false),
  ('B', 'Sarapan yang bergizi harganya relatif terjangkau.', false),
  ('C', 'Siswa yang sarapan umumnya berangkat ke sekolah lebih pagi.', false),
  ('D', 'Jam pelajaran pertama biasanya diisi mata pelajaran yang sulit.', false),
  ('E', 'Dalam sebuah percobaan, siswa yang sama lebih fokus pada hari ketika mereka sarapan daripada pada hari ketika mereka tidak sarapan.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-003', m.id, 'sedang', 'Dinas Pariwisata menyatakan bahwa kenaikan jumlah wisatawan ke Pantai Karang tahun ini disebabkan oleh pembangunan jalan baru menuju pantai tersebut.
Manakah pernyataan yang, jika benar, PALING MEMPERLEMAH pernyataan Dinas Pariwisata?', 'Untuk memperlemah klaim sebab-akibat, perlu ada penyebab lain yang masuk akal. Film populer yang membuat pantai viral adalah penjelasan alternatif atas kenaikan wisatawan. B dan C justru mendukung klaim, D dan E tidak berkaitan dengan penyebab kenaikan tahun ini.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pada tahun yang sama, sebuah film populer memakai Pantai Karang sebagai lokasi syuting sehingga pantai itu ramai dibicarakan di media sosial.', true),
  ('B', 'Jalan baru tersebut dibuka pada awal tahun.', false),
  ('C', 'Jalan baru tersebut memperpendek waktu tempuh dari pusat kota.', false),
  ('D', 'Sebagian besar wisatawan datang menggunakan kendaraan pribadi.', false),
  ('E', 'Pantai Karang memiliki pasir putih dan ombak yang tenang sejak dahulu.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-004', m.id, 'mudah', 'Penjahit : jarum = petani : ….', 'Hubungan yang dibangun adalah pekerja dengan alat kerja utamanya: penjahit memakai jarum, petani memakai cangkul. Sawah dan lumbung adalah tempat, padi dan beras adalah hasil.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'sawah', false),
  ('B', 'padi', false),
  ('C', 'beras', false),
  ('D', 'cangkul', true),
  ('E', 'lumbung', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-005', m.id, 'sedang', 'Dari 50 toko kelontong yang disurvei secara acak di seluruh kelurahan di Kecamatan Sukamaju, 46 toko menerima pembayaran dengan kode QR.
Simpulan yang PALING KUAT berdasarkan survei tersebut adalah ….', 'Sampel acak 50 toko dari kecamatan itu, 46 di antaranya (92%) menerima kode QR. Simpulan yang aman hanya untuk kecamatan yang sama dan bersifat "sebagian besar", bukan "semua" (C) atau meluas ke seluruh Indonesia (A). D dan E tidak dibahas dalam survei.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Seluruh toko kelontong di Indonesia menerima pembayaran kode QR.', false),
  ('B', 'Sebagian besar toko kelontong di Kecamatan Sukamaju menerima pembayaran kode QR.', true),
  ('C', 'Semua toko kelontong di Kecamatan Sukamaju menerima pembayaran kode QR.', false),
  ('D', 'Toko kelontong di kecamatan lain tidak menerima pembayaran kode QR.', false),
  ('E', 'Pembeli di Kecamatan Sukamaju lebih suka membayar dengan kode QR daripada tunai.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-006', m.id, 'sedang', 'Sebuah kafe mencatat penjualan kopi dingin naik 40% pada bulan Maret dibandingkan Februari. Pada bulan Maret kafe itu juga memberi diskon 20% untuk semua minuman dingin, dan suhu rata-rata kota naik 3°C.
Simpulan yang PALING TEPAT adalah ….', 'Ada dua faktor yang berubah bersamaan (diskon dan suhu), sehingga pengaruh masing-masing tidak bisa dipisahkan dari data tersebut. A, C, dan D menyimpulkan terlalu pasti, E tidak ada dasarnya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kenaikan penjualan pasti seluruhnya disebabkan oleh diskon.', false),
  ('B', 'Kenaikan penjualan mungkin dipengaruhi diskon dan kenaikan suhu, sehingga pengaruh masing-masing belum dapat dipastikan.', true),
  ('C', 'Kenaikan penjualan pasti seluruhnya disebabkan oleh kenaikan suhu.', false),
  ('D', 'Diskon tidak berpengaruh terhadap penjualan kopi dingin.', false),
  ('E', 'Penjualan kopi panas pasti turun sebesar 40%.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-007', m.id, 'sulit', 'Sebuah sekolah melarang siswa membawa ponsel ke kelas. Setelah satu semester, rata-rata nilai ulangan siswa naik 6 poin. Kepala sekolah menyimpulkan bahwa kenaikan nilai tersebut disebabkan oleh larangan ponsel.
Manakah pernyataan yang, jika benar, PALING MEMPERLEMAH kesimpulan kepala sekolah?', 'Klaim sebab-akibat melemah jika ada perubahan lain pada periode yang sama yang dapat menjelaskan kenaikan nilai. Tambahan jam les dan guru yang lebih berpengalaman adalah penyebab alternatif. A dan E justru mendukung, B dan C tidak memengaruhi hubungan sebab-akibat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sebagian siswa mengaku lebih tenang belajar tanpa ponsel.', false),
  ('B', 'Sekolah menyediakan loker untuk menyimpan ponsel siswa.', false),
  ('C', 'Larangan serupa juga diterapkan di beberapa sekolah lain di kota itu.', false),
  ('D', 'Pada semester yang sama sekolah menambah jam les dan mengganti separuh guru dengan guru yang lebih berpengalaman.', true),
  ('E', 'Rata-rata nilai ulangan pada semester sebelumnya cukup stabil.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-008', m.id, 'mudah', 'Jalan Merpati selalu macet pada pukul 07.00–08.00 setiap hari sekolah. Pada hari libur sekolah, jalan itu lancar pada jam yang sama.
Manakah simpulan yang PALING MUNGKIN BENAR?', 'Pola yang teramati: macet pada jam berangkat sekolah di hari sekolah, lancar pada jam yang sama di hari libur sekolah. Dugaan yang paling wajar adalah kemacetan berkaitan dengan aktivitas sekolah. Pilihan lain melampaui informasi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kemacetan di Jalan Merpati pada pagi hari kemungkinan berkaitan dengan aktivitas sekolah.', true),
  ('B', 'Semua kemacetan di kota tersebut disebabkan oleh sekolah.', false),
  ('C', 'Jalan Merpati lancar sepanjang hari pada hari libur.', false),
  ('D', 'Pengendara motor tidak berkontribusi pada kemacetan.', false),
  ('E', 'Jalan Merpati akan macet sepanjang hari pada hari sekolah.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-009', m.id, 'sedang', 'Warung Bu Sari selalu ramai pada tahun pertama dibuka. Pada tahun kedua pendapatannya turun walaupun harga dan rasa masakan tidak berubah.
Manakah pernyataan yang PALING MUNGKIN menjelaskan penurunan pendapatan tersebut?', 'Harga dan rasa tetap, sehingga penyebabnya harus faktor lain. Munculnya pesaing dengan menu serupa dapat mengurangi pembeli. A dan B bertentangan dengan informasi, C dan D justru cenderung menaikkan pendapatan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Bu Sari menaikkan harga semua menu.', false),
  ('B', 'Rasa masakan di warung Bu Sari menurun.', false),
  ('C', 'Warung Bu Sari buka lebih pagi setiap hari.', false),
  ('D', 'Warung Bu Sari memiliki banyak pelanggan tetap.', false),
  ('E', 'Di sekitar warung dibuka tiga warung makan baru dengan menu serupa.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-010', m.id, 'mudah', 'Sepatu : kaki = topi : ….', 'Sepatu dipakai pada kaki, topi dipakai pada kepala.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'rambut', false),
  ('B', 'wajah', false),
  ('C', 'kepala', true),
  ('D', 'leher', false),
  ('E', 'tubuh', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-011', m.id, 'sedang', 'Hujan : banjir = kemarau : ….', 'Hubungan sebab-akibat: hujan lebat dapat menyebabkan banjir, kemarau panjang dapat menyebabkan kekeringan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'panas', false),
  ('B', 'matahari', false),
  ('C', 'musim', false),
  ('D', 'kekeringan', true),
  ('E', 'air', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-012', m.id, 'mudah', 'Para peneliti mengamati bahwa tanaman cabai yang diberi pupuk kompos tumbuh lebih tinggi daripada tanaman cabai yang tidak diberi pupuk, padahal keduanya ditanam di tanah yang sama, mendapat cahaya matahari yang sama, dan disiram dengan jumlah air yang sama.
Simpulan yang PALING KUAT adalah ….', 'Kondisi lain sama, hanya pupuk yang berbeda, sehingga simpulan yang sah terbatas pada pengaruh kompos terhadap tinggi tanaman cabai. B dan E terlalu umum, C dan D tidak dibahas.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pupuk kompos berpengaruh positif terhadap tinggi tanaman cabai pada kondisi tersebut.', true),
  ('B', 'Semua jenis pupuk lebih baik daripada tidak diberi pupuk.', false),
  ('C', 'Pupuk kompos membuat buah cabai lebih pedas.', false),
  ('D', 'Tanaman cabai tidak membutuhkan sinar matahari.', false),
  ('E', 'Semua tanaman akan tumbuh lebih tinggi bila diberi kompos.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-013', m.id, 'sulit', 'Setelah mewawancarai lima siswa dari satu kelas XII yang gemar sepak bola, seorang peneliti menyimpulkan bahwa sebagian besar siswa SMA di Indonesia gemar sepak bola.
Manakah pernyataan yang PALING TEPAT menggambarkan kualitas simpulan tersebut?', 'Simpulan tentang populasi besar (siswa SMA se-Indonesia) ditarik dari lima orang di satu kelas yang bahkan dipilih karena sudah gemar sepak bola. Sampel kecil dan bias sehingga simpulannya lemah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuat, karena siswa kelas XII mewakili semua siswa SMA.', false),
  ('B', 'Kuat, karena sepak bola adalah olahraga yang paling populer.', false),
  ('C', 'Lemah, karena sampel terlalu sedikit dan tidak mewakili seluruh siswa SMA di Indonesia.', true),
  ('D', 'Lemah, karena siswa kelas XII tidak menyukai olahraga.', false),
  ('E', 'Tidak dapat dinilai, karena sepak bola bukan topik penelitian.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-014', m.id, 'sedang', 'Toko buku daring Bacaria menambahkan fitur ulasan pembaca di setiap halaman produk agar penjualannya naik.
Manakah yang PALING MUNGKIN menjadi dasar (asumsi) langkah tersebut?', 'Langkah tersebut hanya masuk akal jika ulasan memengaruhi keputusan membeli. A, C, dan E terlalu mutlak dan tidak diperlukan, D tidak berkaitan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua pembaca bersedia menulis ulasan.', false),
  ('B', 'Calon pembeli mempertimbangkan ulasan pembaca lain saat memutuskan membeli buku.', true),
  ('C', 'Ulasan di halaman produk selalu bernada positif.', false),
  ('D', 'Toko buku fisik akan segera tutup.', false),
  ('E', 'Penjualan buku hanya dipengaruhi oleh ulasan pembaca.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-015', m.id, 'sedang', 'Seorang petani menyatakan bahwa hasil panen jagungnya tahun ini turun karena serangan ulat grayak.
Manakah pernyataan yang, jika benar, PALING MEMPERKUAT pernyataan petani tersebut?', 'E menunjukkan bukti langsung adanya hama di ladang yang hasilnya turun dan pembanding tanpa hama yang tidak turun, sehingga klaim sebab-akibat menguat. A menawarkan penyebab lain, B dan D tidak relevan, C hanya fakta umum yang tidak membuktikan kasus ini.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Curah hujan tahun ini jauh di bawah rata-rata sehingga tanaman jagung layu di seluruh daerah.', false),
  ('B', 'Harga jagung tahun ini lebih tinggi daripada tahun lalu.', false),
  ('C', 'Ulat grayak dikenal sebagai salah satu hama tanaman jagung.', false),
  ('D', 'Petani menanam varietas jagung yang sama dengan tahun lalu.', false),
  ('E', 'Di ladangnya banyak ditemukan daun jagung berlubang dengan ulat grayak di dalamnya, sedangkan ladang lain yang bebas hama tidak mengalami penurunan hasil.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-016', m.id, 'mudah', 'Bilangan berikutnya dari pola 3, 6, 12, 24, … adalah ….', 'Setiap suku dikalikan 2: 3 × 2 = 6, 6 × 2 = 12, 12 × 2 = 24, sehingga suku berikutnya 24 × 2 = 48.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '48', true),
  ('B', '36', false),
  ('C', '30', false),
  ('D', '42', false),
  ('E', '54', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-017', m.id, 'sedang', 'Bilangan berikutnya dari pola 2, 5, 10, 17, 26, … adalah ….', 'Suku-sukunya berbentuk n² + 1: 1²+1 = 2, 2²+1 = 5, 3²+1 = 10, 4²+1 = 17, 5²+1 = 26. Suku ke-6 adalah 6² + 1 = 37. (Selisihnya 3, 5, 7, 9, 11.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '33', false),
  ('B', '34', false),
  ('C', '35', false),
  ('D', '36', false),
  ('E', '37', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-018', m.id, 'sulit', 'Huruf berikutnya dari pola B, D, G, K, … adalah ….', 'Urutan alfabet B = 2, D = 4, G = 7, K = 11. Selisihnya 2, 3, 4 sehingga selisih berikutnya 5. 11 + 5 = 16, yaitu huruf P.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'O', false),
  ('B', 'P', true),
  ('C', 'Q', false),
  ('D', 'R', false),
  ('E', 'S', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-019', m.id, 'sedang', 'Setiap kali Rani mengganti air akuarium ikan koki dengan air keran langsung tanpa diendapkan, beberapa ikannya mati dalam sehari. Rani menduga kaporit (zat pembunuh kuman) pada air keran adalah penyebabnya.
Manakah pernyataan yang, jika benar, PALING MEMPERKUAT dugaan Rani?', 'Jika ikan tidak mati setelah kaporit dibiarkan menguap lewat pengendapan, itu mendukung dugaan bahwa kaporit penyebabnya. Pilihan lain tidak berhubungan dengan kaporit.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Air keran di rumah Rani tidak berbau.', false),
  ('B', 'Rani memberi makan ikannya dua kali sehari.', false),
  ('C', 'Rani membeli ikan koki dari toko hewan peliharaan.', false),
  ('D', 'Ikan Rani tidak mati ketika air keran diendapkan semalam sebelum dipakai, sehingga kaporitnya sempat menguap.', true),
  ('E', 'Akuarium Rani diletakkan dekat jendela.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-020', m.id, 'sulit', 'Tingkat kematian pasien di Rumah Sakit A adalah 4%, sedangkan di Rumah Sakit B adalah 1%. Seorang pengamat menyimpulkan bahwa Rumah Sakit B memberikan perawatan yang lebih baik.
Manakah pernyataan yang, jika benar, PALING MEMPERLEMAH simpulan pengamat?', 'Perbandingan angka kematian hanya adil jika pasiennya sebanding. Jika Rumah Sakit A menerima pasien kritis, angka kematian yang lebih tinggi bisa disebabkan kondisi pasien, bukan mutu perawatan. Pilihan lain tidak memengaruhi perbandingan tersebut.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rumah Sakit B memiliki lebih banyak ruang rawat inap.', false),
  ('B', 'Rumah Sakit A berdiri lebih dahulu daripada Rumah Sakit B.', false),
  ('C', 'Rumah Sakit A adalah rumah sakit rujukan yang menerima pasien dalam kondisi kritis, sedangkan Rumah Sakit B hanya menerima pasien dengan penyakit ringan.', true),
  ('D', 'Biaya perawatan di Rumah Sakit B lebih murah daripada di Rumah Sakit A.', false),
  ('E', 'Dokter di kedua rumah sakit lulus dari universitas yang sama.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-021', m.id, 'sedang', 'Hasil survei menyatakan bahwa 80% pengguna aplikasi Zeta puas dengan aplikasi tersebut, sehingga disimpulkan bahwa sebagian besar pengguna Zeta puas. Survei hanya dikirim melalui surel kepada pengguna yang berlangganan paket premium.
Manakah yang PALING MELEMAHKAN simpulan tersebut?', 'Simpulan tentang seluruh pengguna ditarik dari kelompok khusus (pelanggan premium) yang mungkin lebih puas daripada pengguna gratis. Sampel tidak mewakili populasi. B salah karena 80% jelas sebagian besar; lainnya tidak relevan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Survei dikirim lewat surel, bukan lewat telepon.', false),
  ('B', 'Angka 80% terlalu kecil untuk disebut sebagian besar.', false),
  ('C', 'Responden hanya berasal dari pelanggan premium sehingga belum mewakili seluruh pengguna aplikasi.', true),
  ('D', 'Pengguna aplikasi Zeta lebih banyak laki-laki.', false),
  ('E', 'Aplikasi Zeta baru diluncurkan tahun ini.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-022', m.id, 'mudah', 'Tiga kali Dewi menuju bandara lewat jalan tol dan selalu tiba dalam sekitar 40 menit. Tiga kali ia lewat jalan biasa dan selalu tiba dalam sekitar 75 menit.
Manakah simpulan yang PALING MUNGKIN BENAR?', 'Enam percobaan menunjukkan kecenderungan tol lebih cepat. Kata "cenderung" sesuai dengan sifat simpulan induktif, sedangkan "pasti selalu" (B) dan "bebas macet setiap hari" (C) terlalu mutlak.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rute tol cenderung lebih cepat daripada jalan biasa untuk menuju bandara.', true),
  ('B', 'Rute tol pasti selalu lebih cepat dalam kondisi apa pun.', false),
  ('C', 'Jalan tol bebas macet setiap hari.', false),
  ('D', 'Bandara terletak persis di ujung jalan tol.', false),
  ('E', 'Dewi tidak menyukai jalan biasa.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-023', m.id, 'sedang', 'Jumlah peminjam buku di perpustakaan sekolah dalam empat bulan berturut-turut adalah 120, 135, 150, dan 165 orang. Jika pola kenaikan ini berlanjut, jumlah peminjam pada bulan kelima adalah ... orang.', 'Kenaikan tiap bulan tetap 15 orang (135 − 120 = 15, dan seterusnya), sehingga bulan kelima = 165 + 15 = 180.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '150', false),
  ('B', '165', false),
  ('C', '170', false),
  ('D', '180', true),
  ('E', '195', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-024', m.id, 'sedang', 'Pak Anto sering terlambat tiba di kantor pada hari Senin. Rekan-rekannya menduga bahwa jalan menuju kantor lebih macet pada hari Senin.
Manakah pernyataan yang, jika benar, PALING MEMPERKUAT dugaan rekan-rekan Pak Anto?', 'Data waktu tempuh yang lebih lama pada hari Senin langsung mendukung dugaan jalan lebih macet. A menawarkan penyebab lain, D melemahkan dugaan, B dan C tidak relevan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Anto sering tidur larut malam pada akhir pekan.', false),
  ('B', 'Kantor Pak Anto mulai bekerja pukul 08.00.', false),
  ('C', 'Pak Anto naik kendaraan umum pada hari lain.', false),
  ('D', 'Rekan-rekan lain yang melewati jalan yang sama juga tepat waktu pada hari Senin.', false),
  ('E', 'Data lalu lintas menunjukkan waktu tempuh menuju kantor pada hari Senin rata-rata 30 menit lebih lama daripada hari lain.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-025', m.id, 'sulit', 'Seorang pedagang berkata, "Setiap kali saya menurunkan harga jus jeruk, penjualannya naik. Jadi menurunkan harga pasti menaikkan keuntungan saya."
Manakah pernyataan yang PALING TEPAT menunjukkan kelemahan penalaran pedagang tersebut?', 'Keuntungan = jumlah terjual × laba per unit. Harga turun menaikkan penjualan tetapi menurunkan laba per unit, sehingga keuntungan total belum tentu naik. Pedagang menyamakan kenaikan penjualan dengan kenaikan keuntungan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pedagang tidak menyebutkan jenis jeruk yang dipakai.', false),
  ('B', 'Kenaikan penjualan belum tentu menaikkan keuntungan karena keuntungan per gelas ikut menurun.', true),
  ('C', 'Penjualan seharusnya tidak boleh naik ketika harga turun.', false),
  ('D', 'Jus jeruk bukan produk utama pedagang tersebut.', false),
  ('E', 'Harga tidak berhubungan dengan penjualan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-026', m.id, 'mudah', 'Buku : perpustakaan = lukisan : ….', 'Buku disimpan dan dipajang di perpustakaan, lukisan dipajang di galeri. Kuas, kanvas, dan cat adalah alat atau bahan, pelukis adalah pembuatnya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kuas', false),
  ('B', 'kanvas', false),
  ('C', 'pelukis', false),
  ('D', 'cat', false),
  ('E', 'galeri', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-026'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-027', m.id, 'sulit', 'Bilangan berikutnya dari pola 3, 5, 9, 17, 33, … adalah ….', 'Selisih antarsuku 2, 4, 8, 16 sehingga selisih berikutnya 32. Suku berikutnya = 33 + 32 = 65 (setara dengan 2n − 1: 2 × 33 − 1 = 65).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '49', false),
  ('B', '57', false),
  ('C', '65', true),
  ('D', '66', false),
  ('E', '81', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-027'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-028', m.id, 'sedang', 'Dalam sepuluh hari terakhir, setiap hari ketika langit pagi mendung, sore harinya turun hujan di Kota Kenanga. Pagi ini langit Kota Kenanga mendung.
Manakah simpulan yang PALING TEPAT?', 'Pola 10 hari memberi dasar untuk memperkirakan, bukan memastikan. Simpulan induktif yang tepat menggunakan kata "kemungkinan besar". B terlalu pasti, D dan E menarik kesimpulan tentang hari tidak mendung yang tidak diamati.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sore ini kemungkinan besar turun hujan di Kota Kenanga.', true),
  ('B', 'Sore ini pasti turun hujan di Kota Kenanga.', false),
  ('C', 'Sore ini tidak akan turun hujan di Kota Kenanga.', false),
  ('D', 'Hujan hanya turun jika langit pagi mendung.', false),
  ('E', 'Jika langit pagi tidak mendung, sore tidak akan hujan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-028'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-029', m.id, 'sedang', 'Tiga merek baterai diuji pada senter yang sama dalam kondisi yang sama. Baterai P menyala selama 12 jam, baterai Q selama 18 jam, dan baterai R selama 15 jam.
Manakah simpulan yang PALING TEPAT?', 'Data hanya menunjukkan lama menyala pada senter yang diuji. Simpulan yang sah dibatasi pada pengujian itu. A menggeneralisasi ke semua perangkat, C, D, dan E membahas harga atau kelayakan jual yang tidak ada datanya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Baterai Q selalu paling awet pada semua perangkat.', false),
  ('B', 'Pada pengujian senter tersebut, baterai Q bertahan paling lama.', true),
  ('C', 'Baterai R lebih murah daripada baterai Q.', false),
  ('D', 'Baterai P tidak layak dijual.', false),
  ('E', 'Ketahanan baterai berbanding lurus dengan harganya.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-029'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-030', m.id, 'sulit', 'Anak-anak di Desa Lembah yang rutin dibacakan dongeng sebelum tidur memiliki kosakata lebih banyak daripada anak-anak yang tidak. Seorang pakar menyimpulkan bahwa dongeng sebelum tidur memperkaya kosakata anak.
Manakah pernyataan yang, jika benar, PALING MEMPERLEMAH simpulan pakar?', 'Jika keluarga pembaca dongeng juga melakukan kegiatan lain yang memperkaya bahasa, selisih kosakata bisa berasal dari kegiatan itu, bukan dari dongeng. Hubungan sebab-akibat yang diklaim pakar menjadi lemah. A mendukung, B, C, dan E tidak relevan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dongeng yang dibacakan mengandung banyak kata baru bagi anak.', false),
  ('B', 'Desa Lembah tidak memiliki siaran televisi.', false),
  ('C', 'Sebagian anak tidak menyukai dongeng.', false),
  ('D', 'Keluarga yang rutin membacakan dongeng umumnya juga sering mengajak anak mengobrol dan membaca buku sepanjang hari.', true),
  ('E', 'Dongeng biasanya dibacakan sekitar pukul 20.00.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-030'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-031', m.id, 'mudah', 'Setiap musim kemarau, debit air Sungai Tirta menurun dan sawah di sekitarnya kekurangan air.
Manakah simpulan yang PALING MUNGKIN BENAR?', 'Pola berulang: kemarau, debit sungai turun, sawah kekurangan air. Hanya A yang tidak melampaui informasi. Pilihan lain terlalu jauh (tidak dapat ditanami sepanjang tahun, mengering sepenuhnya, berpindah profesi, semua daerah).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Musim kemarau memengaruhi pasokan air pertanian di sekitar Sungai Tirta.', true),
  ('B', 'Sawah di sekitar Sungai Tirta tidak dapat ditanami sepanjang tahun.', false),
  ('C', 'Sungai Tirta mengering sepenuhnya setiap kemarau.', false),
  ('D', 'Petani di sekitar Sungai Tirta berpindah profesi saat kemarau.', false),
  ('E', 'Di semua daerah, kemarau membuat sawah kekurangan air.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-031'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-032', m.id, 'sedang', 'Harga tiket kereta api naik 10%, tetapi jumlah penumpang pada bulan berikutnya hanya turun 2%.
Manakah pernyataan yang PALING MUNGKIN menjelaskan penurunan penumpang yang sangat kecil tersebut?', 'Penurunan penumpang kecil artinya banyak orang tetap naik kereta meskipun harga naik, yang masuk akal bila alternatifnya sedikit. A, B, C, dan E akan mendorong penurunan penumpang yang lebih besar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Penumpang lebih memilih naik pesawat.', false),
  ('B', 'Harga bahan bakar kendaraan pribadi turun drastis.', false),
  ('C', 'Perjalanan kereta menjadi jauh lebih lambat.', false),
  ('D', 'Banyak penumpang tidak memiliki alternatif transportasi lain yang secepat dan semurah kereta.', true),
  ('E', 'Jumlah perjalanan kereta dikurangi separuhnya.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-032'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-033', m.id, 'sedang', 'Produsen sampo Helai mengiklankan bahwa sampo tersebut mengurangi kerontokan rambut dalam empat minggu.
Manakah pernyataan yang, jika benar, PALING MEMPERKUAT iklan tersebut?', 'Uji coba dengan kelompok pembanding memberi bukti langsung bahwa sampo mengurangi kerontokan. Pilihan lain tidak berkaitan dengan efektivitas.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sampo Helai memiliki aroma yang harum.', false),
  ('B', 'Harga sampo Helai lebih murah daripada sampo lain.', false),
  ('C', 'Dalam uji coba terhadap 200 orang, kelompok yang memakai sampo Helai mengalami kerontokan lebih sedikit daripada kelompok pembanding yang memakai sampo tanpa zat aktif.', true),
  ('D', 'Banyak selebritas memakai sampo Helai.', false),
  ('E', 'Sampo Helai dijual di toko daring.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-033'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-034', m.id, 'mudah', 'Gelas : air = dompet : ….', 'Gelas berfungsi menampung air, dompet berfungsi menampung uang. Kulit adalah bahan, saku dan tas adalah tempat menyimpan dompet, toko adalah tempat membeli.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kulit', false),
  ('B', 'saku', false),
  ('C', 'toko', false),
  ('D', 'tas', false),
  ('E', 'uang', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-034'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-IND-035', m.id, 'sulit', 'Dari 20 pasien yang mengikuti terapi relaksasi, 15 melaporkan tidur lebih nyenyak. Dari 20 pasien lain yang hanya diberi minum air hangat, 14 melaporkan tidur lebih nyenyak. Peneliti menyimpulkan bahwa terapi relaksasi efektif meningkatkan kualitas tidur.
Manakah pernyataan yang PALING TEPAT menilai simpulan tersebut?', 'Hampir sama banyak pasien yang merasa tidur lebih nyenyak di kelompok pembanding (14 dari 20) dibanding kelompok terapi (15 dari 20). Selisih satu orang tidak cukup untuk menyimpulkan terapi lebih efektif.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Induktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kuat, karena 15 dari 20 pasien lebih dari separuh.', false),
  ('B', 'Lemah, karena selisih kedua kelompok sangat kecil (15 dan 14 dari 20) sehingga terapi belum terbukti lebih efektif.', true),
  ('C', 'Kuat, karena terdapat dua kelompok pasien.', false),
  ('D', 'Lemah, karena kelompok kedua tidak mengikuti terapi apa pun.', false),
  ('E', 'Tidak relevan, karena air hangat tidak berkaitan dengan tidur.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-IND-035'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-001', m.id, 'mudah', 'Semua siswa kelas XII wajib mengikuti bimbingan UTBK. Sebagian siswa kelas XII adalah anggota OSIS.
Berdasarkan informasi tersebut, manakah simpulan yang PASTI BENAR?', 'Anggota OSIS yang berasal dari kelas XII pasti wajib mengikuti bimbingan UTBK, sehingga sebagian anggota OSIS wajib mengikutinya. Belum tentu semua anggota OSIS berasal dari kelas XII (A salah). Pilihan C, D, E bertentangan atau melampaui informasi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua anggota OSIS wajib mengikuti bimbingan UTBK.', false),
  ('B', 'Sebagian anggota OSIS wajib mengikuti bimbingan UTBK.', true),
  ('C', 'Semua siswa yang wajib mengikuti bimbingan UTBK adalah anggota OSIS.', false),
  ('D', 'Sebagian siswa kelas XII tidak wajib mengikuti bimbingan UTBK.', false),
  ('E', 'Tidak ada anggota OSIS yang wajib mengikuti bimbingan UTBK.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-002', m.id, 'mudah', 'Jika lampu lalu lintas menyala merah, maka semua kendaraan berhenti. Saat ini lampu lalu lintas di perempatan Jalan Mawar menyala merah.
Manakah simpulan yang BENAR?', 'Premis kedua membenarkan syarat "lampu merah", sehingga akibatnya pasti terjadi: semua kendaraan berhenti.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sebagian kendaraan tetap berjalan.', false),
  ('B', 'Lampu lalu lintas akan segera menyala hijau.', false),
  ('C', 'Tidak ada kendaraan yang melintas di perempatan itu.', false),
  ('D', 'Semua kendaraan di perempatan itu berhenti.', true),
  ('E', 'Lampu kuning ikut menyala.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-003', m.id, 'sedang', 'Jika Budi lulus seleksi, maka Budi mendapat beasiswa. Budi tidak mendapat beasiswa.
Manakah simpulan yang BENAR?', 'Kontraposisi dari "lulus → mendapat beasiswa" adalah "tidak mendapat beasiswa → tidak lulus". Karena Budi tidak mendapat beasiswa, ia pasti tidak lulus seleksi. Alasan ia tidak lulus (D, E) tidak diketahui.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Budi tidak lulus seleksi.', true),
  ('B', 'Budi lulus seleksi tetapi mendapat bantuan lain.', false),
  ('C', 'Budi mendapat beasiswa dari sumber lain.', false),
  ('D', 'Budi tidak mengikuti seleksi.', false),
  ('E', 'Budi mengundurkan diri dari seleksi.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-004', m.id, 'sedang', 'Jika sebuah pohon mangga berbuah, maka daunnya berwarna hijau. Pohon mangga di halaman Pak Ali berdaun hijau.
Manakah simpulan yang PALING TEPAT?', 'Premis hanya menyatakan berbuah → daun hijau. Daun hijau tidak mengharuskan berbuah (menegaskan akibat bukan penarikan yang sah). Jadi belum dapat dipastikan pohon itu berbuah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pohon mangga Pak Ali pasti berbuah.', false),
  ('B', 'Pohon mangga Pak Ali pasti tidak berbuah.', false),
  ('C', 'Semua pohon berdaun hijau pasti berbuah.', false),
  ('D', 'Pohon di halaman Pak Ali bukan pohon mangga.', false),
  ('E', 'Belum dapat dipastikan apakah pohon mangga Pak Ali berbuah.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-005', m.id, 'sedang', 'Sepulang sekolah, Rina akan pergi ke toko buku atau ke perpustakaan. Sore ini Rina tidak pergi ke perpustakaan.
Manakah simpulan yang BENAR?', 'Dari "A atau B" dan "bukan B" diperoleh A. Karena Rina tidak ke perpustakaan, ia pasti ke toko buku.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rina langsung pulang ke rumah.', false),
  ('B', 'Rina pergi ke toko buku dan perpustakaan.', false),
  ('C', 'Rina pergi ke toko buku.', true),
  ('D', 'Rina tidak pergi ke toko buku.', false),
  ('E', 'Rina pergi ke perpustakaan besok.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-006', m.id, 'sedang', 'Jika harga cabai naik, maka harga sambal botolan naik. Jika harga sambal botolan naik, maka omzet warung makan turun. Pekan ini harga cabai naik.
Manakah simpulan yang BENAR?', 'Harga cabai naik → harga sambal naik → omzet turun. Rantai implikasi menghasilkan omzet warung makan turun.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Warung makan akan tutup.', false),
  ('B', 'Harga sambal botolan turun.', false),
  ('C', 'Omzet warung makan naik.', false),
  ('D', 'Harga cabai turun pada pekan depan.', false),
  ('E', 'Omzet warung makan turun.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-007', m.id, 'sedang', 'Semua atlet renang berlatih setiap pagi. Tidak ada orang yang berlatih setiap pagi terlambat masuk kelas.
Manakah simpulan yang PASTI BENAR?', 'Atlet renang → berlatih setiap pagi → tidak terlambat. Maka tidak ada atlet renang yang terlambat. B dan D membalik arah premis sehingga tidak sah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Tidak ada atlet renang yang terlambat masuk kelas.', true),
  ('B', 'Semua orang yang tidak terlambat masuk kelas adalah atlet renang.', false),
  ('C', 'Sebagian atlet renang terlambat masuk kelas.', false),
  ('D', 'Semua orang yang berlatih setiap pagi adalah atlet renang.', false),
  ('E', 'Semua orang yang terlambat masuk kelas berlatih setiap pagi.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-008', m.id, 'sulit', 'Pernyataan "Semua peserta lomba memperoleh sertifikat" ternyata SALAH.
Manakah pernyataan berikut yang PASTI BENAR?', 'Negasi dari "semua P adalah Q" adalah "sedikitnya satu P bukan Q". Jadi hanya dipastikan ada minimal satu peserta tanpa sertifikat; banyaknya (A, B, D) dan adanya yang memperoleh sertifikat (E) tidak dapat dipastikan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Tidak ada peserta lomba yang memperoleh sertifikat.', false),
  ('B', 'Sebagian besar peserta lomba tidak memperoleh sertifikat.', false),
  ('C', 'Sedikitnya satu peserta lomba tidak memperoleh sertifikat.', true),
  ('D', 'Semua peserta lomba tidak memperoleh sertifikat.', false),
  ('E', 'Sedikitnya satu peserta lomba memperoleh sertifikat.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-009', m.id, 'sedang', 'Jika sebuah bilangan habis dibagi 6, maka bilangan itu habis dibagi 3. Bilangan N tidak habis dibagi 3.
Manakah simpulan yang BENAR?', 'Kontraposisi: tidak habis dibagi 3 → tidak habis dibagi 6. Habis dibagi 2 atau ganjil tidak dapat disimpulkan (misalnya N = 4 atau N = 5).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'N habis dibagi 6.', false),
  ('B', 'N tidak habis dibagi 6.', true),
  ('C', 'N habis dibagi 2.', false),
  ('D', 'N tidak habis dibagi 2.', false),
  ('E', 'N adalah bilangan ganjil.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-010', m.id, 'sulit', 'Seorang pelamar diterima hanya jika ia lulus tes tertulis dan lulus wawancara. Andi diterima.
Manakah simpulan yang PASTI BENAR?', '"Diterima hanya jika (lulus tulis dan lulus wawancara)" berarti diterima → lulus keduanya. Karena Andi diterima, ia pasti lulus keduanya. C membalik arah premis sehingga tidak pasti.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Andi hanya lulus tes tertulis.', false),
  ('B', 'Andi hanya lulus wawancara.', false),
  ('C', 'Semua pelamar yang lulus tes tertulis dan wawancara pasti diterima.', false),
  ('D', 'Andi lulus tes tertulis dan lulus wawancara.', true),
  ('E', 'Andi tidak lulus tes tertulis tetapi lulus wawancara.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-011', m.id, 'sedang', 'Semua pegawai bagian keuangan dapat mengoperasikan aplikasi akuntansi. Sebagian pegawai yang dapat mengoperasikan aplikasi akuntansi adalah lulusan ekonomi. Mira adalah pegawai bagian keuangan.
Manakah pernyataan yang PASTI BENAR?', 'Mira pegawai keuangan, dan semua pegawai keuangan dapat mengoperasikan aplikasi akuntansi. Latar belakang pendidikan Mira tidak dapat dipastikan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Mira dapat mengoperasikan aplikasi akuntansi.', true),
  ('B', 'Mira lulusan ekonomi.', false),
  ('C', 'Mira bukan lulusan ekonomi.', false),
  ('D', 'Semua pegawai bagian keuangan lulusan ekonomi.', false),
  ('E', 'Hanya pegawai bagian keuangan yang dapat mengoperasikan aplikasi akuntansi.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-012', m.id, 'sulit', 'Lima orang (D, A, B, C, dan E) mengantre membeli tiket. D berdiri tepat di depan A. B berdiri di belakang A. C berdiri tepat di belakang B. E berdiri paling belakang.
Orang yang berdiri di urutan ketiga dari depan adalah ….', 'E di urutan 5. D tepat di depan A membentuk blok "D A", sedangkan B diikuti C membentuk blok "B C", dan blok "D A" harus mendahului blok "B C". Urutan: D, A, B, C, E. Orang di urutan ketiga adalah B.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'A', false),
  ('B', 'C', false),
  ('C', 'B', true),
  ('D', 'D', false),
  ('E', 'E', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-013', m.id, 'sedang', 'Jika Budi rajin belajar, maka ia lulus ujian. Jika Budi lulus ujian, maka ia mendapat sertifikat. Budi tidak mendapat sertifikat.
Manakah simpulan yang PASTI BENAR?', 'Tidak mendapat sertifikat → tidak lulus ujian (kontraposisi premis 2) → tidak rajin belajar (kontraposisi premis 1). Jadi Budi tidak lulus ujian dan tidak rajin belajar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Budi lulus ujian tetapi tidak rajin belajar.', false),
  ('B', 'Budi rajin belajar tetapi tidak lulus ujian.', false),
  ('C', 'Budi lulus ujian dan mendapat sertifikat.', false),
  ('D', 'Budi rajin belajar dan lulus ujian.', false),
  ('E', 'Budi tidak lulus ujian dan tidak rajin belajar.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-014', m.id, 'mudah', 'Semua kucing adalah mamalia. Semua mamalia bernapas dengan paru-paru.
Manakah simpulan yang BENAR?', 'Silogisme: kucing ⊂ mamalia ⊂ hewan berparu-paru, sehingga semua kucing bernapas dengan paru-paru.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua hewan yang bernapas dengan paru-paru adalah kucing.', false),
  ('B', 'Semua kucing bernapas dengan paru-paru.', true),
  ('C', 'Sebagian mamalia bukan kucing dan tidak bernapas dengan paru-paru.', false),
  ('D', 'Sebagian kucing bukan mamalia.', false),
  ('E', 'Tidak ada mamalia yang bukan kucing.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-015', m.id, 'sedang', 'Semua dokter di Klinik Sehat mengenakan seragam putih saat bertugas. Rahma adalah dokter di Klinik Sehat dan saat ini sedang bertugas.
Manakah pernyataan berikut yang PASTI SALAH?', 'Rahma dokter di Klinik Sehat yang sedang bertugas, sehingga ia pasti berseragam putih. Pernyataan yang menyangkalnya (D) pasti salah. B, C, dan E tidak dapat ditentukan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rahma mengenakan seragam putih.', false),
  ('B', 'Rahma bekerja di klinik lain juga.', false),
  ('C', 'Rahma mengenakan jas dokter.', false),
  ('D', 'Rahma tidak mengenakan seragam putih.', true),
  ('E', 'Rahma sedang berbicara dengan pasien.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-016', m.id, 'sedang', 'Sebagian pelari maraton adalah vegetarian. Tidak ada vegetarian yang makan daging merah.
Manakah simpulan yang PASTI BENAR?', 'Pelari maraton yang vegetarian pasti tidak makan daging merah, sehingga sebagian pelari maraton tidak makan daging merah. Pelari maraton lain tidak diketahui, sehingga A, B, dan E terlalu jauh.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua pelari maraton tidak makan daging merah.', false),
  ('B', 'Tidak ada pelari maraton yang makan daging merah.', false),
  ('C', 'Sebagian pelari maraton tidak makan daging merah.', true),
  ('D', 'Sebagian vegetarian bukan pelari maraton.', false),
  ('E', 'Semua pelari maraton adalah vegetarian.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-017', m.id, 'sedang', 'Hanya anggota klub yang boleh masuk ke ruang latihan. Ratih boleh masuk ke ruang latihan.
Manakah simpulan yang BENAR?', '"Hanya anggota klub yang boleh masuk" berarti boleh masuk → anggota klub. Karena Ratih boleh masuk, ia anggota klub. B membalik arah premis sehingga tidak pasti.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ratih adalah anggota klub.', true),
  ('B', 'Semua anggota klub boleh masuk ke ruang latihan.', false),
  ('C', 'Ratih adalah ketua klub.', false),
  ('D', 'Ratih bukan anggota klub.', false),
  ('E', 'Hanya Ratih yang anggota klub.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-018', m.id, 'sulit', 'Jika Ani datang, maka Beni datang. Jika Beni datang, maka Candra tidak datang. Candra datang.
Manakah simpulan yang PASTI BENAR?', 'Candra datang → (kontraposisi premis 2) Beni tidak datang → (kontraposisi premis 1) Ani tidak datang. Jadi Ani dan Beni sama-sama tidak datang.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ani datang dan Beni datang.', false),
  ('B', 'Ani datang tetapi Beni tidak datang.', false),
  ('C', 'Ani tidak datang tetapi Beni datang.', false),
  ('D', 'Beni datang tetapi Candra tidak datang.', false),
  ('E', 'Ani dan Beni sama-sama tidak datang.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-019', m.id, 'sedang', 'Pernyataan "Jika Sinta menabung, maka ia dapat membeli sepeda" ekuivalen dengan pernyataan ….', 'Pernyataan implikasi ekuivalen dengan kontraposisinya: "Jika tidak dapat membeli sepeda, maka tidak menabung". A adalah invers dan C adalah konvers, keduanya tidak ekuivalen.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Jika Sinta tidak menabung, maka ia tidak dapat membeli sepeda.', false),
  ('B', 'Jika Sinta tidak dapat membeli sepeda, maka ia tidak menabung.', true),
  ('C', 'Jika Sinta dapat membeli sepeda, maka ia menabung.', false),
  ('D', 'Sinta menabung dan tidak dapat membeli sepeda.', false),
  ('E', 'Sinta menabung atau tidak dapat membeli sepeda.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-020', m.id, 'sedang', 'Negasi dari pernyataan "Jika hujan deras, maka pertandingan ditunda" adalah ….', 'Implikasi "p → q" bernilai salah hanya ketika p benar dan q salah. Negasinya adalah "p dan bukan q": hujan deras dan pertandingan tidak ditunda.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Jika tidak hujan deras, maka pertandingan tidak ditunda.', false),
  ('B', 'Tidak hujan deras dan pertandingan ditunda.', false),
  ('C', 'Jika pertandingan tidak ditunda, maka tidak hujan deras.', false),
  ('D', 'Hujan deras dan pertandingan tidak ditunda.', true),
  ('E', 'Hujan deras atau pertandingan ditunda.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-021', m.id, 'sedang', 'Kartu diskon berlaku jika total belanja lebih dari Rp100.000 atau pembeli adalah anggota toko. Kartu diskon tidak berlaku untuk Tono.
Manakah simpulan yang PASTI BENAR?', 'Jika salah satu syarat (belanja > Rp100.000 atau anggota) terpenuhi, kartu pasti berlaku. Karena kartu tidak berlaku, kedua syarat tidak terpenuhi: belanja tidak lebih dari Rp100.000 dan bukan anggota.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Total belanja Tono tidak lebih dari Rp100.000 dan Tono bukan anggota toko.', true),
  ('B', 'Total belanja Tono lebih dari Rp100.000 tetapi Tono bukan anggota toko.', false),
  ('C', 'Total belanja Tono tidak lebih dari Rp100.000 atau Tono anggota toko.', false),
  ('D', 'Tono anggota toko tetapi total belanjanya tidak lebih dari Rp100.000.', false),
  ('E', 'Tono tidak berbelanja.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-022', m.id, 'sedang', 'Empat rumah berjajar dari barat ke timur dan dicat merah, biru, hijau, serta kuning (masing-masing satu warna). Rumah hijau berada tepat di sebelah timur rumah biru. Rumah kuning berada paling timur. Rumah merah berada di sebelah barat rumah biru (tidak harus bersebelahan).
Rumah yang berada paling barat berwarna ….', 'Kuning di posisi 4. Pasangan biru–hijau (hijau tepat di timur biru) menempati posisi (1,2) atau (2,3). Merah harus di barat biru sehingga biru tidak boleh di posisi 1; maka biru di 2, hijau di 3, merah di 1. Urutan: merah, biru, hijau, kuning.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'biru', false),
  ('B', 'hijau', false),
  ('C', 'merah', true),
  ('D', 'kuning', false),
  ('E', 'tidak dapat ditentukan', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-023', m.id, 'sedang', 'Peserta pelatihan dinyatakan lulus jika nilai tesnya paling sedikit 70 dan kehadirannya paling sedikit 80%. Sari tidak dinyatakan lulus, padahal nilai tesnya 75.
Manakah simpulan yang PASTI BENAR?', 'Jika kedua syarat terpenuhi, peserta pasti lulus. Sari tidak lulus, jadi sedikitnya satu syarat tidak terpenuhi. Nilai 75 sudah memenuhi syarat nilai, sehingga syarat kehadiran yang tidak terpenuhi: kehadiran kurang dari 80%.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sari tidak mengikuti tes.', false),
  ('B', 'Nilai tes Sari kurang dari 70.', false),
  ('C', 'Sari tidak pernah hadir.', false),
  ('D', 'Kehadiran Sari tepat 80%.', false),
  ('E', 'Kehadiran Sari kurang dari 80%.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-024', m.id, 'mudah', 'Semua bunga di taman kota berwarna merah atau kuning. Mawar di taman kota itu tidak berwarna merah.
Manakah simpulan yang BENAR?', 'Semua bunga di taman itu merah atau kuning. Mawar tidak merah, maka ia kuning.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Mawar itu berwarna putih.', false),
  ('B', 'Mawar itu berwarna merah dan kuning.', false),
  ('C', 'Mawar itu tidak berbunga.', false),
  ('D', 'Mawar itu berwarna kuning.', true),
  ('E', 'Mawar itu bukan bunga taman kota.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-025', m.id, 'mudah', 'Perpustakaan Kota buka setiap hari kecuali hari Minggu dan hari libur nasional. Hari Peringatan Nusa jatuh pada hari Senin dan ditetapkan sebagai hari libur nasional.
Manakah simpulan yang BENAR?', 'Pengecualian berlaku untuk hari Minggu dan hari libur nasional. Hari Peringatan Nusa adalah hari libur nasional, sehingga perpustakaan tutup.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Perpustakaan Kota buka pada Hari Peringatan Nusa karena hari itu hari Senin.', false),
  ('B', 'Perpustakaan Kota tutup pada Hari Peringatan Nusa.', true),
  ('C', 'Perpustakaan Kota tutup setiap hari Senin.', false),
  ('D', 'Perpustakaan Kota buka setengah hari pada hari libur nasional.', false),
  ('E', 'Perpustakaan Kota hanya buka pada hari Senin.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-026', m.id, 'sulit', 'Jika Eko membawa bekal, maka Fira tidak membawa bekal. Fira membawa bekal atau Gita membawa bekal. Gita tidak membawa bekal.
Manakah simpulan yang PASTI BENAR?', 'Dari "Fira atau Gita membawa bekal" dan "Gita tidak membawa", Fira membawa bekal. Premis pertama: Eko membawa → Fira tidak membawa; karena Fira membawa, Eko tidak membawa (kontraposisi).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Fira membawa bekal dan Eko tidak membawa bekal.', true),
  ('B', 'Eko dan Fira sama-sama membawa bekal.', false),
  ('C', 'Eko membawa bekal dan Fira tidak membawa bekal.', false),
  ('D', 'Tidak ada seorang pun yang membawa bekal.', false),
  ('E', 'Gita membawa bekal tetapi Eko tidak.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-026'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-027', m.id, 'sedang', 'Tidak ada karyawan magang yang memiliki kartu akses penuh. Sebagian karyawan yang memiliki kartu akses penuh adalah manajer.
Manakah simpulan yang PASTI BENAR?', 'Manajer yang memiliki kartu akses penuh pasti bukan karyawan magang, sehingga sebagian manajer bukan karyawan magang. Tidak dapat dipastikan keadaan manajer lain (D, E), dan A serta B bertentangan dengan premis.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua manajer adalah karyawan magang.', false),
  ('B', 'Sebagian karyawan magang adalah manajer.', false),
  ('C', 'Sebagian manajer bukan karyawan magang.', true),
  ('D', 'Semua manajer memiliki kartu akses penuh.', false),
  ('E', 'Tidak ada manajer yang menjadi karyawan magang.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-027'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-028', m.id, 'sedang', 'Pada hari Selasa, Dina tidak pergi bekerja jika hujan deras. Pada hari Selasa pekan lalu, Dina pergi bekerja.
Manakah simpulan yang PASTI BENAR?', 'Hujan deras → Dina tidak bekerja. Kontraposisi: Dina bekerja → tidak hujan deras. Maka hari Selasa itu tidak hujan deras.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pada hari itu hujan deras.', false),
  ('B', 'Pada hari itu Dina bekerja dari rumah.', false),
  ('C', 'Pada hari itu hujan ringan.', false),
  ('D', 'Pada hari itu libur nasional.', false),
  ('E', 'Pada hari itu tidak hujan deras.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-028'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-029', m.id, 'mudah', 'Rudi, Sinta, dan Tomi masing-masing memesan satu minuman yang berbeda, yaitu teh, kopi, atau jus. Rudi tidak memesan teh maupun kopi. Sinta tidak memesan kopi.
Minuman yang dipesan Tomi adalah ….', 'Rudi tidak memesan teh dan kopi, maka Rudi memesan jus. Sinta tidak memesan kopi dan jus sudah diambil, maka Sinta memesan teh. Sisanya kopi untuk Tomi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'teh', false),
  ('B', 'kopi', true),
  ('C', 'jus', false),
  ('D', 'teh atau jus', false),
  ('E', 'tidak dapat ditentukan', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-029'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-030', m.id, 'sulit', 'Jika Pak Dedi menjual ladang, maka ia membeli rumah. Pak Dedi membeli rumah hanya jika ia mendapat pinjaman. Pak Dedi tidak mendapat pinjaman.
Manakah simpulan yang PASTI BENAR?', '"Membeli rumah hanya jika mendapat pinjaman" berarti beli rumah → pinjaman. Tidak ada pinjaman → tidak membeli rumah. Kontraposisi premis pertama: tidak membeli rumah → tidak menjual ladang. Jadi ia tidak menjual ladang dan tidak membeli rumah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Dedi menjual ladang tetapi tidak membeli rumah.', false),
  ('B', 'Pak Dedi membeli rumah dengan uang tunai.', false),
  ('C', 'Pak Dedi menjual ladang dan membeli rumah.', false),
  ('D', 'Pak Dedi tidak menjual ladang dan tidak membeli rumah.', true),
  ('E', 'Pak Dedi tidak menjual ladang tetapi membeli rumah.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-030'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-031', m.id, 'mudah', 'Semua guru di SMA Cendana adalah lulusan sarjana. Pak Wira adalah guru di SMA Cendana.
Manakah simpulan yang BENAR?', 'Pak Wira termasuk guru di SMA Cendana, dan semua guru di sana lulusan sarjana. Jadi Pak Wira lulusan sarjana.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Wira lulusan sarjana.', true),
  ('B', 'Pak Wira lulusan magister.', false),
  ('C', 'Pak Wira mengajar semua mata pelajaran.', false),
  ('D', 'Semua lulusan sarjana adalah guru di SMA Cendana.', false),
  ('E', 'Pak Wira bukan lulusan sarjana.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-031'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-032', m.id, 'sedang', 'Semua obat yang dijual bebas aman dikonsumsi tanpa resep dokter. Tablet Zora aman dikonsumsi tanpa resep dokter.
Manakah simpulan yang PALING TEPAT?', 'Premis berbentuk "dijual bebas → aman tanpa resep". Tablet Zora memenuhi akibat (aman tanpa resep), tetapi itu tidak membuktikan syaratnya (dijual bebas). Bisa saja obat aman lain yang tidak dijual bebas.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Tablet Zora adalah obat yang dijual bebas.', false),
  ('B', 'Tablet Zora bukan obat.', false),
  ('C', 'Belum dapat dipastikan apakah Tablet Zora dijual bebas.', true),
  ('D', 'Tablet Zora berbahaya jika dikonsumsi tanpa resep dokter.', false),
  ('E', 'Tablet Zora tidak dijual di apotek.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-032'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-DED-033', m.id, 'sulit', 'Empat orang (P, Q, R, S) duduk berjajar pada kursi bernomor 1 sampai 4 dari kiri ke kanan. P tidak duduk di kursi 1. Q duduk tepat di sebelah kanan R. S duduk di salah satu ujung. P tidak duduk bersebelahan dengan S.
Orang yang duduk di kursi 3 adalah ….', 'Q tepat di kanan R sehingga R dan Q bersebelahan (R lalu Q). S di kursi 1 atau 4. Kemungkinan tanpa syarat terakhir: S-P-R-Q, S-R-Q-P, atau R-Q-P-S. S-P-R-Q dan R-Q-P-S membuat P bersebelahan dengan S sehingga gugur. Tersisa S-R-Q-P, dan kursi 3 ditempati Q.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Deduktif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'P', false),
  ('B', 'R', false),
  ('C', 'S', false),
  ('D', 'tidak dapat ditentukan', false),
  ('E', 'Q', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-DED-033'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-001', m.id, 'mudah', 'Andi dapat menyelesaikan suatu pekerjaan dalam 12 hari, sedangkan Budi dapat menyelesaikan pekerjaan yang sama dalam 6 hari. Jika keduanya bekerja bersama, pekerjaan tersebut selesai dalam ... hari.', 'Dalam 1 hari Andi mengerjakan 1/12 bagian dan Budi 1/6 bagian. Bersama: 1/12 + 2/12 = 3/12 = 1/4 bagian per hari, sehingga pekerjaan selesai dalam 4 hari.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2', false),
  ('B', '3', false),
  ('C', '3,5', false),
  ('D', '4', true),
  ('E', '6', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-002', m.id, 'mudah', 'Harga sebuah buku Rp80.000. Buku tersebut mendapat diskon 25%, kemudian pembeli menggunakan voucher Rp5.000. Harga yang harus dibayar adalah ….', 'Harga setelah diskon = 75% × 80.000 = Rp60.000. Setelah voucher: 60.000 − 5.000 = Rp55.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp55.000', true),
  ('B', 'Rp56.000', false),
  ('C', 'Rp60.000', false),
  ('D', 'Rp65.000', false),
  ('E', 'Rp70.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-003', m.id, 'sedang', 'Umur ayah sekarang 4 kali umur Dani. Enam tahun lagi, umur ayah menjadi 3 kali umur Dani. Umur Dani sekarang adalah ... tahun.', 'Misalkan umur Dani d, ayah 4d. Enam tahun lagi: 4d + 6 = 3(d + 6) = 3d + 18, sehingga d = 12.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '8', false),
  ('C', '9', false),
  ('D', '10', false),
  ('E', '12', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-004', m.id, 'sedang', 'Sebuah mobil menempuh 180 km dalam 3 jam pertama, kemudian 140 km dalam 2 jam berikutnya. Kecepatan rata-rata mobil selama seluruh perjalanan adalah ... km/jam.', 'Kecepatan rata-rata = jarak total : waktu total = (180 + 140) : (3 + 2) = 320 : 5 = 64 km/jam. (Rata-rata kedua kecepatan, yaitu (60 + 70) : 2 = 65, tidak tepat karena waktu tempuhnya berbeda.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '60', false),
  ('B', '62', false),
  ('C', '64', true),
  ('D', '65', false),
  ('E', '66', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-005', m.id, 'sedang', 'Penjualan empat toko (dalam unit) pada bulan Januari dan Maret ditunjukkan pada tabel berikut.
Toko | Januari | Maret
A | 40 | 50
B | 20 | 32
C | 60 | 84
D | 100 | 130
Toko yang mengalami persentase kenaikan penjualan terbesar dari Januari ke Maret adalah ….', 'Kenaikan: A 10/40 = 25%, B 12/20 = 60%, C 24/60 = 40%, D 30/100 = 30%. Persentase terbesar dimiliki Toko B. (Toko D memiliki kenaikan jumlah terbesar, tetapi bukan persentase terbesar.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Toko A', false),
  ('B', 'Toko B', true),
  ('C', 'Toko C', false),
  ('D', 'Toko D', false),
  ('E', 'Persentase kenaikan keempat toko sama', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-006', m.id, 'sedang', 'Rata-rata nilai 6 siswa adalah 70. Dua siswa dengan nilai 50 dan 60 keluar dari kelompok tersebut. Rata-rata nilai siswa yang tersisa adalah ….', 'Jumlah nilai awal = 70 × 6 = 420. Setelah dua siswa keluar: 420 − 110 = 310 untuk 4 siswa. Rata-ratanya 310 : 4 = 77,5.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '72,5', false),
  ('B', '75', false),
  ('C', '76', false),
  ('D', '77,5', true),
  ('E', '80', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-007', m.id, 'mudah', 'Sebuah resep kue untuk 4 orang memerlukan 300 gram tepung. Jika kue dibuat untuk 10 orang dengan resep yang sama, tepung yang diperlukan adalah ... gram.', 'Banyak tepung sebanding dengan banyak orang: 300 × 10/4 = 750 gram.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '750', true),
  ('B', '700', false),
  ('C', '800', false),
  ('D', '900', false),
  ('E', '1.200', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-008', m.id, 'sedang', 'Rina menabung Rp2.000.000 di bank dengan bunga tunggal 6% per tahun. Setelah 9 bulan, jumlah tabungan Rina menjadi ….', 'Bunga 9 bulan = 2.000.000 × 6% × 9/12 = Rp90.000. Jumlah tabungan = Rp2.090.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp2.060.000', false),
  ('B', 'Rp2.080.000', false),
  ('C', 'Rp2.090.000', true),
  ('D', 'Rp2.120.000', false),
  ('E', 'Rp2.180.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-009', m.id, 'sedang', 'Dalam sebuah turnamen, setiap tim bertemu dengan tim lainnya tepat satu kali. Jika terdapat 8 tim, banyak pertandingan yang dimainkan adalah ….', 'Banyak pertandingan = C(8, 2) = (8 × 7) : 2 = 28.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '14', false),
  ('B', '16', false),
  ('C', '24', false),
  ('D', '26', false),
  ('E', '28', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-010', m.id, 'sulit', 'Kran A dapat mengisi sebuah bak hingga penuh dalam 6 jam, kran B dalam 4 jam, sedangkan lubang pembuangan dapat mengosongkan bak penuh dalam 12 jam. Jika kedua kran dan lubang pembuangan dibuka bersamaan dari keadaan bak kosong, bak penuh dalam ... jam.', 'Dalam 1 jam: 1/6 + 1/4 − 1/12 = 2/12 + 3/12 − 1/12 = 4/12 = 1/3 bagian bak. Maka bak penuh dalam 3 jam.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '2,5', false),
  ('B', '3', true),
  ('C', '3,5', false),
  ('D', '4', false),
  ('E', '5', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-011', m.id, 'sedang', 'Harga sebuah barang dinaikkan 20%, kemudian diturunkan 20% dari harga yang baru. Dibandingkan harga semula, harga akhir barang tersebut ….', 'Misalkan harga semula 100. Setelah naik 20% menjadi 120. Turun 20% dari 120 adalah 24, sehingga harga akhir 96. Harga turun 4% dari harga semula.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'turun 4%', true),
  ('B', 'tetap sama', false),
  ('C', 'turun 2%', false),
  ('D', 'naik 4%', false),
  ('E', 'turun 10%', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-012', m.id, 'mudah', 'Sebuah mobil menghabiskan 1 liter bensin untuk menempuh 12 km. Harga bensin Rp12.000 per liter. Biaya bensin untuk perjalanan 150 km adalah ….', 'Bensin yang diperlukan = 150 : 12 = 12,5 liter. Biayanya 12,5 × Rp12.000 = Rp150.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp120.000', false),
  ('B', 'Rp130.000', false),
  ('C', 'Rp140.000', false),
  ('D', 'Rp150.000', true),
  ('E', 'Rp160.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-013', m.id, 'sedang', 'Jumlah dua bilangan adalah 56 dan selisihnya 14. Bilangan yang lebih besar adalah ….', 'Bilangan besar = (jumlah + selisih) : 2 = (56 + 14) : 2 = 35 dan bilangan kecil 21. Cek: 35 + 21 = 56 dan 35 − 21 = 14.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '28', false),
  ('B', '30', false),
  ('C', '35', true),
  ('D', '38', false),
  ('E', '42', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-014', m.id, 'sedang', 'Kereta A berangkat pukul 06.40 dan tiba pukul 09.15. Kereta B berangkat pukul 07.05 dan tiba pukul 09.30 pada hari yang sama.
Pernyataan yang BENAR mengenai waktu tempuh kedua kereta adalah ….', 'Waktu tempuh A = 06.40 sampai 09.15 = 2 jam 35 menit (155 menit). Waktu tempuh B = 07.05 sampai 09.30 = 2 jam 25 menit (145 menit). Kereta A lebih lama 10 menit.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kereta B lebih lama 5 menit daripada kereta A.', false),
  ('B', 'Kereta A lebih lama 5 menit daripada kereta B.', false),
  ('C', 'Kereta B lebih lama 10 menit daripada kereta A.', false),
  ('D', 'Waktu tempuh kedua kereta sama.', false),
  ('E', 'Kereta A lebih lama 10 menit daripada kereta B.', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-015', m.id, 'sulit', 'Sebanyak 200 ml larutan gula berkadar 10% dicampur dengan 300 ml larutan gula berkadar 20%. Kadar gula campuran tersebut adalah ... persen.', 'Gula dalam larutan pertama = 10% × 200 = 20 ml dan larutan kedua = 20% × 300 = 60 ml. Total gula 80 ml dalam 500 ml, sehingga kadarnya 80/500 = 16%. (Rata-rata kadar 15% keliru karena volumenya berbeda.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15', false),
  ('B', '16', true),
  ('C', '17', false),
  ('D', '18', false),
  ('E', '20', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-016', m.id, 'sedang', 'Perbandingan banyak kelereng Adi dan Budi adalah 3 : 5 dengan jumlah 96 butir. Setelah Budi memberikan 12 butir kepada Adi, selisih kelereng mereka adalah ... butir.', 'Adi = 3/8 × 96 = 36 dan Budi = 5/8 × 96 = 60. Setelah Budi memberi 12 butir: Adi 48 dan Budi 48, sehingga selisihnya 0.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '0', true),
  ('B', '6', false),
  ('C', '12', false),
  ('D', '24', false),
  ('E', '36', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-017', m.id, 'sedang', 'Ani berenang setiap 3 hari sekali dan Beni berenang setiap 4 hari sekali. Pada tanggal 1 Maret mereka berenang bersama. Mereka akan berenang bersama lagi pada tanggal ... Maret.', 'Mereka berenang bersama setiap KPK(3, 4) = 12 hari. Setelah tanggal 1 Maret, berikutnya pada tanggal 1 + 12 = 13 Maret.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '7', false),
  ('B', '10', false),
  ('C', '12', false),
  ('D', '13', true),
  ('E', '25', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-018', m.id, 'sedang', 'Pengeluaran bulanan sebuah keluarga sebesar Rp4.000.000 dibagi sebagai berikut.
Kategori | Persentase
Makanan | 35%
Transportasi | 20%
Pendidikan | 25%
Lain-lain | 20%
Selisih pengeluaran untuk makanan dan transportasi adalah ….', 'Selisih persentase = 35% − 20% = 15%. Selisih pengeluaran = 15% × Rp4.000.000 = Rp600.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp400.000', false),
  ('B', 'Rp500.000', false),
  ('C', 'Rp600.000', true),
  ('D', 'Rp800.000', false),
  ('E', 'Rp1.000.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-019', m.id, 'sedang', 'Pak Hadi menabung Rp50.000 pada bulan pertama. Setiap bulan berikutnya, tabungannya bertambah Rp10.000 dari bulan sebelumnya. Total tabungan Pak Hadi setelah 6 bulan adalah ….', 'Setoran tiap bulan: 50.000, 60.000, 70.000, 80.000, 90.000, 100.000. Jumlahnya Rp450.000. (Rumus deret aritmetika: 6/2 × (50.000 + 100.000) = 450.000.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp360.000', false),
  ('B', 'Rp390.000', false),
  ('C', 'Rp420.000', false),
  ('D', 'Rp440.000', false),
  ('E', 'Rp450.000', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-020', m.id, 'sulit', 'Motor A berangkat dari kota P pukul 08.00 dengan kecepatan 40 km/jam. Motor B berangkat dari kota P pukul 09.00 dengan kecepatan 60 km/jam melalui jalan yang sama. Motor B menyusul motor A pada pukul ….', 'Pada pukul 09.00 motor A sudah menempuh 40 km. Motor B menyusul dengan selisih kecepatan 60 − 40 = 20 km/jam, sehingga waktu menyusul = 40 : 20 = 2 jam setelah pukul 09.00, yaitu pukul 11.00.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '11.00', true),
  ('B', '10.30', false),
  ('C', '11.30', false),
  ('D', '12.00', false),
  ('E', '10.00', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-021', m.id, 'sedang', 'Seorang pedagang membeli 40 kg jeruk dengan harga Rp15.000 per kg. Sebanyak 5 kg jeruk busuk dan dibuang, sisanya dijual Rp20.000 per kg. Keuntungan pedagang tersebut adalah ….', 'Modal = 40 × 15.000 = Rp600.000. Pendapatan = 35 × 20.000 = Rp700.000. Keuntungan = 700.000 − 600.000 = Rp100.000.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp50.000', false),
  ('B', 'Rp100.000', true),
  ('C', 'Rp120.000', false),
  ('D', 'Rp150.000', false),
  ('E', 'Rp200.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-022', m.id, 'mudah', 'Sebuah mesin cetak mencetak 240 lembar dalam 8 menit. Dengan kecepatan yang sama, dalam 20 menit mesin tersebut mencetak ... lembar.', 'Kecepatan = 240 : 8 = 30 lembar per menit. Dalam 20 menit: 30 × 20 = 600 lembar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '480', false),
  ('B', '500', false),
  ('C', '560', false),
  ('D', '600', true),
  ('E', '640', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-023', m.id, 'sedang', 'Jumlah siswa baru di sebuah sekolah dalam empat tahun terakhir adalah sebagai berikut.
Tahun | Siswa baru
2021 | 120
2022 | 150
2023 | 180
2024 | 144
Persentase penurunan jumlah siswa baru dari tahun 2023 ke tahun 2024 adalah ... persen.', 'Penurunan = 180 − 144 = 36 siswa. Persentase penurunan = 36/180 × 100% = 20%.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '15', false),
  ('B', '18', false),
  ('C', '20', true),
  ('D', '24', false),
  ('E', '25', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-024', m.id, 'mudah', 'Rata-rata tiga bilangan adalah 20. Jika dua di antara bilangan tersebut adalah 15 dan 18, bilangan ketiga adalah ….', 'Jumlah ketiga bilangan = 20 × 3 = 60. Bilangan ketiga = 60 − 15 − 18 = 27.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '22', false),
  ('B', '24', false),
  ('C', '25', false),
  ('D', '26', false),
  ('E', '27', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-025', m.id, 'mudah', 'Dalam sebuah kuis dengan 40 soal, jawaban benar diberi skor 4, jawaban salah dikurangi 1, dan soal yang tidak dijawab diberi skor 0. Rafi menjawab benar 28 soal dan salah 8 soal, sisanya tidak dijawab. Skor akhir Rafi adalah ….', 'Skor dari jawaban benar = 28 × 4 = 112. Pengurangan dari jawaban salah = 8 × 1 = 8. Soal yang tidak dijawab (4 soal) bernilai 0. Skor akhir = 112 − 8 = 104.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '104', true),
  ('B', '112', false),
  ('C', '96', false),
  ('D', '108', false),
  ('E', '100', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-026', m.id, 'sedang', 'Umur ayah 5 tahun lebih tua daripada umur ibu. Umur Ani adalah seperempat umur ibu. Jumlah umur ketiganya 95 tahun. Umur ayah adalah ... tahun.', 'Misalkan umur ibu x. Ayah x + 5 dan Ani x/4. Jumlah: x + (x + 5) + x/4 = 95, sehingga 2,25x = 90 dan x = 40. Umur ayah = 40 + 5 = 45 tahun.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '40', false),
  ('B', '45', true),
  ('C', '48', false),
  ('D', '50', false),
  ('E', '55', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-026'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-027', m.id, 'sedang', 'Sebuah bak mandi berbentuk balok dengan ukuran dalam 80 cm × 50 cm × 60 cm. Bak tersebut terisi air sebanyak 3/4 bagian. Volume air di dalam bak adalah ... liter.', 'Volume bak = 80 × 50 × 60 = 240.000 cm³ = 240 liter. Terisi 3/4 bagian: 3/4 × 240 = 180 liter.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '120', false),
  ('B', '150', false),
  ('C', '160', false),
  ('D', '180', true),
  ('E', '240', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-027'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-028', m.id, 'sulit', 'Toko A menawarkan diskon 30% untuk sebuah televisi. Toko B menawarkan diskon 20% dan masih ditambah diskon 10% dari harga setelah diskon pertama. Harga televisi sebelum diskon di kedua toko Rp500.000.
Pernyataan yang BENAR adalah ….', 'Harga Toko A = 70% × 500.000 = Rp350.000. Harga Toko B = 80% × 500.000 = 400.000, lalu 90% × 400.000 = Rp360.000. Toko A lebih murah Rp10.000. (Diskon 20% + 10% bertingkat bukan 30%.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Toko B lebih murah Rp10.000 daripada Toko A.', false),
  ('B', 'Harga di kedua toko sama.', false),
  ('C', 'Toko A lebih murah Rp10.000 daripada Toko B.', true),
  ('D', 'Toko A lebih murah Rp20.000 daripada Toko B.', false),
  ('E', 'Toko B lebih murah Rp15.000 daripada Toko A.', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-028'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-029', m.id, 'sedang', 'Lima orang pekerja dapat menyelesaikan suatu proyek dalam 12 hari. Setelah bekerja 4 hari, ditambahkan 3 orang pekerja dengan kemampuan yang sama. Proyek selesai dalam total ... hari.', 'Total pekerjaan = 5 × 12 = 60 hari-orang. Dalam 4 hari pertama selesai 5 × 4 = 20 hari-orang, sisa 40. Dengan 8 pekerja, sisa selesai dalam 40 : 8 = 5 hari. Total 4 + 5 = 9 hari.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '6', false),
  ('B', '7', false),
  ('C', '8', false),
  ('D', '10', false),
  ('E', '9', true)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-029'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-030', m.id, 'mudah', 'Sebuah drum berisi 160 liter minyak. Pada hari pertama dipakai 25% isi drum. Pada hari kedua dipakai 25% dari sisa minyak setelah hari pertama. Sisa minyak di dalam drum adalah ... liter.', 'Hari pertama dipakai 40 liter, sisa 120 liter. Hari kedua dipakai 25% × 120 = 30 liter. Sisa = 120 − 30 = 90 liter.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '90', true),
  ('B', '100', false),
  ('C', '80', false),
  ('D', '70', false),
  ('E', '110', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-030'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-031', m.id, 'sulit', 'Sebuah bilangan terdiri dari dua angka dengan jumlah angka 11. Jika kedua angkanya ditukar, bilangan yang baru lebih besar 27 daripada bilangan semula. Bilangan semula adalah ….', 'Misalkan bilangan 10a + b dengan a + b = 11. Setelah ditukar: 10b + a. Selisihnya 9(b − a) = 27 sehingga b − a = 3. Dari a + b = 11 diperoleh a = 4 dan b = 7, jadi bilangan semula 47 (74 − 47 = 27).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '38', false),
  ('B', '47', true),
  ('C', '56', false),
  ('D', '29', false),
  ('E', '74', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-031'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PU-KUA-032', m.id, 'sedang', 'Harga 3 pensil dan 2 buku adalah Rp21.000, sedangkan harga 2 pensil dan 3 buku adalah Rp24.000. Harga 1 pensil dan 1 buku adalah ….', 'Jumlahkan kedua persamaan: 5 pensil + 5 buku = Rp45.000, sehingga 1 pensil + 1 buku = 45.000 : 5 = Rp9.000. (Pensil Rp3.000 dan buku Rp6.000.)'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Penalaran Umum' and m.nama = 'Penalaran Kuantitatif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rp7.500', false),
  ('B', 'Rp8.000', false),
  ('C', 'Rp8.500', false),
  ('D', 'Rp9.000', true),
  ('E', 'Rp10.000', false)
) as v (label, isi, is_benar)
where so.kode = 'PU-KUA-032'
on conflict (soal_id, label) do nothing;
