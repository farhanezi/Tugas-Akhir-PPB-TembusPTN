-- =====================================================================
-- Soal latihan: Pemahaman Bacaan dan Menulis (100 soal). Orisinal, ditulis untuk TembusPTN.
-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).
-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).
-- =====================================================================

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PBM-SIM-001') then
    insert into wacana (isi) values ('(1) Sejumlah sekolah mulai mengizinkan siswa memanfaatkan kecerdasan buatan untuk membantu belajar. (2) Aplikasi tersebut dapat menjelaskan ulang materi dengan bahasa yang lebih sederhana dan memberi latihan soal sesuai kemampuan siswa. (3) Siswa yang malu bertanya di kelas pun memiliki ruang untuk memahami materi tanpa tekanan. (4) Guru terbantu karena dapat memakai waktu tatap muka untuk diskusi yang lebih mendalam.
(5) Di sisi lain, penggunaan kecerdasan buatan tanpa batas dapat melemahkan kebiasaan berpikir mandiri. (6) Siswa yang langsung menyalin jawaban dari aplikasi tidak melatih kemampuan menalar. (7) Karena itu, sekolah perlu menetapkan aturan yang jelas tentang kapan dan bagaimana aplikasi tersebut boleh digunakan. (8) Dengan aturan tersebut, kecerdasan buatan dapat menjadi pendamping belajar, bukan pengganti proses berpikir.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-001', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan tentang kecerdasan buatan di sekolah adalah ….', 'Paragraf pertama memaparkan manfaat kecerdasan buatan bagi siswa (penjelasan ulang, latihan soal, ruang bertanya) dan guru (waktu untuk diskusi).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Siswa lebih pandai daripada guru dalam menggunakan aplikasi.', false),
      ('B', 'Kecerdasan buatan membantu proses belajar siswa dan meringankan tugas guru.', true),
      ('C', 'Siswa yang malu bertanya sebaiknya tidak mengikuti pelajaran.', false),
      ('D', 'Latihan soal hanya diberikan oleh guru.', false),
      ('E', 'Waktu tatap muka di kelas sebaiknya dikurangi.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-002', m.id, w, 'sedang', 'Tujuan penulis menyampaikan paragraf kedua pada bacaan tentang kecerdasan buatan di sekolah adalah ….', 'Paragraf kedua menyebut risiko melemahnya berpikir mandiri lalu menyarankan aturan yang jelas. Tujuannya mengingatkan perlunya aturan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'melarang siswa memakai ponsel di sekolah', false),
      ('B', 'membandingkan beberapa aplikasi belajar', false),
      ('C', 'mengkritik guru yang jarang berdiskusi', false),
      ('D', 'mengingatkan perlunya aturan agar kecerdasan buatan tidak melemahkan kemampuan menalar siswa', true),
      ('E', 'mengajak siswa menyalin jawaban dengan cepat', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-003', m.id, w, 'sulit', 'Simpulan yang paling tepat dari seluruh bacaan tentang kecerdasan buatan di sekolah adalah ….', 'Bacaan memuat manfaat dan risiko, lalu menyimpulkan bahwa kecerdasan buatan menjadi pendamping jika ada aturan dan proses berpikir tetap berjalan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kecerdasan buatan bermanfaat bagi pembelajaran jika penggunaannya diatur dan tetap melibatkan proses berpikir siswa.', true),
      ('B', 'Kecerdasan buatan sebaiknya dilarang sepenuhnya di sekolah.', false),
      ('C', 'Kecerdasan buatan dapat menggantikan peran guru di kelas.', false),
      ('D', 'Siswa yang memakai kecerdasan buatan pasti kehilangan kemampuan menalar.', false),
      ('E', 'Aturan penggunaan kecerdasan buatan tidak diperlukan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-004', m.id, w, 'sedang', 'Pernyataan yang sesuai dengan bacaan tentang kecerdasan buatan di sekolah adalah ….', 'Kalimat (2) menyebutkan aplikasi memberi latihan soal sesuai kemampuan siswa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Aplikasi kecerdasan buatan selalu menggantikan tugas guru.', false),
      ('B', 'Aplikasi tersebut hanya dapat dipakai oleh siswa berprestasi.', false),
      ('C', 'Siswa tidak boleh bertanya kepada guru jika memakai aplikasi.', false),
      ('D', 'Sekolah tidak boleh menetapkan aturan penggunaan aplikasi.', false),
      ('E', 'Aplikasi dapat memberi latihan soal sesuai kemampuan siswa.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PBM-SIM-005') then
    insert into wacana (isi) values ('(1) Perubahan iklim mulai dirasakan oleh petani kopi di dataran tinggi. (2) Tanaman kopi, terutama jenis arabika, membutuhkan suhu yang sejuk dan curah hujan yang teratur. (3) Ketika suhu naik, buah kopi matang lebih cepat dengan cita rasa yang kurang kompleks. (4) Hama dan penyakit karat daun juga lebih mudah berkembang pada suhu yang lebih hangat.
(5) Sebagian petani menyiasatinya dengan menanam kopi di lahan yang lebih tinggi. (6) Namun, pilihan ini terbatas karena lahan di ketinggian tertentu sering berupa hutan lindung. (7) Petani lain menanam pohon penaung agar suhu di kebun tetap sejuk. (8) Cara ini dinilai lebih ramah lingkungan sekaligus membantu menyimpan cadangan air.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-005', m.id, w, 'mudah', 'Paragraf pertama bacaan tentang kopi dan perubahan iklim terutama menjelaskan ….', 'Paragraf pertama membahas pengaruh suhu yang naik terhadap tanaman kopi (matang lebih cepat, rasa menurun, hama berkembang).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'cara membuat kopi arabika yang nikmat', false),
      ('B', 'perbedaan kopi arabika dan jenis kopi lain', false),
      ('C', 'dampak naiknya suhu terhadap tanaman kopi', true),
      ('D', 'harga kopi di pasar internasional', false),
      ('E', 'jumlah petani kopi di dataran tinggi', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-006', m.id, w, 'sedang', 'Alasan menanam kopi di lahan yang lebih tinggi sulit dilakukan secara luas menurut bacaan adalah ….', 'Kalimat (6) menyebut pilihan ini terbatas karena lahan di ketinggian tertentu sering berupa hutan lindung.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Tanaman kopi tidak dapat tumbuh di dataran tinggi.', false),
      ('B', 'Petani tidak memiliki bibit kopi.', false),
      ('C', 'Harga kopi di dataran tinggi lebih murah.', false),
      ('D', 'Sebagian lahan di ketinggian tertentu berupa hutan lindung.', true),
      ('E', 'Hama lebih banyak di dataran tinggi.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-007', m.id, w, 'sedang', 'Cara menghadapi perubahan iklim yang dinilai lebih ramah lingkungan menurut bacaan tentang kopi adalah ….', 'Kalimat (7) dan (8): pohon penaung menjaga suhu sejuk dan dinilai lebih ramah lingkungan serta membantu menyimpan cadangan air.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menanam pohon penaung di kebun', true),
      ('B', 'menanam kopi di hutan lindung', false),
      ('C', 'menebang pohon di sekitar kebun', false),
      ('D', 'mengganti kopi dengan tanaman lain', false),
      ('E', 'memanen kopi lebih cepat', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-008', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tentang kopi dan perubahan iklim tersebut adalah ….', 'Bacaan menyebut dua cara petani menyiasati iklim, lalu menilai pohon penaung ramah lingkungan dan menyimpan air (berkelanjutan).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Petani kopi sebaiknya berhenti menanam arabika.', false),
      ('B', 'Kopi arabika tidak terpengaruh oleh perubahan suhu.', false),
      ('C', 'Karat daun hanya muncul di dataran rendah.', false),
      ('D', 'Hutan lindung boleh dibuka untuk kebun kopi.', false),
      ('E', 'Petani kopi menyesuaikan diri dengan perubahan iklim, dan penaung dianggap cara yang paling berkelanjutan.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PBM-SIM-009') then
    insert into wacana (isi) values ('(1) Banyak orang memasang target berjalan 10.000 langkah setiap hari demi kesehatan. (2) Angka tersebut sebenarnya bermula dari kampanye pemasaran alat penghitung langkah di Jepang pada tahun 1960-an, bukan dari penelitian medis. (3) Penelitian yang lebih baru menunjukkan bahwa manfaat kesehatan sudah terasa pada jumlah langkah yang lebih sedikit, misalnya sekitar 7.000 langkah per hari. (4) Artinya, angka 10.000 bukanlah batas ajaib yang harus dicapai.
(5) Meski begitu, target langkah tetap berguna sebagai pemacu untuk lebih aktif bergerak. (6) Orang yang selama ini jarang bergerak dapat memulai dari target kecil, lalu menaikkannya secara bertahap. (7) Yang terpenting adalah konsistensi, bukan sekadar mengejar angka. (8) Dengan demikian, setiap tambahan langkah tetap memberi manfaat bagi tubuh.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-009', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan tentang 10.000 langkah adalah ….', 'Paragraf pertama menjelaskan asal angka 10.000 dari kampanye pemasaran dan bahwa manfaat sudah terasa pada sekitar 7.000 langkah.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Berjalan kaki lebih baik daripada berlari.', false),
      ('B', 'Angka 10.000 langkah per hari bukan batas yang harus dicapai karena manfaat sudah terasa pada langkah yang lebih sedikit.', true),
      ('C', 'Alat penghitung langkah merupakan penemuan medis.', false),
      ('D', 'Orang Jepang paling banyak berjalan kaki.', false),
      ('E', 'Semua orang wajib berjalan 7.000 langkah.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-010', m.id, w, 'sedang', 'Sikap penulis terhadap target langkah harian pada bacaan tersebut adalah ….', 'Penulis menolak anggapan 10.000 langkah sebagai batas ajaib, tetapi tetap menilai target berguna sebagai pemacu dan menekankan konsistensi.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menolak target langkah sepenuhnya', false),
      ('B', 'menganggap target 10.000 langkah mutlak diperlukan', false),
      ('C', 'menilai target langkah berguna asalkan tidak dijadikan patokan yang kaku', true),
      ('D', 'menganggap berjalan kaki tidak bermanfaat', false),
      ('E', 'menyarankan agar orang berhenti menghitung langkah', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-011', m.id, w, 'sedang', 'Simpulan paragraf kedua bacaan tentang 10.000 langkah adalah ….', 'Paragraf kedua menyebut target berguna sebagai pemacu, dimulai dari kecil dan bertahap, serta konsistensi lebih penting daripada angka.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Orang yang jarang bergerak sebaiknya tidak memulai target langkah.', false),
      ('B', 'Target langkah harus dinaikkan secara drastis dalam sehari.', false),
      ('C', 'Hanya orang yang mencapai 10.000 langkah memperoleh manfaat.', false),
      ('D', 'Konsistensi tidak penting dibandingkan angka.', false),
      ('E', 'Target langkah bermanfaat sebagai pemacu bila dimulai kecil dan dilakukan konsisten.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-012', m.id, w, 'sulit', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang 10.000 langkah adalah ….', 'Kalimat (2) menyatakan angka 10.000 bukan berasal dari penelitian medis, melainkan kampanye pemasaran.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Angka 10.000 langkah muncul dari kampanye pemasaran alat penghitung langkah.', false),
      ('B', 'Manfaat kesehatan dapat terasa pada sekitar 7.000 langkah per hari.', false),
      ('C', 'Angka 10.000 langkah berasal dari hasil penelitian medis.', true),
      ('D', 'Orang yang jarang bergerak dapat memulai dari target kecil.', false),
      ('E', 'Setiap tambahan langkah tetap bermanfaat bagi tubuh.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PBM-SIM-013') then
    insert into wacana (isi) values ('(1) Bahasa daerah di Indonesia kian terancam punah karena semakin sedikit anak yang menggunakannya di rumah. (2) Orang tua di kota banyak yang memilih berbahasa Indonesia atau bahasa asing dengan anak agar dianggap lebih menunjang pendidikan. (3) Akibatnya, anak-anak memahami bahasa daerah secara pasif atau bahkan tidak sama sekali. (4) Padahal, bahasa daerah menyimpan kosakata dan cara pandang yang tidak selalu dapat diterjemahkan.
(5) Upaya pelestarian sebenarnya sudah dilakukan, antara lain dengan menjadikan bahasa daerah sebagai muatan lokal di sekolah. (6) Namun, pelajaran di kelas saja tidak cukup apabila bahasa tersebut tidak dipakai dalam percakapan sehari-hari. (7) Karena itu, keluarga dan komunitas perlu menjadi ruang utama pewarisan bahasa. (8) Sekolah hanya berperan memperkuat apa yang telah ditanamkan di rumah.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-013', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan tentang bahasa daerah adalah ….', 'Kalimat (1) memuat gagasan utama, dan kalimat berikutnya menjelaskan penyebab serta akibatnya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Orang tua di kota tidak peduli pada pendidikan anak.', false),
      ('B', 'Bahasa daerah terancam punah karena semakin jarang dipakai anak di rumah.', true),
      ('C', 'Bahasa daerah lebih mudah dipelajari daripada bahasa asing.', false),
      ('D', 'Bahasa Indonesia mengancam keberadaan bahasa asing.', false),
      ('E', 'Anak-anak menolak mempelajari bahasa apa pun.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-014', m.id, w, 'sedang', 'Penyebab utama terancamnya bahasa daerah menurut bacaan tersebut adalah ….', 'Kalimat (2) menyebut orang tua di kota memilih bahasa Indonesia atau asing agar dianggap menunjang pendidikan, sehingga anak hanya memahami bahasa daerah secara pasif.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Orang tua memilih berbahasa lain dengan anak karena menganggapnya lebih menunjang pendidikan.', true),
      ('B', 'Bahasa daerah tidak memiliki kosakata yang lengkap.', false),
      ('C', 'Sekolah melarang penggunaan bahasa daerah.', false),
      ('D', 'Anak-anak tidak menyukai budaya daerah.', false),
      ('E', 'Bahasa daerah sulit diterjemahkan ke bahasa lain.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-015', m.id, w, 'sedang', 'Gagasan utama paragraf kedua bacaan tentang bahasa daerah adalah ….', 'Paragraf kedua menjelaskan upaya sekolah, keterbatasannya, lalu menekankan peran keluarga dan komunitas.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Muatan lokal harus dihapus dari kurikulum sekolah.', false),
      ('B', 'Sekolah merupakan satu-satunya pihak yang berperan melestarikan bahasa.', false),
      ('C', 'Bahasa daerah sebaiknya diganti dengan bahasa asing.', false),
      ('D', 'Pelestarian tidak cukup dilakukan di sekolah, keluarga dan komunitas menjadi ruang utama pewarisan bahasa.', true),
      ('E', 'Pelajaran bahasa daerah tidak berpengaruh pada penguasaan bahasa.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-015'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-016', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tentang bahasa daerah tersebut adalah ….', 'Bacaan menegaskan pelajaran sekolah tidak cukup tanpa pemakaian sehari-hari, dengan keluarga dan komunitas sebagai ruang utama.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Bahasa daerah akan punah karena tidak diajarkan di sekolah.', false),
      ('B', 'Sekolah tidak perlu lagi mengajarkan bahasa daerah.', false),
      ('C', 'Bahasa daerah dapat lestari bila dipakai dalam percakapan sehari-hari, terutama di keluarga dan komunitas.', true),
      ('D', 'Bahasa asing perlu dijadikan bahasa utama di rumah.', false),
      ('E', 'Orang tua di kota tidak boleh berbahasa Indonesia.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-016'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PBM-SIM-017') then
    insert into wacana (isi) values ('(1) Luas lahan sawah di sejumlah daerah penyangga kota terus menyusut. (2) Sawah subur diubah menjadi perumahan, pabrik, dan jalan karena harga lahan terus naik. (3) Petani yang menjual lahannya sering kali tidak lagi memiliki mata pencaharian tetap. (4) Sementara itu, kebutuhan pangan penduduk justru bertambah setiap tahun.
(5) Pemerintah sebenarnya telah menetapkan kawasan sawah yang dilindungi dari alih fungsi. (6) Akan tetapi, penegakan aturan di lapangan belum konsisten. (7) Pemberian insentif kepada petani yang mempertahankan lahan dapat menjadi pelengkap kebijakan larangan. (8) Dengan kombinasi aturan dan insentif, sawah produktif lebih mungkin bertahan.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-017', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan tentang lahan sawah adalah ….', 'Paragraf pertama menjelaskan menyusutnya sawah, dampaknya bagi petani, dan kebutuhan pangan yang meningkat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Harga lahan di kota menurun setiap tahun.', false),
      ('B', 'Petani lebih suka bekerja di pabrik.', false),
      ('C', 'Perumahan menyediakan lapangan kerja bagi petani.', false),
      ('D', 'Kebutuhan pangan penduduk terus menurun.', false),
      ('E', 'Alih fungsi sawah di daerah penyangga kota merugikan petani, sementara kebutuhan pangan terus bertambah.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-018', m.id, w, 'sedang', 'Alasan perlunya insentif bagi petani menurut bacaan tentang lahan sawah adalah ….', 'Kalimat (6) menyebut penegakan aturan belum konsisten, sehingga kalimat (7) menyarankan insentif sebagai pelengkap larangan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Petani tidak ingin menanam padi lagi.', false),
      ('B', 'Pemerintah ingin membeli semua lahan sawah.', false),
      ('C', 'Insentif lebih murah daripada membangun perumahan.', false),
      ('D', 'Larangan saja belum cukup karena penegakan aturan belum konsisten.', true),
      ('E', 'Sawah subur tidak lagi dibutuhkan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-019', m.id, w, 'sedang', 'Saran penulis untuk mempertahankan sawah produktif pada bacaan tersebut adalah ….', 'Kalimat (8) menyatakan kombinasi aturan dan insentif membuat sawah produktif lebih mungkin bertahan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'melarang petani menjual hasil panen', false),
      ('B', 'menggabungkan aturan perlindungan lahan dengan insentif bagi petani', true),
      ('C', 'membangun lebih banyak pabrik di dekat sawah', false),
      ('D', 'menaikkan harga lahan pertanian', false),
      ('E', 'memindahkan petani ke kota', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PBM-SIM-020', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tentang lahan sawah tersebut adalah ….', 'Bacaan menyebut aturan sudah ada tetapi penegakannya belum konsisten, dan insentif menjadi pelengkap. Simpulan A merangkumnya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Mempertahankan sawah produktif memerlukan penegakan aturan yang konsisten disertai insentif bagi petani.', true),
      ('B', 'Aturan perlindungan sawah sudah berhasil mencegah alih fungsi lahan.', false),
      ('C', 'Petani yang menjual lahan selalu memperoleh pekerjaan yang lebih baik.', false),
      ('D', 'Pangan dapat dipenuhi tanpa lahan sawah.', false),
      ('E', 'Insentif menggantikan kebutuhan akan aturan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PBM-SIM-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-SIM-021', m.id, 'mudah', 'Perhatikan paragraf berikut.
Daun pandan sering dipakai sebagai pewangi alami dalam masakan. Tumbuhan ini juga dimanfaatkan sebagai pewarna hijau makanan dan bahan anyaman. Di beberapa daerah, akarnya direbus sebagai ramuan tradisional.
Ide pokok paragraf tersebut adalah ….', 'Setiap kalimat menyebut kegunaan pandan (pewangi, pewarna, anyaman, ramuan), sehingga ide pokoknya beragam kegunaan pandan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Tanaman pandan memiliki beragam kegunaan.', true),
  ('B', 'Pandan hanya digunakan untuk masakan.', false),
  ('C', 'Ramuan tradisional lebih baik daripada obat modern.', false),
  ('D', 'Pandan tumbuh di semua daerah di Indonesia.', false),
  ('E', 'Pewarna hijau buatan berbahaya bagi kesehatan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-SIM-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-SIM-022', m.id, 'sedang', 'Perhatikan paragraf berikut.
Sebuah survei di 50 sekolah menunjukkan bahwa sekolah yang memiliki taman baca mengalami kenaikan jumlah buku yang dipinjam siswa. Namun, kenaikan itu tidak tampak pada sekolah yang taman bacanya jarang dibuka.
Simpulan yang paling tepat berdasarkan paragraf tersebut adalah ….', 'Kenaikan peminjaman tampak pada sekolah dengan taman baca yang aktif, tetapi tidak pada yang jarang dibuka. Simpulan yang aman adalah adanya keterkaitan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua sekolah wajib memiliki taman baca.', false),
  ('B', 'Taman baca yang aktif dibuka berkaitan dengan meningkatnya peminjaman buku.', true),
  ('C', 'Siswa tidak menyukai buku di taman baca.', false),
  ('D', 'Taman baca menyebabkan siswa pandai.', false),
  ('E', 'Sekolah tanpa taman baca tidak memiliki perpustakaan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-SIM-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-SIM-023', m.id, 'sedang', 'Perhatikan paragraf berikut.
Pembaca yang baik tidak hanya menerima informasi, tetapi juga bertanya, "Siapa yang menulis ini? Apa buktinya?" Kebiasaan memeriksa sumber membuat kita tidak mudah termakan kabar bohong. Karena itu, sebelum membagikan sebuah pesan, periksalah dulu kebenarannya.
Tujuan penulis paragraf tersebut adalah ….', 'Kalimat terakhir berisi ajakan untuk memeriksa kebenaran pesan sebelum dibagikan, sehingga tujuan penulis adalah mengajak pembaca.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'menjelaskan cara membuat kabar bohong', false),
  ('B', 'menceritakan pengalaman membaca di perpustakaan', false),
  ('C', 'mengajak pembaca memeriksa kebenaran informasi sebelum membagikannya', true),
  ('D', 'mengkritik penulis yang menyebarkan kabar bohong', false),
  ('E', 'memuji orang yang rajin membaca', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-SIM-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-SIM-024', m.id, 'mudah', 'Perhatikan paragraf berikut.
Menanam sayuran di pekarangan sempit pun dimungkinkan dengan sistem vertikultur. Tanaman ditata bertingkat pada rak atau paralon sehingga hemat tempat. Hasil panennya dapat memenuhi kebutuhan dapur sehari-hari.
Ide pokok paragraf tersebut adalah ….', 'Kalimat pertama menyatakan gagasan utama (menanam di pekarangan sempit dengan vertikultur), kalimat berikutnya menjelaskan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rak dan paralon mahal harganya.', false),
  ('B', 'Hasil panen harus dijual ke pasar.', false),
  ('C', 'Sayuran hanya dapat ditanam di lahan luas.', false),
  ('D', 'Vertikultur memungkinkan orang menanam sayuran di lahan sempit.', true),
  ('E', 'Pekarangan sempit tidak berguna.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-SIM-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-SIM-025', m.id, 'sulit', 'Perhatikan paragraf berikut.
Jumlah pengguna sepeda listrik di Kota Meranti naik dua kali lipat dalam setahun. Pemerintah kota menyediakan jalur sepeda di tiga ruas jalan utama. Toko sepeda mencatat penjualan sepeda listrik meningkat.
Pernyataan yang TIDAK dapat disimpulkan dari paragraf tersebut adalah ….', 'Paragraf tidak menyebut kemacetan. Pernyataan E tidak dapat disimpulkan. Pernyataan lainnya terdukung oleh informasi dalam paragraf.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Simpulan dan Ide Pokok'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Penggunaan sepeda listrik di Kota Meranti meningkat.', false),
  ('B', 'Pemerintah kota memfasilitasi pesepeda dengan jalur khusus.', false),
  ('C', 'Penjualan sepeda listrik di toko mengalami kenaikan.', false),
  ('D', 'Peningkatan pengguna sepeda listrik sejalan dengan meningkatnya penjualan.', false),
  ('E', 'Kemacetan di Kota Meranti berkurang drastis akibat sepeda listrik.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-SIM-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-001', m.id, 'mudah', 'Kalimat yang efektif tentang kegiatan siswa di kelas adalah ….', 'Kata para sudah menyatakan jamak sehingga tidak diulang (A). Naik ke atas (B), agar supaya (C), dan saling … satu sama lain (D) adalah pemborosan kata.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Para siswa-siswa sedang mengerjakan ujian di kelas.', false),
  ('B', 'Ia naik ke atas panggung untuk menerima piala.', false),
  ('C', 'Hadirin dimohon agar supaya tenang.', false),
  ('D', 'Mereka saling tolong-menolong satu sama lain.', false),
  ('E', 'Para siswa sedang mengerjakan ujian di kelas.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-002', m.id, 'mudah', 'Kalimat yang efektif tentang pembangunan jembatan adalah ….', 'Kalimat A memiliki subjek, predikat, dan objek yang jelas. B memakai "di mana" yang tidak tepat, C salah struktur, D tidak bersubjek, E salah tanda baca dan kata depan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pemerintah daerah akan membangun jembatan baru pada tahun depan.', true),
  ('B', 'Pemerintah daerah akan membangun jembatan baru di mana akan selesai tahun depan.', false),
  ('C', 'Jembatan baru akan membangun pemerintah daerah tahun depan.', false),
  ('D', 'Bagi pemerintah daerah akan membangun jembatan baru tahun depan.', false),
  ('E', 'Pemerintah daerah akan, membangun jembatan baru dengan tahun depan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-003', m.id, 'sedang', 'Kalimat yang memiliki subjek jelas di antara kalimat tentang peserta lomba berikut adalah ….', 'Subjek tidak boleh didahului kata depan. Hanya C yang bersubjek (para peserta lomba). A, B, D, dan E kehilangan subjek karena didahului kata depan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Bagi para peserta lomba diwajibkan membawa kartu tanda pengenal.', false),
  ('B', 'Dalam pertemuan itu membahas kenaikan harga bahan pokok.', false),
  ('C', 'Para peserta lomba diwajibkan membawa kartu tanda pengenal.', true),
  ('D', 'Untuk peserta lomba wajib membawa kartu tanda pengenal.', false),
  ('E', 'Di dalam ruang rapat membicarakan tentang anggaran.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-004', m.id, 'sedang', 'Kalimat yang memenuhi kaidah kesejajaran (paralelisme) adalah ….', 'Unsur yang dirinci harus sejenis. Pada D ketiganya berupa kata kerja (memimpin, mencatat, menjaga). Pilihan lain mencampur kata kerja dan kata benda.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kegiatan ekstrakurikuler bertujuan melatih disiplin, menumbuhkan kerja sama, dan kreativitas ditingkatkan.', false),
  ('B', 'Hobinya adalah membaca, penulisan cerita, dan berenang.', false),
  ('C', 'Tugas ketua kelas adalah memimpin rapat, pencatatan kehadiran, dan menjaga kebersihan.', false),
  ('D', 'Tugas ketua kelas adalah memimpin rapat, mencatat kehadiran, dan menjaga kebersihan.', true),
  ('E', 'Tugas ketua kelas adalah pemimpin rapat, mencatat kehadiran, serta kebersihan dijaga.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-005', m.id, 'mudah', 'Kalimat yang tidak mengandung pemborosan kata tentang pembelian buku tulis adalah ….', 'Kalimat B ringkas dan jelas. Kalimat lain mengulang makna jumlah ("sebanyak ... buah", "banyaknya", "jumlahnya").'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Adik membeli sebuah buku tulis sebanyak tiga buah buku.', false),
  ('B', 'Adik membeli tiga buku tulis di toko dekat rumah.', true),
  ('C', 'Adik pergi membeli-beli buku tulis tiga buah banyaknya.', false),
  ('D', 'Adik membeli buku tulis yang jumlahnya ada tiga buah banyaknya.', false),
  ('E', 'Adik telah membeli buku tulis sebanyak tiga buah jumlahnya.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-006', m.id, 'sedang', 'Kalimat majemuk berikut yang penggunaan konjungsinya tepat adalah ….', 'Konjungsi subordinatif (meskipun, walaupun, karena) tidak dipakai bersama konjungsi koordinatif (tetapi, namun, maka) dalam satu kalimat. D salah hubungan makna.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Meskipun hujan deras, tetapi pertandingan tetap dilanjutkan.', false),
  ('B', 'Karena hujan deras, maka pertandingan ditunda.', false),
  ('C', 'Meskipun hujan deras, pertandingan tetap dilanjutkan.', true),
  ('D', 'Hujan deras sehingga pertandingan tetap dilanjutkan.', false),
  ('E', 'Walaupun hujan deras, namun pertandingan tetap dilanjutkan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-007', m.id, 'sedang', 'Kalimat yang efektif dan tidak memakai kata "di mana" secara keliru adalah ….', 'Kata "di mana" bukan penghubung anak kalimat pewatas dalam bahasa Indonesia baku. Penggantinya tempat atau yang. Kalimat E tepat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sekolah di mana saya belajar memiliki banyak prestasi.', false),
  ('B', 'Kota di mana ia lahir terletak di pesisir.', false),
  ('C', 'Ini adalah buku yang di mana saya baca kemarin.', false),
  ('D', 'Rumah yang di mana kami tinggal sudah tua.', false),
  ('E', 'Sekolah tempat saya belajar memiliki banyak prestasi.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-008', m.id, 'sedang', 'Kalimat yang menggunakan kata depan dengan tepat tentang bahan rumah adalah ….', 'Daripada dipakai untuk membandingkan. Untuk menyatakan bahan dipakai kata depan dari.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rumah itu dibangun daripada kayu jati.', false),
  ('B', 'Rumah itu dibangun dari kayu jati.', true),
  ('C', 'Rumah itu dibangun oleh daripada kayu jati.', false),
  ('D', 'Rumah itu dibangun pada kayu jati.', false),
  ('E', 'Rumah itu dibangun akan kayu jati.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-009', m.id, 'mudah', 'Kalimat yang efektif tentang tamu undangan adalah ….', 'Para sudah bermakna jamak, tidak boleh digabung dengan kata ulang, beberapa, atau banyak.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Para tamu undangan dipersilakan menempati kursi yang tersedia.', true),
  ('B', 'Para tamu-tamu undangan dipersilakan menempati kursi yang tersedia.', false),
  ('C', 'Para tamu undangan-undangan dipersilakan menempati kursi-kursi yang tersedia.', false),
  ('D', 'Beberapa para tamu undangan dipersilakan menempati kursi yang tersedia.', false),
  ('E', 'Banyak para tamu undangan dipersilakan menempati kursi yang tersedia.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-010', m.id, 'sedang', 'Kalimat pasif yang benar strukturnya adalah ….', 'Kalimat pasif memakai di- dan pelaku didahului oleh. Pelaku orang ketiga ditulis olehnya atau dia (tanpa oleh, disusun dia). Pilihan lain keliru struktur.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Laporan itu disusun oleh ia semalaman.', false),
  ('B', 'Laporan itu menyusun oleh dia semalaman.', false),
  ('C', 'Laporan itu disusunnya oleh dia semalaman.', false),
  ('D', 'Laporan itu disusun olehnya semalaman.', true),
  ('E', 'Laporan itu dia disusun semalaman.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-011', m.id, 'sedang', 'Kalimat yang efektif tentang pengumuman ujian adalah ….', 'Setelah menyampaikan, anak kalimat diawali bahwa tanpa kata depan tambahan dan tanpa tanda baca yang memisahkannya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kepala sekolah menyampaikan bahwa ujian akan dimulai pekan depan.', true),
  ('B', 'Kepala sekolah menyampaikan tentang bahwa ujian akan dimulai pekan depan.', false),
  ('C', 'Kepala sekolah menyampaikan, bahwa, ujian akan dimulai pekan depan.', false),
  ('D', 'Kepala sekolah menyampaikan kepada bahwa ujian akan dimulai pekan depan.', false),
  ('E', 'Kepala sekolah menyampaikan akan bahwa ujian akan dimulai pekan depan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-012', m.id, 'sulit', 'Kalimat "Pemerintah berupaya meningkatkan lebih tinggi lagi kualitas layanan kesehatan" dapat diperbaiki dengan ….', 'Meningkatkan sudah bermakna menaikkan ke tingkat yang lebih tinggi, sehingga lebih tinggi lagi adalah pemborosan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mengganti berupaya dengan berusaha', false),
  ('B', 'menghilangkan kata pemerintah', false),
  ('C', 'menghilangkan kata kualitas', false),
  ('D', 'menghilangkan frasa lebih tinggi lagi', true),
  ('E', 'menambahkan kata agar sebelum meningkatkan', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-013', m.id, 'sedang', 'Kalimat yang menggunakan konjungsi dan tanda baca secara tepat adalah ….', 'Sebelum konjungsi sehingga tidak diberi koma dan sesudahnya langsung diikuti predikat tanpa tanda baca.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia belajar giat, sehingga, lulus ujian dengan nilai terbaik.', false),
  ('B', 'Ia belajar giat sehingga, lulus ujian dengan nilai terbaik.', false),
  ('C', 'Ia belajar giat, sehingga ia lulus ujian dengan nilai terbaik, tetapi juga.', false),
  ('D', 'Ia belajar giat, jadi sehingga lulus ujian dengan nilai terbaik.', false),
  ('E', 'Ia belajar giat sehingga lulus ujian dengan nilai terbaik.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-014', m.id, 'sedang', 'Kalimat yang mengandung pleonasme (pemborosan makna) adalah ….', 'Maju sudah bermakna bergerak ke depan, sehingga maju ke depan adalah pleonasme.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Siswa itu menerima piala dari kepala sekolah.', false),
  ('B', 'Banjir merendam sebagian besar desa itu.', false),
  ('C', 'Ia maju ke depan untuk membacakan puisi.', true),
  ('D', 'Pelatih menetapkan jadwal latihan baru.', false),
  ('E', 'Panitia membagikan konsumsi kepada peserta.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-015', m.id, 'sedang', 'Perbaikan yang tepat untuk kalimat "Dengan membaca buku dapat menambah wawasan" adalah ….', 'Kalimat asli tidak bersubjek karena subjek didahului kata depan dengan. Perbaikannya menghilangkan kata depan: Membaca buku dapat menambah wawasan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dengan membaca buku, dapat menambah wawasan.', false),
  ('B', 'Membaca buku dapat menambah wawasan.', true),
  ('C', 'Dengan membaca buku maka dapat menambah wawasan.', false),
  ('D', 'Bagi membaca buku dapat menambah wawasan.', false),
  ('E', 'Dengan membaca buku yang dapat menambah wawasan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-016', m.id, 'sulit', 'Dua kalimat berikut akan digabung.
(1) Penduduk desa itu bergotong royong membersihkan sungai.
(2) Sungai itu tercemar sampah plastik.
Penggabungan yang paling efektif adalah ….', 'Keterangan tentang sungai digabung dengan kata penghubung yang, tanpa mengulang kata sungai dan tanpa "di mana".'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Penduduk desa itu bergotong royong membersihkan sungai dan sungai itu tercemar sampah plastik.', false),
  ('B', 'Penduduk desa itu bergotong royong membersihkan sungai, di mana sungai itu tercemar sampah plastik.', false),
  ('C', 'Penduduk desa itu bergotong royong membersihkan sungai yang di mana tercemar sampah plastik.', false),
  ('D', 'Penduduk desa itu bergotong royong membersihkan sungai yang tercemar sampah plastik.', true),
  ('E', 'Sungai itu tercemar sampah plastik penduduk desa itu bergotong royong membersihkannya.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-017', m.id, 'sedang', 'Kalimat yang efektif dengan menggunakan hubungan sebab adalah ….', 'Kata karena tidak dipasangkan dengan maka atau sehingga dalam satu kalimat. Pilihan B ringkas dan logis.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Karena sakit maka Rudi tidak masuk sekolah.', false),
  ('B', 'Karena sakit, Rudi tidak masuk sekolah.', true),
  ('C', 'Rudi tidak masuk sekolah, karena sakit karena.', false),
  ('D', 'Oleh karena sakit, sehingga Rudi tidak masuk sekolah.', false),
  ('E', 'Rudi sakit karena itu tidak masuk karena sekolah.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-018', m.id, 'sedang', 'Kalimat pasif yang efektif tentang peresmian gedung adalah ….', 'Kalimat pasif: subjek (gedung), predikat (diresmikan), pelaku (oleh wali kota), keterangan waktu (kemarin). Pilihan lain salah struktur atau tanda baca.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Gedung baru perpustakaan itu diresmikan oleh wali kota kemarin.', true),
  ('B', 'Gedung baru perpustakaan itu meresmikan wali kota kemarin.', false),
  ('C', 'Gedung baru perpustakaan itu diresmikan wali kota oleh kemarin.', false),
  ('D', 'Oleh gedung baru perpustakaan itu diresmikan wali kota kemarin.', false),
  ('E', 'Gedung baru perpustakaan, diresmikan, oleh wali kota kemarin.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-019', m.id, 'sulit', 'Kalimat yang menggunakan konjungsi korelatif secara tepat adalah ….', 'Pasangan korelatif yang tepat adalah tidak hanya ... tetapi juga ..., dengan unsur yang sejajar (pandai ... pandai ...).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia tidak hanya pandai matematika, tetapi dan bahasa Inggris.', false),
  ('B', 'Ia tidak hanya pandai matematika, juga bahasa Inggris tetapi.', false),
  ('C', 'Ia bukan hanya pandai matematika, melainkan bahasa Inggris juga tetapi.', false),
  ('D', 'Ia tidak hanya pandai matematika tetapi bahasa Inggris pandai.', false),
  ('E', 'Ia tidak hanya pandai matematika, tetapi juga pandai bahasa Inggris.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-020', m.id, 'sulit', 'Kalimat yang berpotensi bermakna ganda (ambigu) adalah ….', 'Pada C, frasa yang baru pindah dapat menerangkan Pak Camat atau istri dan anaknya, sehingga maknanya ganda.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rina membaca buku di perpustakaan.', false),
  ('B', 'Para siswa mengerjakan soal ujian.', false),
  ('C', 'Istri dan anak Pak Camat yang baru pindah itu menghadiri acara.', true),
  ('D', 'Ayah membeli sepeda baru.', false),
  ('E', 'Pelari itu memenangkan lomba.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-021', m.id, 'mudah', 'Kalimat yang menggunakan kata baku dengan tepat adalah ….', 'Kata dasar ubah diberi awalan me- menjadi mengubah. Bentuk merubah tidak baku.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia merubah resep itu supaya lebih enak.', false),
  ('B', 'Ia mengubah resep itu supaya lebih enak.', true),
  ('C', 'Ia merobah resep itu supaya lebih enak.', false),
  ('D', 'Ia mengobah resep itu supaya lebih enak.', false),
  ('E', 'Ia merubahkan resep itu supaya lebih enak.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-022', m.id, 'sedang', 'Kalimat yang tidak boros kata tentang pengolahan data penjualan adalah ….', 'Cukup satu kata penghubung tujuan (untuk). Pilihan lain memakai dua kata bermakna sama (dalam rangka untuk, guna untuk, agar supaya).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Data penjualan itu diolah dalam rangka untuk menentukan strategi pemasaran.', false),
  ('B', 'Data penjualan diolah guna untuk menentukan strategi pemasaran.', false),
  ('C', 'Data penjualan diolah untuk menentukan strategi pemasaran.', true),
  ('D', 'Data penjualan diolah sebagai tujuan agar supaya menentukan strategi pemasaran.', false),
  ('E', 'Data penjualan diolah, dalam hal untuk menentukan strategi pemasaran.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-023', m.id, 'sedang', 'Kata yang tepat untuk melengkapi kalimat "Kebijakan baru itu ... kontroversi di masyarakat" adalah ….', 'Kontroversi bukan sesuatu yang diadakan atau diselenggarakan. Kata kerja yang tepat adalah menimbulkan (menyebabkan terjadi).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mengadakan', false),
  ('B', 'membuat-buat', false),
  ('C', 'menyelenggarakan', false),
  ('D', 'menimbulkan', true),
  ('E', 'mengerjakan', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-024', m.id, 'mudah', 'Kalimat yang efektif tentang gunung adalah ….', 'Tertinggi sudah bermakna paling tinggi, sehingga tidak boleh ditambah paling, sangat, sekali, atau amat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Gunung itu merupakan gunung tertinggi di pulau ini.', true),
  ('B', 'Gunung itu merupakan gunung yang paling tertinggi di pulau ini.', false),
  ('C', 'Gunung itu paling tinggi sekali di pulau ini.', false),
  ('D', 'Gunung itu adalah gunung yang amat paling tinggi di pulau ini.', false),
  ('E', 'Gunung itu sangat paling tertinggi di pulau ini.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EFE-025', m.id, 'sulit', 'Dua kalimat berikut akan digabung.
(1) Nelayan tidak melaut selama sepekan.
(2) Cuaca buruk melanda perairan tersebut.
Penggabungan yang paling logis dan efektif adalah ….', 'Cuaca buruk adalah sebab dan nelayan tidak melaut adalah akibat. Penggabungan E memakai karena dengan hubungan sebab yang tepat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kalimat Efektif'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Nelayan tidak melaut selama sepekan, sehingga cuaca buruk melanda perairan tersebut.', false),
  ('B', 'Cuaca buruk melanda perairan tersebut, di mana nelayan tidak melaut selama sepekan.', false),
  ('C', 'Cuaca buruk melanda perairan tersebut karena nelayan tidak melaut selama sepekan.', false),
  ('D', 'Nelayan tidak melaut selama sepekan walaupun cuaca buruk melanda perairan tersebut.', false),
  ('E', 'Nelayan tidak melaut selama sepekan karena cuaca buruk melanda perairan tersebut.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EFE-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-001', m.id, 'mudah', 'Penulisan huruf kapital yang tepat terdapat pada kalimat ….', 'Nama kota dan provinsi diawali huruf kapital. Pada pilihan lain: kereta api, dosen, danau Toba harus Danau Toba, bulan Juli harus Juli, dan kata-kata umum tidak diawali kapital.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ayah pergi ke Pasar Baru naik Kereta Api.', false),
  ('B', 'Dia adalah Dosen di Universitas Gadjah Mada.', false),
  ('C', 'Kami berlibur ke danau toba pada bulan juli.', false),
  ('D', 'Adik berasal dari Bandung, Jawa Barat.', true),
  ('E', 'Kakak Membeli Buku Matematika di toko Buku.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-002', m.id, 'mudah', 'Penulisan kata depan yang benar terdapat pada kalimat ….', 'Kata depan di ditulis terpisah dari kata yang mengikutinya (di atas, di sini, di luar, di sebelah). Hanya B yang benar.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ibu pergi kepasar membeli sayur.', false),
  ('B', 'Ia menaruh tasnya di atas kursi.', true),
  ('C', 'Dia tinggal disini sejak lama.', false),
  ('D', 'Mereka bermain diluar rumah.', false),
  ('E', 'Anak itu berasal dari kota disebelah.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-003', m.id, 'sedang', 'Penggunaan tanda koma yang tepat terdapat pada kalimat ….', 'Anak kalimat yang mendahului induk kalimat diikuti koma. Pada A koma harus di antara apel dan jeruk, pada C koma tidak dipakai sebelum anak kalimat di belakang, pada B koma diperlukan setelah lelah, dan pada D pewatas yang bersifat menerangkan diapit koma.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ibu membeli apel jeruk, dan mangga.', false),
  ('B', 'Meskipun lelah ia tetap berlatih.', false),
  ('C', 'Saya akan datang, jika tidak hujan.', false),
  ('D', 'Adik, yang sedang sakit tidak masuk sekolah.', false),
  ('E', 'Jika tidak hujan, saya akan datang.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-004', m.id, 'sedang', 'Penggunaan tanda titik dua yang tepat terdapat pada kalimat ….', 'Tanda titik dua dipakai setelah pernyataan lengkap yang diikuti rincian. Titik dua tidak dipakai di tengah rincian yang merupakan pelengkap (B).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kami membutuhkan tiga hal berikut: palu, paku, dan gergaji.', true),
  ('B', 'Kami membutuhkan: palu, paku, dan gergaji.', false),
  ('C', 'Kami membutuhkan tiga hal berikut, : palu, paku, dan gergaji.', false),
  ('D', 'Kami membutuhkan tiga hal berikut; palu, paku, dan gergaji.', false),
  ('E', 'Kami membutuhkan tiga hal: berikut palu, paku, dan gergaji.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-005', m.id, 'mudah', 'Penulisan bilangan yang tepat dalam teks terdapat pada kalimat ….', 'Bilangan yang dapat dinyatakan dengan satu atau dua kata ditulis dengan huruf dalam teks. Bilangan di awal kalimat ditulis dengan huruf. Singkatan WIB ditulis dengan huruf kapital.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ada 3 orang siswa yang terlambat.', false),
  ('B', '30 siswa mengikuti lomba itu.', false),
  ('C', 'Ada tiga orang siswa yang terlambat.', true),
  ('D', 'Ia membeli 2 buah buku dan 4 buah pensil.', false),
  ('E', 'Rapat dimulai pada pukul 07.00 wib.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-006', m.id, 'sedang', 'Penulisan judul karya dan nama pengarang yang tepat terdapat pada kalimat ….', 'Huruf kapital dipakai pada unsur judul (kecuali kata tugas) dan nama orang, bukan pada kata umum seperti novel dan karya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia membaca novel Laskar Pelangi karya Andrea Hirata.', true),
  ('B', 'Ia membaca Novel laskar pelangi karya andrea hirata.', false),
  ('C', 'Ia membaca novel Laskar pelangi Karya Andrea Hirata.', false),
  ('D', 'Ia membaca novel laskar Pelangi karya Andrea hirata.', false),
  ('E', 'Ia Membaca Novel Laskar Pelangi Karya Andrea Hirata.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-007', m.id, 'sedang', 'Penulisan kutipan langsung yang tepat adalah ….', 'Kutipan langsung didahului koma, diawali huruf kapital, dan tanda baca akhir ditulis di dalam tanda petik.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ibu berkata, "Jangan lupa membawa payung".', false),
  ('B', 'Ibu berkata "jangan lupa membawa payung."', false),
  ('C', 'Ibu berkata, "Jangan lupa membawa payung."', true),
  ('D', 'Ibu berkata: "jangan lupa membawa payung".', false),
  ('E', 'Ibu berkata, "Jangan lupa membawa payung!".', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-008', m.id, 'mudah', 'Konjungsi antarkalimat yang tepat untuk melengkapi "Hujan turun sejak pagi. [....], upacara dipindahkan ke dalam aula." adalah ….', 'Hujan menjadi sebab upacara dipindahkan, sehingga konjungsi yang tepat menyatakan sebab-akibat: oleh karena itu.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Namun', false),
  ('B', 'Oleh karena itu', true),
  ('C', 'Sebaliknya', false),
  ('D', 'Misalnya', false),
  ('E', 'Selain itu', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-009', m.id, 'sedang', 'Konjungsi yang tepat untuk melengkapi "Ia tidak membawa payung [....] pulang kehujanan" adalah ….', 'Pulang kehujanan adalah akibat dari tidak membawa payung, sehingga konjungsi yang tepat adalah sehingga.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'sedangkan', false),
  ('B', 'meskipun', false),
  ('C', 'agar', false),
  ('D', 'tetapi', false),
  ('E', 'sehingga', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-010', m.id, 'sedang', 'Konjungsi yang tepat untuk melengkapi "Kakak suka membaca novel, [....] adik lebih suka membaca komik" adalah ….', 'Kedua klausa menyatakan hal yang berlawanan atau berbeda (novel dan komik), sehingga konjungsinya sedangkan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'karena', false),
  ('B', 'sehingga', false),
  ('C', 'agar', false),
  ('D', 'sedangkan', true),
  ('E', 'supaya', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-011', m.id, 'sedang', 'Penggunaan kata bahwa yang tepat terdapat pada kalimat ….', 'Bahwa menghubungkan induk kalimat dengan anak kalimat pengisi, tanpa koma sebelumnya. Pada D koma tidak diperlukan, pada A, B, dan E posisi bahwa tidak tepat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia bahwa tidak mengetahui rapat itu.', false),
  ('B', 'Bahwa dia sedang sakit.', false),
  ('C', 'Pak Lurah menyatakan bahwa kerja bakti akan dilaksanakan pekan depan.', true),
  ('D', 'Pak Lurah menyatakan, bahwa kerja bakti akan dilaksanakan pekan depan.', false),
  ('E', 'Saya berharap bahwa, semoga ia segera sembuh.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-012', m.id, 'sedang', 'Kalimat yang seluruhnya menggunakan kata baku adalah ….', 'Bentuk baku: atlet, apotek, analisis, dan nasihat. Hanya D yang memakai kata baku.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Atlit itu berlatih setiap sore di lapangan.', false),
  ('B', 'Ia membeli obat di apotik dekat rumah.', false),
  ('C', 'Hasil analisa data itu diumumkan kemarin.', false),
  ('D', 'Atlet itu berlatih di lapangan setiap sore.', true),
  ('E', 'Nasehat guru itu sangat bermanfaat.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-013', m.id, 'sedang', 'Penulisan kata ulang yang tepat terdapat pada kalimat ….', 'Kata ulang ditulis lengkap dengan tanda hubung tanpa spasi (anak-anak). Pilihan B, C, D salah, dan E memuat pengulangan yang tidak tepat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Anak-anak itu bermain bola di lapangan.', true),
  ('B', 'Anak2 itu bermain bola di lapangan.', false),
  ('C', 'Anak anak itu bermain bola di lapangan.', false),
  ('D', 'Anak - anak itu bermain bola di lapangan.', false),
  ('E', 'Anak-anak itu bermain-main bola di lapangan-lapangan.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-014', m.id, 'sedang', 'Penulisan partikel -kah yang tepat terdapat pada kalimat ….', 'Partikel -kah ditulis serangkai dengan kata di depannya tanpa spasi atau tanda hubung, dan tidak diikuti koma di tengah kalimat tanya ini.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Siapa kah yang akan menjadi ketua kelas?', false),
  ('B', 'Siapakah yang akan menjadi ketua kelas?', true),
  ('C', 'Siapa-kah yang akan menjadi ketua kelas?', false),
  ('D', 'Siapa kah, yang akan menjadi ketua kelas?', false),
  ('E', 'Siapakah, yang akan menjadi ketua kelas?', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-015', m.id, 'mudah', 'Penulisan tanggal yang tepat terdapat pada kalimat ….', 'Nama bulan diawali huruf kapital, dan tanggal ditulis tanpa koma di antara bulan dan tahun.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Rapat diadakan pada tanggal 17-8-2025.', false),
  ('B', 'Rapat diadakan pada tgl. 17 Agustus 2025.', false),
  ('C', 'Rapat diadakan pada tanggal 17 agustus 2025.', false),
  ('D', 'Rapat diadakan pada 17 Agustus, 2025.', false),
  ('E', 'Rapat diadakan pada tanggal 17 Agustus 2025.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-016', m.id, 'mudah', 'Penulisan kata gabungan yang tepat terdapat pada kalimat ….', 'Kata kerja sama ditulis terpisah. Bentuk berimbuhan dari kata dasar kerja adalah bekerja (bukan berkerja).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Mereka bekerjasama dalam proyek itu.', false),
  ('B', 'Mereka bekerja sama dalam proyek itu.', true),
  ('C', 'Mereka bekerja-sama dalam proyek itu.', false),
  ('D', 'Mereka bekerja sama-sama dalam proyek itu.', false),
  ('E', 'Mereka berkerja sama dalam proyek itu.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-017', m.id, 'sedang', 'Penggunaan konjungsi yang tepat terdapat pada kalimat ….', 'Hubungan tujuan dinyatakan dengan agar atau supaya, tidak digabung keduanya. Pilihan lain melanggar hubungan makna.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia belajar keras agar supaya lulus ujian.', false),
  ('B', 'Ia belajar keras walaupun lulus ujian.', false),
  ('C', 'Ia belajar keras sehingga agar lulus.', false),
  ('D', 'Ia belajar keras oleh karena lulus ujian.', false),
  ('E', 'Ia belajar keras agar lulus ujian.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-018', m.id, 'sedang', 'Penggunaan kata depan yang tepat terdapat pada kalimat ….', 'Kata depan yang dipakai di depan orang yang menerima sesuatu adalah kepada.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia memberikan hadiah di adiknya.', false),
  ('B', 'Surat itu dikirim ke Pak Lurah.', false),
  ('C', 'Ia memberikan hadiah kepada adiknya.', true),
  ('D', 'Ia memberikan hadiah untuk kepada adiknya.', false),
  ('E', 'Ia memberikan hadiah terhadap adiknya.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-019', m.id, 'sulit', 'Penggunaan tanda hubung yang tepat terdapat pada kalimat ….', 'Tanda hubung dipakai di antara se- dan kata yang berawal huruf kapital (nama diri), seperti se-Jawa Barat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Ia membeli sepatu ber-warna merah.', false),
  ('B', 'Ia mengikuti ujian se Jawa Barat.', false),
  ('C', 'Ia mengikuti ujian se Jawa-Barat.', false),
  ('D', 'Ia mengikuti ujian se-Jawa Barat.', true),
  ('E', 'Ia mengikuti ujian seJawa Barat.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-020', m.id, 'sulit', 'Penulisan singkatan nama badan usaha yang tepat terdapat pada kalimat ….', 'Singkatan nama lembaga atau badan usaha yang terdiri atas huruf awal kapital ditulis tanpa titik: PT.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Ahmad bekerja di PT Maju Jaya, Jakarta.', true),
  ('B', 'Pak Ahmad bekerja di P.T. Maju Jaya, Jakarta.', false),
  ('C', 'Pak Ahmad bekerja di pt. Maju Jaya, Jakarta.', false),
  ('D', 'Pak Ahmad bekerja di PT. Maju Jaya, Jakarta.', false),
  ('E', 'Pak Ahmad bekerja di Pt Maju Jaya, Jakarta.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-021', m.id, 'sedang', 'Penulisan nilai uang yang tepat terdapat pada kalimat ….', 'Lambang Rp ditulis serangkai dengan angka tanpa titik dan tanpa kata rupiah lagi (C pemborosan).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Harga baju itu Rp. 150.000,-.', false),
  ('B', 'Harga baju itu Rp 150.000,-', false),
  ('C', 'Harga baju itu Rp150.000,00 rupiah.', false),
  ('D', 'Harga baju itu 150.000 Rp.', false),
  ('E', 'Harga baju itu Rp150.000,00.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-022', m.id, 'sulit', 'Penggunaan tanda koma pada kalimat majemuk setara yang tepat adalah ….', 'Koma ditempatkan sebelum konjungsi tetapi pada kalimat majemuk setara, bukan sesudahnya atau di tengah klausa.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Hari sudah malam, tetapi mereka masih belajar.', true),
  ('B', 'Hari sudah malam tetapi, mereka masih belajar.', false),
  ('C', 'Hari sudah malam tetapi mereka, masih belajar.', false),
  ('D', 'Hari sudah, malam tetapi mereka masih belajar.', false),
  ('E', 'Hari sudah malam, tetapi, mereka masih belajar.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-023', m.id, 'sulit', 'Penulisan huruf kapital pada nama jabatan yang tepat terdapat pada kalimat ….', 'Nama jabatan yang diikuti nama tempat atau nama orang diawali huruf kapital (Bupati Sleman). Jabatan yang bersifat umum tidak dikapitalkan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kemarin bupati Sleman meresmikan jembatan baru.', false),
  ('B', 'Ayah saya seorang Bupati di Jawa Tengah.', false),
  ('C', 'Seorang Gubernur harus melayani rakyatnya.', false),
  ('D', 'Kemarin Bupati Sleman meresmikan jembatan baru.', true),
  ('E', 'Pak Camat menyapa Warga desa.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-024', m.id, 'mudah', 'Penggunaan tanda baca akhir yang tepat terdapat pada kalimat ….', 'Kalimat tanya diakhiri satu tanda tanya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Mengapa kamu terlambat.', false),
  ('B', 'Mengapa kamu terlambat!?', false),
  ('C', 'Mengapa kamu terlambat?', true),
  ('D', 'Mengapa kamu terlambat?.', false),
  ('E', 'Mengapa kamu terlambat?!!', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-EJA-025', m.id, 'sulit', 'Penggunaan tanda koma pada keterangan tambahan (apositif) yang tepat adalah ….', 'Keterangan tambahan yang tidak membatasi acuan diapit tanda koma di awal dan di akhir.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Ejaan dan Konjungsi'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Rudi, yang rumahnya dekat sekolah selalu datang pagi.', false),
  ('B', 'Pak Rudi, yang rumahnya dekat sekolah, selalu datang pagi.', true),
  ('C', 'Pak Rudi yang rumahnya dekat sekolah, selalu datang pagi.', false),
  ('D', 'Pak Rudi, yang rumahnya dekat, sekolah selalu datang pagi.', false),
  ('E', 'Pak Rudi yang, rumahnya dekat sekolah selalu datang pagi.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-EJA-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-001', m.id, 'mudah', 'Konjungsi antarkalimat yang tepat untuk melengkapi rumpang pada paragraf berikut adalah ….
(1) Hujan turun dengan deras sejak pagi. (2) …., banyak siswa terlambat tiba di sekolah.', 'Kalimat (2) merupakan akibat dari hujan deras pada kalimat (1), sehingga konjungsi yang tepat adalah "akibatnya".'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Meskipun demikian', false),
  ('B', 'Sebaliknya', false),
  ('C', 'Akibatnya', true),
  ('D', 'Selain itu', false),
  ('E', 'Misalnya', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-002', m.id, 'mudah', 'Konjungsi antarkalimat yang tepat untuk mengisi bagian rumpang paragraf berikut adalah ….
(1) Kami berencana berwisata ke pantai pada akhir pekan ini. (2) …., ramalan cuaca menyebutkan akan terjadi badai di perairan tersebut.', 'Rencana berwisata dan ramalan badai bertentangan, sehingga diperlukan konjungsi pertentangan, yaitu "namun".'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Namun', true),
  ('B', 'Oleh karena itu', false),
  ('C', 'Selanjutnya', false),
  ('D', 'Dengan demikian', false),
  ('E', 'Contohnya', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-003', m.id, 'mudah', 'Perhatikan paragraf berikut.
(1) Membaca buku setiap hari melatih konsentrasi. (2) Kosakata yang dimiliki seseorang pun bertambah. (3) Pengetahuan yang luas membuat seseorang lebih percaya diri saat berbicara. (4) Harga buku di toko daring sering lebih murah daripada di toko fisik. (5) Dengan demikian, kebiasaan membaca bermanfaat bagi perkembangan diri.
Kalimat yang tidak padu dengan gagasan paragraf tersebut adalah ….', 'Paragraf membahas manfaat membaca. Kalimat (4) membahas perbandingan harga buku sehingga tidak berkaitan dengan gagasan tersebut.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kalimat (1)', false),
  ('B', 'kalimat (2)', false),
  ('C', 'kalimat (3)', false),
  ('D', 'kalimat (4)', true),
  ('E', 'kalimat (5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-004', m.id, 'mudah', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Setelah matang, nasi diaduk lalu didiamkan sebentar.
(2) Mula-mula, beras dicuci hingga bersih.
(3) Beras tersebut kemudian dimasak dengan air secukupnya.
(4) Nasi pun siap disajikan.', 'Urutan prosesnya: mencuci beras (2), memasaknya (3), mengaduk setelah matang (1), lalu menyajikan (4). Penanda "mula-mula" menunjukkan kalimat (2) berada di awal.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1)–(2)–(3)–(4)', false),
  ('B', '(2)–(3)–(1)–(4)', true),
  ('C', '(2)–(1)–(3)–(4)', false),
  ('D', '(3)–(2)–(1)–(4)', false),
  ('E', '(4)–(2)–(3)–(1)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-005', m.id, 'mudah', 'Kalimat penutup yang paling tepat untuk paragraf berikut adalah ….
(1) Sampah plastik yang dibuang sembarangan dapat menyumbat saluran air. (2) Plastik yang terbawa ke laut membahayakan penyu dan ikan yang memakannya. (3) Plastik juga memerlukan ratusan tahun untuk terurai di dalam tanah. (4) …..', 'Kalimat penutup harus menyimpulkan dampak buruk plastik pada kalimat (1)–(3) dengan ajakan mengurangi pemakaian plastik sekali pakai.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Penyu merupakan hewan yang dilindungi di Indonesia.', false),
  ('B', 'Banyak toko menjual kantong plastik dengan harga murah.', false),
  ('C', 'Namun, plastik tetap diminati karena ringan.', false),
  ('D', 'Saluran air di kota biasanya dibersihkan setiap bulan.', false),
  ('E', 'Oleh karena itu, kita perlu mengurangi pemakaian plastik sekali pakai.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-006', m.id, 'sedang', 'Konjungsi antarkalimat yang tepat untuk melengkapi paragraf berikut adalah ….
(1) Pemerintah daerah telah memperbaiki jalan rusak di pusat kota. (2) …., jalan di kawasan pinggiran kota masih banyak yang berlubang.', 'Kalimat (2) menunjukkan keadaan lain yang berlangsung pada saat yang sama dan berlawanan dengan kalimat (1). Konjungsi "sementara itu" paling sesuai.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Oleh karena itu', false),
  ('B', 'Sementara itu', true),
  ('C', 'Dengan demikian', false),
  ('D', 'Misalnya', false),
  ('E', 'Sesudah itu', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-007', m.id, 'sedang', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Setelah dua hingga tiga minggu, sampah berubah menjadi kompos yang siap dipakai.
(2) Sampah organik dapat diolah menjadi pupuk kompos di rumah.
(3) Pertama, kumpulkan sisa sayur dan daun kering dalam wadah berlubang.
(4) Selama penyimpanan, isi wadah diaduk seminggu sekali agar mendapat udara.
(5) Setelah itu, tutup wadah dan simpan di tempat teduh.', 'Kalimat umum (2) mengawali paragraf, disusul langkah "pertama" (3), lalu "setelah itu" (5), kegiatan selama penyimpanan (4), dan hasil akhir (1).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(2)–(3)–(4)–(5)–(1)', false),
  ('B', '(3)–(2)–(5)–(4)–(1)', false),
  ('C', '(2)–(5)–(3)–(4)–(1)', false),
  ('D', '(2)–(3)–(5)–(4)–(1)', true),
  ('E', '(2)–(3)–(5)–(1)–(4)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-008', m.id, 'sedang', 'Kalimat pembuka yang paling tepat untuk paragraf berikut adalah ….
(1) …. (2) Sinyalnya hanya terjangkau di titik-titik tertentu. (3) Siswa harus berjalan ke bukit untuk mengunduh tugas. (4) Akibatnya, pembelajaran daring sering terhambat.', 'Kata "sinyalnya" pada kalimat (2) mengacu pada internet yang disebut di kalimat pembuka. Kalimat E juga menjadi pokok yang dirinci oleh kalimat berikutnya.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Siswa di kota memiliki gawai yang canggih.', false),
  ('B', 'Pembelajaran daring dimulai sejak masa pandemi.', false),
  ('C', 'Bukit sering menjadi tempat wisata warga.', false),
  ('D', 'Tugas daring sebaiknya diberikan dalam jumlah sedikit.', false),
  ('E', 'Akses internet di desa terpencil masih sangat terbatas.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-009', m.id, 'sedang', 'Kalimat yang paling tepat untuk mengisi bagian rumpang paragraf berikut adalah ….
(1) Pemuda karang taruna di desa itu membuka kelas membaca untuk anak-anak. (2) …. (3) Anak-anak pun mulai gemar membaca setelah beberapa bulan.', 'Kalimat (2) harus menjelaskan pelaksanaan kelas membaca pada kalimat (1) dan mengarah pada hasil di kalimat (3). Hanya pilihan C yang memenuhi hal itu.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Balai desa itu dibangun pada tahun 1980.', false),
  ('B', 'Karang taruna adalah organisasi kepemudaan di tingkat desa.', false),
  ('C', 'Kelas tersebut diadakan setiap sore di balai desa dengan buku sumbangan warga.', true),
  ('D', 'Anak-anak di kota lebih suka bermain gim daripada membaca.', false),
  ('E', 'Harga buku cerita cukup mahal bagi banyak keluarga.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-010', m.id, 'sedang', 'Penghubung antarkalimat yang tepat untuk melengkapi paragraf berikut adalah ….
(1) Persediaan air bersih di kampung itu menipis selama musim kemarau. (2) …., warga membangun sumur resapan secara bergotong royong.', 'Pembangunan sumur resapan merupakan tindakan yang diambil karena air bersih menipis. Hubungan sebab-akibat ini diwakili "oleh karena itu".'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Oleh karena itu', true),
  ('B', 'Sebaliknya', false),
  ('C', 'Misalnya', false),
  ('D', 'Selain itu', false),
  ('E', 'Meskipun demikian', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-011', m.id, 'sedang', 'Kalimat pembuka yang paling tepat untuk paragraf berikut adalah ….
(1) …. (2) Misalnya, ilmu kedokteran memanfaatkan kecerdasan buatan untuk membaca hasil pemindaian. (3) Di bidang pertanian, pesawat nirawak dipakai untuk memantau kesehatan tanaman.', 'Kalimat (2) dan (3) berisi contoh pemanfaatan teknologi di bidang kedokteran dan pertanian. Kalimat pembuka yang tepat adalah gagasan umum yang dicontohkan, yaitu pilihan E.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dokter harus belajar pemrograman komputer.', false),
  ('B', 'Pesawat nirawak dilarang terbang di dekat bandara.', false),
  ('C', 'Pertanian memerlukan lahan yang sangat luas.', false),
  ('D', 'Pemindaian dilakukan setiap tahun di rumah sakit.', false),
  ('E', 'Teknologi modern kini dimanfaatkan di berbagai bidang kehidupan.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-012', m.id, 'sedang', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Candi itu dibangun pada abad ke-8 oleh para penguasa Dinasti Syailendra.
(2) Borobudur merupakan candi Buddha terbesar di dunia yang terletak di Magelang.
(3) Setelah ditemukan kembali pada abad ke-19, candi ini dipugar beberapa kali.
(4) Kini, Borobudur menjadi salah satu tujuan wisata budaya utama di Indonesia.
(5) Beberapa abad kemudian, candi ini terbengkalai karena tertutup abu vulkanik dan semak belukar.', 'Kalimat (2) memperkenalkan Borobudur sehingga "candi itu" pada (1) harus mengikutinya. Urutan berikutnya mengikuti kronologi: dibangun (1), terbengkalai (5), ditemukan dan dipugar (3), lalu keadaan kini (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1)–(2)–(5)–(3)–(4)', false),
  ('B', '(2)–(1)–(5)–(3)–(4)', true),
  ('C', '(2)–(1)–(3)–(5)–(4)', false),
  ('D', '(2)–(5)–(1)–(3)–(4)', false),
  ('E', '(1)–(5)–(2)–(3)–(4)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-013', m.id, 'sedang', 'Kalimat penutup yang paling tepat untuk paragraf berikut adalah ….
(1) Berolahraga secara teratur menjaga kebugaran jantung. (2) Latihan beban membantu menguatkan otot dan tulang. (3) Aktivitas fisik juga dapat mengurangi stres. (4) …..', 'Kalimat penutup menyimpulkan manfaat olahraga bagi jantung, otot, tulang, dan pikiran seperti dirinci pada kalimat (1)–(3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dengan demikian, olahraga teratur bermanfaat bagi kesehatan jasmani dan rohani.', true),
  ('B', 'Jantung manusia berdetak sekitar seratus ribu kali dalam sehari.', false),
  ('C', 'Olahraga yang mahal memerlukan peralatan khusus.', false),
  ('D', 'Namun, stres sebaiknya dihindari dengan cara tidur sepanjang hari.', false),
  ('E', 'Atlet profesional berlatih delapan jam setiap hari.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-014', m.id, 'sedang', 'Pasangan penghubung antarkalimat yang tepat untuk melengkapi paragraf berikut adalah ….
(1) Kemacetan di kota besar semakin parah. (2) …., banyak warga memilih naik kereta komuter. (3) …., tarif kereta relatif murah dan jadwalnya tepat waktu.', 'Kalimat (2) adalah akibat dari kemacetan ("akibatnya"). Kalimat (3) menambahkan alasan lain memilih kereta komuter ("selain itu").'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Namun – Padahal', false),
  ('B', 'Akibatnya – Sebaliknya', false),
  ('C', 'Selain itu – Akibatnya', false),
  ('D', 'Akibatnya – Selain itu', true),
  ('E', 'Oleh karena itu – Namun', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-015', m.id, 'sedang', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Hasilnya menunjukkan bahwa siswa yang sarapan memiliki tingkat konsentrasi lebih tinggi.
(2) Peneliti membandingkan dua kelompok siswa sekolah dasar selama satu semester.
(3) Sebuah penelitian dilakukan untuk mengetahui pengaruh sarapan terhadap konsentrasi belajar.
(4) Satu kelompok diwajibkan sarapan, sedangkan kelompok lain dibiarkan seperti biasa.
(5) Berdasarkan hasil itu, sekolah disarankan menyediakan program sarapan bersama.', 'Urutan: tujuan penelitian (3), metode umum (2), rincian metode (4), hasil (1), lalu saran berdasarkan hasil (5).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(2)–(3)–(4)–(1)–(5)', false),
  ('B', '(3)–(4)–(2)–(1)–(5)', false),
  ('C', '(3)–(2)–(4)–(1)–(5)', true),
  ('D', '(3)–(2)–(1)–(4)–(5)', false),
  ('E', '(3)–(1)–(2)–(4)–(5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-016', m.id, 'sulit', 'Kalimat yang paling tepat untuk mengisi bagian rumpang paragraf berikut adalah ….
(1) Banyak toko swalayan kini tidak lagi menyediakan kantong plastik gratis. (2) …. (3) Akan tetapi, sebagian pelanggan masih lupa membawa kantong sendiri sehingga harus membeli kantong berbayar.', 'Kalimat (3) diawali "akan tetapi" dan membahas pelanggan yang lupa membawa kantong sendiri. Kalimat (2) yang tepat adalah tujuan kebijakan, yaitu mendorong pembeli membawa kantong sendiri. Pilihan E tidak menjembatani kalimat (1) dan (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kebijakan ini bertujuan mendorong pembeli membawa kantong belanja sendiri.', true),
  ('B', 'Plastik merupakan bahan yang mudah terbakar.', false),
  ('C', 'Pelanggan senang karena kantong plastik dibagikan tanpa biaya.', false),
  ('D', 'Toko swalayan buka dari pagi hingga malam hari.', false),
  ('E', 'Kantong kain lebih mahal daripada kantong plastik.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-017', m.id, 'mudah', 'Perhatikan paragraf berikut.
(1) Kucing merupakan hewan peliharaan yang banyak disukai orang. (2) Hewan ini cenderung bersih karena rajin menjilat bulunya. (3) Harimau yang hidup di hutan hujan tropis tergolong hewan terancam punah. (4) Kucing juga mudah dilatih membuang kotoran di tempat khusus. (5) Karena sifat-sifat itu, kucing cocok dipelihara di rumah yang sempit.
Kalimat yang tidak padu dalam paragraf tersebut adalah ….', 'Paragraf membahas kucing sebagai hewan peliharaan. Kalimat (3) membahas harimau sehingga menyimpang dari gagasan paragraf.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kalimat (1)', false),
  ('B', 'kalimat (2)', false),
  ('C', 'kalimat (3)', true),
  ('D', 'kalimat (4)', false),
  ('E', 'kalimat (5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-018', m.id, 'sulit', 'Perhatikan paragraf berikut.
(1) Banjir di kota-kota besar dipicu oleh saluran air yang tersumbat sampah. (2) Sebagian besar warga kota memilih tinggal di apartemen karena dekat dengan tempat kerja. (3) Penyempitan sungai akibat bangunan liar memperparah luapan air saat hujan deras. (4) Hilangnya daerah resapan akibat beton dan aspal membuat air hujan tidak terserap tanah. (5) Pemerintah perlu menertibkan bangunan di bantaran sungai dan memperbanyak sumur resapan.
Kalimat yang tidak mendukung gagasan utama paragraf tersebut adalah ….', 'Gagasan utama paragraf adalah penyebab dan penanggulangan banjir. Kalimat (2) tentang alasan warga tinggal di apartemen tidak berkaitan dengan banjir.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kalimat (1)', false),
  ('B', 'kalimat (2)', true),
  ('C', 'kalimat (3)', false),
  ('D', 'kalimat (4)', false),
  ('E', 'kalimat (5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-019', m.id, 'sedang', 'Kalimat pembuka yang paling tepat untuk paragraf berikut adalah ….
(1) …. (2) Dengan sistem ini, penumpang cukup menempelkan kartu pada mesin pembaca. (3) Antrean di loket pun berkurang dan waktu perjalanan menjadi lebih efisien.', 'Frasa "sistem ini" pada kalimat (2) mengacu pada sistem pembayaran nontunai. Penyebutan sistem itu harus ada pada kalimat pembuka.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Angkutan umum tidak diminati di kota kecil.', false),
  ('B', 'Loket tiket dibangun di setiap stasiun.', false),
  ('C', 'Jumlah penumpang kereta bertambah setiap tahun.', false),
  ('D', 'Mesin pembaca kartu diproduksi di dalam negeri.', false),
  ('E', 'Sejumlah kota besar mulai menerapkan sistem pembayaran nontunai pada angkutan umum.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-020', m.id, 'mudah', 'Kelanjutan yang paling padu untuk kalimat kedua pada paragraf berikut adalah ….
(1) Tim bulu tangkis sekolah kami kalah pada babak pertama kejuaraan antarsekolah. (2) Meskipun demikian, ….', '"Meskipun demikian" menyatakan pertentangan terhadap kekalahan. Sikap tetap bersemangat berlatih merupakan kelanjutan yang logis.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'pelatih memberi hadiah karena mereka menang.', false),
  ('B', 'mereka akan dikirim ke babak final minggu depan.', false),
  ('C', 'lawan mereka tidak pernah berlatih sama sekali.', false),
  ('D', 'para pemain tetap bersemangat berlatih untuk kejuaraan berikutnya.', true),
  ('E', 'pertandingan itu dimenangkan dengan skor telak.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-021', m.id, 'sedang', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Setelah itu, kain direbus untuk melepaskan lilin.
(2) Batik tulis dibuat dengan melukis pola pada kain menggunakan canting dan lilin panas.
(3) Kain yang telah dilukis kemudian dicelup ke dalam larutan pewarna.
(4) Proses ini diulang sesuai dengan jumlah warna yang diinginkan.
(5) Hasilnya adalah selembar kain batik bermotif rumit dan bernilai seni tinggi.', 'Urutan: pembuatan pola (2), pencelupan (3), pengulangan pencelupan (4), perebusan untuk melepas lilin (1), dan hasil akhir (5). Frasa "proses ini" pada (4) mengacu pada pencelupan di (3).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(2)–(1)–(3)–(4)–(5)', false),
  ('B', '(2)–(3)–(1)–(4)–(5)', false),
  ('C', '(3)–(2)–(4)–(1)–(5)', false),
  ('D', '(2)–(3)–(4)–(1)–(5)', true),
  ('E', '(2)–(4)–(3)–(1)–(5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-022', m.id, 'sulit', 'Kalimat yang paling tepat untuk menjembatani kalimat (1) dan (3) pada paragraf berikut adalah ….
(1) Banyak siswa menunda belajar hingga menjelang ujian. (2) …. (3) Akibatnya, materi yang dipelajari tidak sempat dipahami dan cepat terlupakan.', 'Kata "akibatnya" pada kalimat (3) menuntut kalimat (2) yang menjadi sebab langsung, yaitu seluruh materi dipelajari dalam waktu singkat. Pilihan lain berkaitan dengan topik, tetapi tidak menghubungkan sebab dan akibat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Sebagian siswa menunda belajar karena merasa materinya sudah dipahami.', false),
  ('B', 'Guru sering mengingatkan siswa agar mencicil belajar setiap hari.', false),
  ('C', 'Menjelang ujian, perpustakaan sekolah biasanya lebih ramai dikunjungi.', false),
  ('D', 'Menunda pekerjaan juga sering dilakukan oleh orang dewasa.', false),
  ('E', 'Kebiasaan ini membuat seluruh materi harus dipelajari dalam waktu yang sangat singkat.', true)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-023', m.id, 'sulit', 'Perhatikan paragraf berikut.
(1) Koperasi sekolah melatih siswa berwirausaha sejak dini. (2) Siswa belajar mengelola stok barang, mencatat penjualan, dan melayani pembeli. (3) Pengurus koperasi sekolah dipilih melalui rapat anggota setiap dua tahun sekali. (4) Keuntungan yang diperoleh kemudian digunakan untuk mendanai kegiatan sekolah. (5) Dengan begitu, siswa memahami hubungan antara kerja keras dan hasil usaha.
Kalimat yang tidak mendukung gagasan utama paragraf tersebut adalah ….', 'Gagasan utama adalah koperasi sekolah sebagai sarana latihan berwirausaha. Kalimat (3) tentang pemilihan pengurus tidak mendukung gagasan itu dan memutus alur dari kegiatan usaha (2) ke keuntungan (4).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kalimat (1)', false),
  ('B', 'kalimat (2)', false),
  ('C', 'kalimat (3)', true),
  ('D', 'kalimat (4)', false),
  ('E', 'kalimat (5)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-024', m.id, 'sedang', 'Kalimat simpulan yang paling tepat untuk paragraf berikut adalah ….
(1) Sepeda motor listrik tidak menghasilkan emisi gas buang saat dikendarai. (2) Biaya perawatannya pun lebih rendah karena komponen mesinnya lebih sedikit. (3) Namun, harga belinya masih tinggi dan stasiun pengisian daya belum banyak tersedia. (4) …..', 'Simpulan harus mencakup keuntungan (1)–(2) sekaligus kendala (3). Hanya pilihan A yang memuat keduanya tanpa menambahkan gagasan baru.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dengan demikian, sepeda motor listrik menguntungkan, tetapi masih memerlukan dukungan harga dan infrastruktur.', true),
  ('B', 'Dengan demikian, sepeda motor listrik lebih baik daripada mobil listrik dalam segala hal.', false),
  ('C', 'Oleh karena itu, pemerintah wajib melarang sepeda motor berbahan bakar bensin.', false),
  ('D', 'Dengan demikian, sepeda motor listrik tidak layak dikembangkan.', false),
  ('E', 'Sebaliknya, sepeda motor listrik hanya cocok dipakai oleh pengendara muda.', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PBM-KEP-025', m.id, 'sulit', 'Susunan kalimat acak berikut yang membentuk paragraf padu adalah ….
(1) Peristiwa ini terjadi ketika Bulan berada tepat di antara Matahari dan Bumi.
(2) Karena itu, cahaya Matahari terhalang dan sebagian wilayah Bumi menjadi gelap sesaat.
(3) Gerhana Matahari adalah peristiwa astronomi yang menarik perhatian banyak orang.
(4) Oleh karena itu, pengamat disarankan memakai kacamata khusus.
(5) Meskipun hanya berlangsung beberapa menit, gerhana dapat merusak mata jika diamati tanpa pelindung.', 'Kalimat (3) memperkenalkan topik sehingga "peristiwa ini" pada (1) mengikutinya. Kalimat (2) berisi akibat dari (1). Kalimat (5) menyebut bahaya, dan (4) merupakan saran yang menjadi akibat dari bahaya tersebut.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pemahaman Bacaan dan Menulis' and m.nama = 'Kepaduan Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(3)–(2)–(1)–(5)–(4)', false),
  ('B', '(3)–(1)–(2)–(5)–(4)', true),
  ('C', '(1)–(3)–(2)–(5)–(4)', false),
  ('D', '(3)–(1)–(2)–(4)–(5)', false),
  ('E', '(2)–(1)–(3)–(5)–(4)', false)
) as v (label, isi, is_benar)
where so.kode = 'PBM-KEP-025'
on conflict (soal_id, label) do nothing;
