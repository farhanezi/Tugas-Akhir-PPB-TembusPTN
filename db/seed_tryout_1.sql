-- =====================================================================
-- Try Out 1: simulasi UTBK-SNBT lengkap (7 subtes, 160 soal, 195 menit).
-- Dibuat 19 Nov 2026.
--
-- Isi:
--   1. Membuat try out "Try Out 1" (terbit).
--   2. Menambah 50 soal Literasi orisinal (30 Bahasa Indonesia, 20 Bahasa Inggris,
--      sumber: db/alat_soal/sumber_lbi_to1.txt dan sumber_lbe_to1.txt).
--   3. MEMINDAH 110 soal latihan yang sudah ada ke try out ini (bukan disalin):
--      Penalaran Umum 30, PPU 20, PBM 20, Pengetahuan Kuantitatif 20, Penalaran Matematika 20.
--      Soal berwacana dipindah utuh. Soal yang opsinya tidak tepat 5 dengan 1 kunci tidak dipilih.
--   4. Memeriksa total 160 soal. Jika tidak cocok, seluruh perubahan dibatalkan.
--
-- Aman dijalankan ulang: soal yang sudah pindah tidak diubah lagi.
-- Try out dummy ("[DUMMY] Try Out Mini") tidak disentuh. Untuk menyembunyikannya
-- dari pengguna setelah ini, jalankan terpisah:
--   update try_out set terbit = false where judul like '[DUMMY]%';
-- (uji-e2e.js masih memakai try out dummy, jadi lakukan itu belakangan.)
-- =====================================================================
begin;

insert into try_out (judul, deskripsi, terbit)
values ('Try Out 1', 'Simulasi UTBK-SNBT lengkap: 7 subtes, 160 soal, 195 menit. Dikerjakan berurutan dengan timer per subtes.', true)
on conflict (judul) do nothing;

-- ---------- Literasi dalam Bahasa Indonesia (30 soal) ----------
do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-001') then
    insert into wacana (isi) values ('Banjir rob atau banjir pasang adalah genangan air laut yang masuk ke daratan ketika air laut sedang pasang. Peristiwa ini bukan hal baru bagi kota-kota pesisir, tetapi frekuensinya kian meningkat dari tahun ke tahun.

Ada dua faktor utama yang saling memperkuat. Pertama, permukaan tanah di banyak kota pesisir turun akibat pengambilan air tanah secara berlebihan. Ketika air di lapisan bawah tanah disedot terus-menerus, ruang kosong yang ditinggalkannya memampatkan lapisan di atasnya sehingga tanah ambles. Kedua, permukaan air laut perlahan naik seiring mencairnya es di kutub dan memuainya air laut yang menghangat. Tanah yang makin rendah bertemu laut yang makin tinggi, sehingga air pasang yang dahulu berhenti di tepi pantai kini merayap ke permukiman.

Keadaan tersebut diperparah oleh hilangnya hutan mangrove yang selama ini menahan laju gelombang. Kawasan hijau di pesisir banyak diubah menjadi tambak dan bangunan. Akibatnya, air laut tidak lagi terhambat, dan genangan bertahan lebih lama karena saluran pembuangan tertutup air pasang.

Untuk menekan dampaknya, sejumlah kota membangun tanggul laut dan menyediakan sumber air bersih alternatif agar warga tidak lagi menyedot air tanah. Langkah itu memang mahal, tetapi tanpa penanganan yang menyeluruh, genangan akan terus kembali setiap kali air laut pasang.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-001', m.id, w, 'mudah', 'Menurut teks, penyebab turunnya permukaan tanah di kota pesisir adalah ….', 'Paragraf kedua menyebut bahwa tanah turun karena air tanah disedot berlebihan sehingga lapisan di atasnya memampat dan ambles. Mencairnya es berkaitan dengan naiknya muka laut, bukan turunnya tanah.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'mencairnya es di kutub', false),
      ('B', 'pengambilan air tanah secara berlebihan', true),
      ('C', 'hilangnya hutan mangrove', false),
      ('D', 'pembangunan tanggul laut', false),
      ('E', 'air laut yang sedang pasang', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-002', m.id, w, 'sedang', 'Urutan proses amblesnya tanah menurut teks yang tepat adalah ….', 'Paragraf kedua menjelaskan bahwa air tanah disedot, ruang kosong yang ditinggalkan memampatkan lapisan di atasnya, lalu tanah ambles. Urutan lain membalik hubungan sebab dan akibat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'tanah ambles – air tanah disedot – ruang kosong terbentuk – lapisan atas memampat', false),
      ('B', 'ruang kosong terbentuk – air tanah disedot – tanah ambles – lapisan atas memampat', false),
      ('C', 'lapisan atas memampat – air tanah disedot – tanah ambles – ruang kosong terbentuk', false),
      ('D', 'air tanah disedot – ruang kosong terbentuk – lapisan atas memampat – tanah ambles', true),
      ('E', 'air tanah disedot – tanah ambles – lapisan atas memampat – ruang kosong terbentuk', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-003', m.id, w, 'sulit', 'Pernyataan yang sesuai dengan isi teks adalah ….', 'Paragraf ketiga menyatakan genangan bertahan lebih lama karena saluran pembuangan tertutup air pasang. Pilihan A terlalu mutlak, B bertentangan dengan kalimat terakhir, D mencampuradukkan sebab, dan E bertentangan dengan kalimat pertama paragraf pertama.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Banjir rob hanya terjadi pada kota yang tidak memiliki hutan mangrove.', false),
      ('B', 'Tanggul laut sudah cukup untuk menghentikan banjir rob tanpa langkah lain.', false),
      ('C', 'Genangan bertahan lebih lama karena saluran pembuangan tertutup air pasang.', true),
      ('D', 'Kenaikan muka laut disebabkan oleh pengambilan air tanah.', false),
      ('E', 'Banjir rob merupakan peristiwa baru yang baru terjadi beberapa tahun terakhir.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-004', m.id, w, 'sedang', 'Simpulan yang tepat berdasarkan teks tersebut adalah ….', 'Teks menjelaskan dua faktor utama (tanah turun dan laut naik), faktor pemerat (hilangnya mangrove), serta perlunya penanganan menyeluruh. Pilihan lain terlalu sempit atau tidak disebut dalam teks.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Menanam mangrove saja sudah cukup untuk menghentikan banjir rob.', false),
      ('B', 'Pengambilan air tanah adalah satu-satunya penyebab banjir rob.', false),
      ('C', 'Banjir rob hanya terjadi ketika bulan purnama sehingga tidak perlu ditangani.', false),
      ('D', 'Kota pesisir sebaiknya dipindahkan seluruhnya ke daerah pegunungan.', false),
      ('E', 'Banjir rob makin sering karena tanah menurun dan laut naik, sehingga diperlukan penanganan yang menyeluruh.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-004'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-005', m.id, w, 'mudah', 'Makna kata "merayap" pada kalimat "air pasang yang dahulu berhenti di tepi pantai kini merayap ke permukiman" adalah ….', 'Dalam konteks kalimat, air yang dahulu berhenti di tepi pantai kini sampai ke permukiman. Jadi "merayap" berarti bergerak perlahan namun makin jauh.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'bergerak perlahan tetapi makin jauh menjangkau tempat baru', true),
      ('B', 'bergerak cepat dan menghantam dengan keras', false),
      ('C', 'menyusup diam-diam pada malam hari', false),
      ('D', 'surut kembali ke arah laut', false),
      ('E', 'berputar-putar di satu tempat', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-005'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-006') then
    insert into wacana (isi) values ('Setiap menjelang magrib, Nenek menyalakan lampu minyak di beranda, padahal listrik sudah masuk ke dusun itu sejak dua tahun lalu. Raka, cucunya yang baru pulang dari kota, menganggap kebiasaan itu boros dan ketinggalan zaman.

"Nek, lampu listrik kan lebih terang," katanya sambil menekan sakelar. Beranda seketika benderang. Nenek hanya tersenyum, lalu tetap menggeser lampu minyak ke sudut meja.

Malam itu listrik padam. Dusun mendadak gelap gulita. Raka meraba-raba mencari ponselnya yang baterainya hampir habis. Di tengah kegelapan, cahaya kuning kecil menyala dari beranda. Satu per satu tetangga datang membawa anak-anak mereka, berkumpul di bawah cahaya yang bergetar itu. Nenek membagikan teh hangat tanpa banyak bicara.

"Dulu, lampu ini yang menuntun ayahmu pulang dari sawah," kata Nenek pelan. "Sekarang orang-orang tahu ke mana harus datang kalau gelap."

Raka terdiam. Ia menatap nyala yang kecil tetapi tak pernah ragu itu. Pikirannya tentang kemajuan yang selama ini ia banggakan terasa menyempit. Esok pagi, ia berjanji akan membantu Nenek mengisi minyak, dan malam-malam berikutnya ia memilih duduk di beranda ketimbang menyalakan sakelar.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-006', m.id, w, 'mudah', 'Tema cerita tersebut adalah ….', 'Lampu minyak Nenek mengumpulkan warga saat listrik padam dan menyadarkan Raka akan nilai kebiasaan itu. Inti cerita adalah kebersamaan yang dijaga oleh kebiasaan sederhana.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kemajuan teknologi mempermudah kehidupan di desa', false),
      ('B', 'kesulitan hidup di dusun yang belum berlistrik', false),
      ('C', 'nilai kebersamaan yang dipelihara oleh kebiasaan sederhana', true),
      ('D', 'perjuangan seorang cucu merantau ke kota', false),
      ('E', 'kesetiaan seorang nenek kepada suaminya', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-007', m.id, w, 'sedang', 'Perubahan sikap Raka dalam cerita tersebut adalah ….', 'Awalnya Raka menilai kebiasaan itu boros dan ketinggalan zaman. Setelah malam itu, ia berjanji membantu Nenek dan memilih duduk di beranda, tanda ia menghargai maknanya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'dari menganggap remeh kebiasaan Nenek menjadi menghargai maknanya', true),
      ('B', 'dari rajin membantu menjadi malas bekerja', false),
      ('C', 'dari takut gelap menjadi berani', false),
      ('D', 'dari menyukai kota menjadi membenci kota', false),
      ('E', 'dari sayang kepada Nenek menjadi acuh tak acuh', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-008', m.id, w, 'sedang', 'Lampu minyak dalam cerita tersebut melambangkan ….', 'Nenek mengatakan lampu itu dulu menuntun ayah Raka pulang, dan kini membuat orang tahu ke mana harus datang saat gelap. Lampu menjadi simbol penuntun dan pemersatu warga.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kekunoan yang menghambat kemajuan', false),
      ('B', 'kemiskinan keluarga Nenek', false),
      ('C', 'kemarahan Nenek terhadap Raka', false),
      ('D', 'kemewahan yang dimiliki penduduk dusun', false),
      ('E', 'penuntun sekaligus pemersatu warga dusun', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-008'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-009', m.id, w, 'sulit', 'Amanat yang paling tepat dalam cerita tersebut adalah ….', 'Cerita tidak menolak listrik; ia menunjukkan bahwa kebiasaan lama (lampu minyak) tetap bermanfaat bagi warga. Pilihan A, C, D, dan E terlalu mutlak atau tidak didukung cerita.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Teknologi modern sebaiknya ditinggalkan oleh masyarakat desa.', false),
      ('B', 'Kemajuan tidak harus meninggalkan kebiasaan lama yang masih memberi manfaat bagi banyak orang.', true),
      ('C', 'Orang tua selalu lebih bijak daripada anak muda dalam segala hal.', false),
      ('D', 'Listrik tidak dapat diandalkan sebagai sumber penerangan.', false),
      ('E', 'Anak yang merantau akan melupakan kampung halamannya.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-010', m.id, w, 'mudah', 'Kata "ketimbang" pada kalimat terakhir bermakna ….', '"Memilih duduk di beranda ketimbang menyalakan sakelar" berarti memilih duduk di beranda daripada menyalakan sakelar.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'sesudah', false),
      ('B', 'bersama', false),
      ('C', 'selain', false),
      ('D', 'daripada', true),
      ('E', 'sampai', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-010'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-011') then
    insert into wacana (isi) values ('Larangan membawa ponsel ke dalam kelas kerap dianggap kuno. Sebagian orang beranggapan bahwa siswa sekarang hidup di zaman digital sehingga ponsel semestinya dimanfaatkan, bukan dilarang. Namun, pembatasan penggunaan ponsel selama jam pelajaran justru merupakan langkah yang masuk akal.

Alasan pertama adalah konsentrasi. Notifikasi pesan dan media sosial menarik perhatian siswa dalam hitungan detik. Sekali perhatian terpecah, dibutuhkan waktu untuk kembali memahami materi yang sedang dijelaskan. Padahal, waktu belajar di kelas terbatas.

Alasan kedua berkaitan dengan interaksi. Ketika semua siswa menunduk menatap layar, diskusi dan tanya jawab kehilangan kehangatannya. Kemampuan berbicara dan mendengarkan, yang sangat dibutuhkan dalam kehidupan, tidak terlatih dengan baik.

Memang, ponsel dapat menjadi alat belajar yang berguna, misalnya untuk mencari arti kata di kamus daring. Akan tetapi, manfaat itu tetap dapat diperoleh melalui aturan yang tegas: ponsel hanya boleh digunakan ketika guru memintanya untuk keperluan pembelajaran. Dengan cara ini, sekolah tidak menutup diri terhadap teknologi, sekaligus menjaga ruang kelas tetap menjadi tempat belajar yang fokus.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-011', m.id, w, 'mudah', 'Pendapat penulis tentang penggunaan ponsel di kelas adalah ….', 'Kalimat terakhir paragraf pertama menyatakan tesis penulis: pembatasan penggunaan ponsel selama jam pelajaran adalah langkah yang masuk akal.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'sebaiknya diizinkan sepenuhnya karena siswa hidup di zaman digital', false),
      ('B', 'sebaiknya dilarang total di seluruh lingkungan sekolah', false),
      ('C', 'tidak berpengaruh terhadap hasil belajar siswa', false),
      ('D', 'perlu dibatasi selama jam pelajaran', true),
      ('E', 'hanya boleh digunakan oleh guru', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-012', m.id, w, 'sedang', 'Alasan kedua penulis mendukung pembatasan ponsel adalah ….', 'Paragraf ketiga diawali "Alasan kedua berkaitan dengan interaksi" dan menjelaskan hilangnya kehangatan diskusi. Pilihan A adalah alasan pertama (konsentrasi).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'notifikasi menarik perhatian siswa', false),
      ('B', 'ponsel mengurangi interaksi seperti diskusi dan tanya jawab', true),
      ('C', 'harga ponsel terlalu mahal bagi siswa', false),
      ('D', 'ponsel dapat merusak penglihatan', false),
      ('E', 'guru kesulitan mengawasi nilai ujian', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-012'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-013', m.id, w, 'sedang', 'Paragraf keempat dalam teks berfungsi untuk ….', 'Penulis mengakui ponsel bermanfaat ("Memang, ..."), lalu menawarkan aturan penggunaan atas permintaan guru. Fungsi paragraf ini adalah menanggapi pandangan lawan dan memberi jalan tengah.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'mengakui manfaat ponsel sekaligus menawarkan aturan sebagai jalan tengah', true),
      ('B', 'membantah seluruh alasan pada paragraf sebelumnya', false),
      ('C', 'menyimpulkan bahwa ponsel tidak perlu dibatasi', false),
      ('D', 'menyajikan data penelitian tentang konsentrasi siswa', false),
      ('E', 'mengajak siswa agar menaati larangan sekolah', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-014', m.id, w, 'sulit', 'Pernyataan yang paling melemahkan alasan pertama penulis adalah ….', 'Alasan pertama menyatakan pembatasan ponsel menjaga konsentrasi. Jika konsentrasi siswa tidak berbeda antara sekolah yang membatasi dan tidak, alasan itu melemah. Pilihan A mendukung, sedangkan B, D, dan E tidak berkaitan langsung.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Sebagian siswa mengaku lebih tenang jika ponsel mereka tidak dibawa ke kelas.', false),
      ('B', 'Banyak sekolah telah menyediakan kamus cetak di perpustakaan.', false),
      ('C', 'Sebuah penelitian menemukan bahwa tingkat konsentrasi siswa tidak berbeda antara sekolah yang membatasi ponsel dan yang tidak.', true),
      ('D', 'Siswa lebih mudah memahami pelajaran ketika guru memakai media visual.', false),
      ('E', 'Notifikasi ponsel paling banyak berasal dari aplikasi pesan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-015', m.id, w, 'sedang', 'Simpulan yang tepat dari teks tersebut adalah ….', 'Teks menolak larangan total maupun kebebasan penuh. Penulis menyarankan pembatasan dengan pengecualian untuk keperluan pembelajaran atas permintaan guru.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Ponsel perlu dilarang sepenuhnya agar siswa lebih disiplin.', false),
      ('B', 'Siswa zaman sekarang tidak dapat belajar tanpa ponsel.', false),
      ('C', 'Diskusi di kelas lebih baik dilakukan melalui aplikasi percakapan.', false),
      ('D', 'Penggunaan teknologi dalam pembelajaran sebaiknya dihentikan.', false),
      ('E', 'Ponsel sebaiknya dibatasi di kelas dan dipakai hanya untuk keperluan belajar atas permintaan guru.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-015'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-016') then
    insert into wacana (isi) values ('Ulasan Novel "Cahaya di Ujung Dermaga"

Novel karya Laras Handayani ini berkisah tentang Mirah, perempuan muda dari kampung nelayan yang berusaha mempertahankan perahu peninggalan ayahnya di tengah tekanan seorang juragan. Latar kampung pesisir digambarkan hidup: bau garam, teriakan pedagang ikan, dan deru mesin perahu terasa dekat dengan pembaca.

Kekuatan utama novel ini terletak pada karakter Mirah. Ia tidak digambarkan sebagai tokoh yang sempurna; ia ragu, sempat marah, bahkan membuat keputusan yang keliru. Justru kerapuhan itu membuatnya terasa dekat dan meyakinkan.

Sayangnya, bagian tengah novel berjalan lamban. Beberapa bab hanya mengulang pertengkaran yang sama tanpa membawa cerita maju. Penyelesaian konflik di akhir pun terasa tergesa-gesa sehingga kurang memuaskan setelah pembaca diajak menunggu begitu lama.

Meskipun demikian, novel ini layak dibaca, terutama oleh pembaca yang menyukai cerita tentang keteguhan dan kehidupan masyarakat pesisir. Dengan penyuntingan yang lebih ringkas, kisah ini sebenarnya dapat menjadi jauh lebih kuat.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-016', m.id, w, 'mudah', 'Hal yang dipuji dalam ulasan tersebut adalah ….', 'Paragraf kedua menyebut kekuatan utama novel ada pada karakter Mirah yang tidak sempurna sehingga terasa dekat dan meyakinkan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'tokoh utama yang tidak sempurna sehingga terasa meyakinkan', true),
      ('B', 'alur bagian tengah yang bergerak cepat', false),
      ('C', 'penyelesaian konflik yang matang', false),
      ('D', 'penyuntingan yang ringkas', false),
      ('E', 'pilihan judul yang menarik', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-016'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-017', m.id, w, 'sedang', 'Kelemahan novel menurut penulis ulasan adalah ….', 'Paragraf ketiga menyebut bagian tengah novel lamban dan penyelesaian konflik terasa tergesa-gesa. Latar dan tokoh utama justru dipuji.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'latar yang kurang dihidupkan', false),
      ('B', 'tokoh utama yang terlalu sempurna', false),
      ('C', 'bahasa yang sulit dipahami', false),
      ('D', 'jumlah tokoh yang terlalu sedikit', false),
      ('E', 'bagian tengah yang lamban dan penyelesaian konflik yang tergesa-gesa', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-018', m.id, w, 'sulit', 'Pernyataan yang sesuai dengan penilaian penulis ulasan adalah ….', 'Paragraf terakhir menyatakan "Meskipun demikian, novel ini layak dibaca". Pilihan A dan C terlalu ekstrem, D menyempitkan sasaran pembaca, dan E tidak dibahas.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Eksplanatif dan Ulasan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Novel tersebut sempurna sehingga tidak perlu diperbaiki.', false),
      ('B', 'Novel tersebut tetap layak dibaca meskipun memiliki kekurangan.', true),
      ('C', 'Novel tersebut tidak layak dibaca karena alurnya lamban.', false),
      ('D', 'Novel tersebut hanya cocok untuk pembaca yang tinggal di pesisir.', false),
      ('E', 'Novel tersebut lebih baik daripada karya Laras Handayani sebelumnya.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-019', m.id, w, 'sedang', 'Kata "kerapuhan" pada paragraf kedua bermakna ….', 'Kerapuhan merujuk pada keraguan, kemarahan, dan keputusan keliru Mirah, yaitu sisi lemahnya sebagai manusia biasa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kekuatan yang tersembunyi', false),
      ('B', 'kemewahan yang dimiliki tokoh', false),
      ('C', 'kebiasaan buruk yang menahun', false),
      ('D', 'sisi lemah dan kerentanan sebagai manusia biasa', true),
      ('E', 'kemampuan untuk menyembunyikan perasaan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-020', m.id, w, 'sedang', 'Saran penulis ulasan agar kisah dalam novel menjadi lebih kuat adalah ….', 'Kalimat terakhir ulasan menyebut bahwa dengan penyuntingan yang lebih ringkas kisah ini dapat menjadi jauh lebih kuat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menambah jumlah bab di bagian tengah', false),
      ('B', 'mengganti latar kampung nelayan', false),
      ('C', 'meringkas novel melalui penyuntingan yang lebih ketat', true),
      ('D', 'menghilangkan tokoh juragan', false),
      ('E', 'memperpanjang bagian akhir cerita', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-021') then
    insert into wacana (isi) values ('Pasar tradisional sering dipandang sebagai tempat belanja yang kumuh dan kalah modern dibandingkan pusat perbelanjaan. Padahal, pasar tradisional memiliki peran yang tidak tergantikan. Di sana, harga dapat ditawar sehingga pembeli dan pedagang membangun hubungan saling percaya. Para pedagang kecil pun memperoleh penghasilan dari penjualan hasil bumi petani setempat, sehingga uang berputar di lingkungan sekitar.

Di sisi lain, pasar tradisional menghadapi persoalan nyata: lorong becek, sampah menumpuk, dan tata letak lapak yang semrawut. Persoalan ini membuat sebagian orang enggan berbelanja. Revitalisasi pasar semestinya tidak berhenti pada pembangunan gedung baru yang megah, tetapi juga memperhatikan kebersihan, pengelolaan sampah, dan pelatihan bagi pedagang.

Jika dikelola dengan baik, pasar tradisional dapat bersaing tanpa kehilangan jati dirinya. Pasar yang bersih dan tertata tetap menyuguhkan keramahan khas yang tidak ditawarkan pusat perbelanjaan mana pun.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-021', m.id, w, 'mudah', 'Ide pokok paragraf pertama adalah ….', 'Paragraf pertama menyatakan "pasar tradisional memiliki peran yang tidak tergantikan", lalu menjelaskannya dengan hubungan pembeli dan pedagang serta perputaran uang di lingkungan sekitar.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pasar tradisional kalah bersaing dengan pusat perbelanjaan', false),
      ('B', 'harga di pasar tradisional lebih murah daripada di tempat lain', false),
      ('C', 'pedagang kecil kesulitan memperoleh modal', false),
      ('D', 'petani setempat enggan menjual hasil buminya', false),
      ('E', 'pasar tradisional memiliki peran penting yang tidak tergantikan', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-021'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-022', m.id, w, 'sedang', 'Ide pokok paragraf kedua adalah ….', 'Paragraf kedua memaparkan persoalan nyata (becek, sampah, lapak semrawut) dan menyatakan revitalisasi harus memperhatikan kebersihan, pengelolaan sampah, dan pelatihan pedagang.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pasar tradisional harus dibongkar dan diganti bangunan megah', false),
      ('B', 'pedagang perlu dilarang berjualan di lorong pasar', false),
      ('C', 'persoalan kebersihan dan tata kelola pasar perlu dibenahi dalam revitalisasi', true),
      ('D', 'sampah di pasar tradisional tidak dapat dikelola', false),
      ('E', 'pembeli lebih menyukai pusat perbelanjaan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-022'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-023', m.id, w, 'sedang', 'Simpulan yang dapat ditarik dari seluruh isi teks tentang pasar tradisional adalah ….', 'Paragraf ketiga menegaskan bahwa pasar yang dikelola dengan baik dapat bersaing tanpa kehilangan jati dirinya. Pilihan lain bertentangan dengan teks atau terlalu pesimistis.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Pasar tradisional sebaiknya digantikan oleh pusat perbelanjaan modern.', false),
      ('B', 'Pasar tradisional perlu dibenahi agar tetap berperan dan mampu bersaing tanpa kehilangan ciri khasnya.', true),
      ('C', 'Revitalisasi pasar cukup dilakukan dengan membangun gedung baru.', false),
      ('D', 'Keramahan pedagang tidak lagi diperlukan di pasar yang modern.', false),
      ('E', 'Pasar tradisional sulit berkembang karena masalah kebersihan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-023'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-024', m.id, w, 'sedang', 'Frasa "jati dirinya" pada paragraf ketiga bermakna ….', 'Jati diri berarti ciri khas atau identitas. Dalam teks, pasar tradisional tetap bersaing tanpa kehilangan keramahan khasnya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'ciri khas yang menjadi identitasnya', true),
      ('B', 'kekayaan yang dimilikinya', false),
      ('C', 'nama yang telah dikenal luas', false),
      ('D', 'aturan yang mengikatnya', false),
      ('E', 'kemampuan bersaingnya', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-024'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-025', m.id, w, 'sulit', 'Pernyataan yang paling mendukung pendapat penulis mengenai revitalisasi pasar adalah ….', 'Penulis berpendapat revitalisasi tidak boleh berhenti pada gedung baru, tetapi juga membenahi kebersihan dan pengelolaan sampah. Pernyataan D mendukung pendapat itu; yang lain tidak berkaitan langsung.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Argumentatif'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Pusat perbelanjaan menawarkan ruang berpendingin yang nyaman bagi pengunjung.', false),
      ('B', 'Jumlah pedagang di pasar tradisional meningkat setiap tahun.', false),
      ('C', 'Banyak pembeli mengeluh karena harga di pasar tradisional sulit ditawar.', false),
      ('D', 'Pasar yang direnovasi tanpa membenahi pengelolaan sampah kembali kotor dalam waktu singkat.', true),
      ('E', 'Gedung pasar baru biasanya dibangun dengan biaya yang besar.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-025'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBI-026') then
    insert into wacana (isi) values ('Senja di Dermaga Tua

Kapal terakhir sudah lama berlayar,
meninggalkan tiang-tiang yang lapuk menunggu.
Angin membawa asin dan cerita lama,
sebab di sinilah dulu seorang ibu melepas anaknya.

Ombak menyapu papan yang kian rapuh,
namun ia tetap berdiri, setia seperti janji.
Senja menyalakan jingga di atas air,
dan dermaga itu, diam-diam, masih berharap pulang.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-026', m.id, w, 'sedang', 'Tema puisi tersebut adalah ….', 'Puisi menggambarkan dermaga tua yang tetap berdiri dan "masih berharap pulang", mengingatkan pada ibu yang melepas anaknya. Temanya adalah kesetiaan menanti.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'keindahan senja di tepi pantai', false),
      ('B', 'kesetiaan menanti kepulangan orang yang pergi', true),
      ('C', 'kerasnya kehidupan para nelayan', false),
      ('D', 'kerusakan lingkungan pesisir', false),
      ('E', 'perjuangan melawan ombak', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-026'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-027', m.id, w, 'sulit', 'Majas yang digunakan pada larik "dan dermaga itu, diam-diam, masih berharap pulang" adalah ….', 'Dermaga (benda mati) digambarkan berharap seperti manusia. Pemberian sifat manusia pada benda mati disebut personifikasi.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Teks Sastra'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'personifikasi', true),
      ('B', 'hiperbola', false),
      ('C', 'litotes', false),
      ('D', 'ironi', false),
      ('E', 'sinekdoke', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-027'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-028', m.id, w, 'sedang', 'Kata "lapuk" pada larik kedua bermakna ….', 'Tiang dermaga yang menunggu bertahun-tahun digambarkan rusak dan rapuh karena usia. Itulah makna "lapuk".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'baru dibangun', false),
      ('B', 'tertutup lumut', false),
      ('C', 'bergoyang kencang', false),
      ('D', 'rusak dan rapuh karena dimakan usia', true),
      ('E', 'dihiasi ukiran', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-028'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-029', m.id, w, 'mudah', 'Kata "menyalakan" dalam larik "Senja menyalakan jingga di atas air" bermakna ….', 'Senja tidak benar-benar membakar atau memasang lampu. Larik itu berarti senja memunculkan warna jingga di atas air.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Makna Kontekstual Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'membakar sehingga menjadi api', false),
      ('B', 'menutup warna air', false),
      ('C', 'memunculkan atau menampakkan', true),
      ('D', 'menghapus warna langit', false),
      ('E', 'menyinari dengan lampu', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-029'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBI-030', m.id, w, 'sulit', 'Simpulan isi puisi tersebut yang paling tepat adalah ….', 'Dermaga yang tetap berdiri dan berharap pulang melambangkan penantian setia. Pilihan A, B, C, dan D hanya menangkap sebagian detail atau menambahkan hal yang tidak tertulis.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Indonesia' and m.nama = 'Inti dan Simpulan Bacaan'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Dermaga tua dibiarkan rusak karena tidak ada lagi kapal yang berlabuh.', false),
      ('B', 'Seorang ibu menyesal telah melepas anaknya berlayar.', false),
      ('C', 'Senja di dermaga merupakan pemandangan yang paling indah.', false),
      ('D', 'Ombak adalah ancaman bagi keberadaan dermaga.', false),
      ('E', 'Dermaga tua melambangkan penantian yang setia kepada mereka yang telah pergi.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBI-030'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

-- ---------- Literasi dalam Bahasa Inggris (20 soal) ----------
do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBE-001') then
    insert into wacana (isi) values ('Honey may look like a simple golden syrup, but making it is a team effort that takes thousands of trips. A worker bee begins by visiting flowers and sipping nectar with her long tongue. She stores the nectar in a special organ called the honey stomach, which is separate from the stomach she uses to digest food.

Back at the hive, the forager passes the nectar to a younger bee, who chews it for a while. During this stage, enzymes from the bee''s body begin to break the complex sugars in the nectar into simpler ones. The bee then spreads the liquid into a cell of the honeycomb. At this point the mixture is still thin and watery.

To thicken it, other bees fan their wings over the open cells, causing much of the water to evaporate. When the honey is thick enough, the bees seal the cell with a thin layer of wax. Sealed in this way, honey can stay fresh for a very long time, serving as food for the colony during winter, when flowers are scarce.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-001', m.id, w, 'mudah', 'Where does a worker bee carry the nectar while she flies back to the hive?', 'Paragraf pertama menyebut bahwa lebah menyimpan nektar di organ khusus bernama honey stomach, yang terpisah dari perut untuk mencerna makanan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Explanatory and Review Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'In the stomach she uses for food', false),
      ('B', 'In a cell of the honeycomb', false),
      ('C', 'In a special organ called the honey stomach', true),
      ('D', 'Under her wings', false),
      ('E', 'On her long tongue', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-002', m.id, w, 'sedang', 'Why do the bees fan their wings over the open cells?', 'Paragraf ketiga menjelaskan bahwa kipasan sayap membuat banyak air menguap sehingga madu menjadi kental.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Explanatory and Review Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'To make water evaporate so the honey becomes thicker', true),
      ('B', 'To cool the hive during summer', false),
      ('C', 'To call other bees to the flowers', false),
      ('D', 'To mix wax into the honey', false),
      ('E', 'To keep insects away from the hive', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-003', m.id, w, 'sulit', 'Which sequence best describes how honey is made according to the passage?', 'Urutan dalam teks: nektar dikumpulkan, dikunyah lebah muda, disebar ke sel sarang, dikipasi sayap agar mengental, lalu ditutup lilin.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Explanatory and Review Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Nectar is sealed with wax, chewed by a young bee, spread in cells, and then collected from flowers.', false),
      ('B', 'Nectar is collected, fanned by wings, chewed by a young bee, and then sealed with wax.', false),
      ('C', 'Nectar is collected, spread in cells, chewed by a young bee, and then fanned by wings.', false),
      ('D', 'Nectar is chewed by a young bee, collected from flowers, sealed with wax, and then fanned by wings.', false),
      ('E', 'Nectar is collected, chewed by a young bee, spread in cells, fanned by wings, and then sealed with wax.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-004', m.id, w, 'mudah', 'The word "scarce" in the last sentence is closest in meaning to ….', 'Pada musim dingin bunga sulit ditemukan, sehingga "scarce" berarti jumlahnya sedikit atau langka (in short supply).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Contextual Meaning'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'abundant', false),
      ('B', 'in short supply', true),
      ('C', 'colourful', false),
      ('D', 'harmful', false),
      ('E', 'fragrant', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-004'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-005', m.id, w, 'sedang', 'What is the main idea of the passage?', 'Teks menguraikan tahapan pembuatan madu yang melibatkan lebah pencari, lebah muda, dan lebah pengipas. Gagasan utamanya adalah proses bertahap yang bergantung pada kerja sama.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Main Idea and Conclusion'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Bees prefer some flowers over others.', false),
      ('B', 'Honey is mainly eaten by people in winter.', false),
      ('C', 'Worker bees live longer than other bees.', false),
      ('D', 'Making honey is a multi-step process that depends on cooperation among bees.', true),
      ('E', 'Wax is more important to bees than honey.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-005'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBE-006') then
    insert into wacana (isi) values ('Review: StudyNest, a Study-Planning App

StudyNest promises to help students organize their schedules, and for the most part it delivers. The app''s greatest strength is its simplicity. Within minutes of installing it, a user can enter school subjects, set deadlines, and receive reminders. The clean layout makes the app pleasant to use, even for people who are not comfortable with technology.

However, the app is not without flaws. The free version limits users to five subjects, which is hardly enough for a student with a full timetable. Unlocking unlimited subjects requires a monthly subscription that seems expensive for what it offers. Moreover, the reminders occasionally arrive late, which defeats the purpose of a planner.

Overall, StudyNest is a good starting point for students who want to build better habits. Until the developers fix the reminder problem and reconsider the price, though, I would recommend it only to those with lighter schedules.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-006', m.id, w, 'mudah', 'According to the review, what is the greatest strength of StudyNest?', 'Kalimat kedua paragraf pertama menyatakan "The app''s greatest strength is its simplicity."'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Explanatory and Review Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Its low price', false),
      ('B', 'Its simplicity', true),
      ('C', 'Its many features', false),
      ('D', 'Its accurate reminders', false),
      ('E', 'Its free version', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-007', m.id, w, 'sedang', 'Which statement is NOT true about StudyNest according to the review?', 'Ulasan menyebut aplikasi ini nyaman dipakai bahkan oleh orang yang kurang akrab dengan teknologi, sehingga D bertentangan dengan teks. Pilihan lain disebutkan sebagai kekurangan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Explanatory and Review Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'The free version allows only five subjects.', false),
      ('B', 'Unlimited subjects require a monthly subscription.', false),
      ('C', 'Reminders sometimes arrive late.', false),
      ('D', 'The app is difficult for beginners to use.', true),
      ('E', 'The price seems high for what the app offers.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-008', m.id, w, 'sedang', 'The phrase "defeats the purpose" in the second paragraph means ….', 'Pengingat yang terlambat membuat aplikasi perencana gagal melakukan tugas utamanya. Jadi "defeats the purpose" berarti membuat sesuatu gagal mencapai tujuannya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Contextual Meaning'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'makes something fail to achieve its goal', true),
      ('B', 'wins a competition against others', false),
      ('C', 'changes the original plan', false),
      ('D', 'makes something cheaper', false),
      ('E', 'causes people to forget their homework', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-008'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-009', m.id, w, 'sedang', 'What is the reviewer''s overall opinion of StudyNest?', 'Paragraf terakhir menyebut aplikasi ini titik awal yang baik, tetapi hanya direkomendasikan bagi siswa dengan jadwal ringan sampai masalah pengingat dan harga dibenahi.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Main Idea and Conclusion'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'It is useless and should be avoided.', false),
      ('B', 'It is perfect for every student.', false),
      ('C', 'It is a decent starting point, but best for students with lighter schedules until its problems are fixed.', true),
      ('D', 'It is more useful than any other planner.', false),
      ('E', 'It is worth buying only in its subscription version.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-010', m.id, w, 'sulit', 'Which statement would the reviewer most likely agree with?', 'Reviewer menilai pengingat yang terlambat "defeats the purpose of a planner", sehingga ia akan setuju bahwa perencana hanya berguna jika pengingatnya dapat diandalkan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Argumentative Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'A planner is useful even if it often forgets to remind its users.', false),
      ('B', 'Students with heavy timetables will be happy with the free version.', false),
      ('C', 'A high price is acceptable as long as an app looks attractive.', false),
      ('D', 'Simplicity is less important than the number of features.', false),
      ('E', 'A study planner is only helpful if its reminders are dependable.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-010'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBE-011') then
    insert into wacana (isi) values ('Homework has long been seen as an essential part of education, yet its value is often overstated. Supporters claim that practice at home helps students remember what they learn. This is true in moderation. A few well-designed exercises can strengthen understanding. But when assignments pile up from several subjects at once, the benefit quickly disappears.

Excessive homework carries real costs. Students who spend their evenings finishing worksheets have less time for sleep, exercise, and family. Tired students are less able to concentrate the next day, which undermines the very learning that homework is meant to support.

Therefore, schools should set clear limits. Teachers could coordinate so that students do not receive heavy assignments from every subject on the same night. They could also assign fewer, more meaningful tasks instead of long lists of repetitive problems. Education should be about understanding, not about how many hours a child can spend at a desk.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-011', m.id, w, 'mudah', 'How can the author''s attitude toward homework best be described?', 'Penulis mengakui latihan di rumah bermanfaat "in moderation" tetapi mengkritik tugas yang berlebihan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Argumentative Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Fully in favor of homework', false),
      ('B', 'Totally against all homework', false),
      ('C', 'Uninterested in the topic', false),
      ('D', 'Uncertain about his or her own opinion', false),
      ('E', 'Critical of excessive homework but accepting that some is useful', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-012', m.id, w, 'sedang', 'What does the author mean by "This is true in moderation"?', 'Kalimat berikutnya menyebut bahwa beberapa latihan yang dirancang baik memang membantu, tetapi manfaatnya hilang bila tugas menumpuk. Artinya, latihan di rumah bermanfaat selama tidak berlebihan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Argumentative Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Supporters of homework are always right.', false),
      ('B', 'Homework should be given every day.', false),
      ('C', 'Practice at home helps only when it is not excessive.', true),
      ('D', 'Students must finish their homework in a moderate amount of time.', false),
      ('E', 'Teachers should moderate class discussions.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-012'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-013', m.id, w, 'mudah', 'Which of the following is a cost of excessive homework mentioned in the passage?', 'Paragraf kedua menyebut siswa kekurangan waktu untuk tidur, olahraga, dan keluarga.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Argumentative Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Students lose interest in reading.', false),
      ('B', 'Students have less time for sleep, exercise, and family.', true),
      ('C', 'Teachers have to grade more papers.', false),
      ('D', 'Schools must buy more books.', false),
      ('E', 'Parents have to pay extra fees.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-014', m.id, w, 'sulit', 'Which statement would most strengthen the author''s argument?', 'Penulis berargumen bahwa tugas berlebihan mengurangi waktu tidur dan konsentrasi. Studi pada pilihan D mendukung klaim itu, sedangkan pilihan lain melemahkan atau tidak relevan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Argumentative Text'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Students who have no homework often forget their lessons.', false),
      ('B', 'Teachers usually design homework very carefully.', false),
      ('C', 'Many schools have longer holidays than before.', false),
      ('D', 'A study shows that students who sleep enough perform better on tests than those who stay up late to finish homework.', true),
      ('E', 'Some students enjoy doing worksheets at home.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-015', m.id, w, 'sedang', 'The main idea of the passage is that ….', 'Penulis tidak menolak PR sepenuhnya, tetapi mengusulkan batasan yang jelas dan tugas yang lebih bermakna agar mendukung pemahaman.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Main Idea and Conclusion'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'schools should limit homework and make it more meaningful so that it supports real learning', true),
      ('B', 'homework should be abolished completely', false),
      ('C', 'students are naturally lazy about doing homework', false),
      ('D', 'teachers rarely coordinate with parents', false),
      ('E', 'education is only about the time spent at a desk', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-015'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'TO1-LBE-016') then
    insert into wacana (isi) values ('For thirty years, Mr. Hadi tended the lighthouse on the rocky northern coast. Every evening he climbed the winding stairs, polished the great lens, and lit the lamp whose beam guided fishing boats safely home. The work was lonely, and the sea around the lighthouse was treacherous, with hidden rocks that had wrecked many ships long before he arrived.

When an automatic system replaced human keepers, Mr. Hadi was told he could retire. On his last night he stood on the balcony, watching the beam sweep across the dark water. Below, a small fishing boat appeared, its engine a faint hum against the wind. The fishermen waved up at the tower, as they had done every night for years. Mr. Hadi waved back, his weathered face breaking into a smile. He realized that, although a machine could now turn the light, no machine could ever replace the feeling of being watched over by someone who cared.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-016', m.id, w, 'mudah', 'The word "treacherous" in the first paragraph is closest in meaning to ….', 'Laut digambarkan penuh batu tersembunyi yang telah menghancurkan banyak kapal, jadi "treacherous" berarti berbahaya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Contextual Meaning'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'peaceful', false),
      ('B', 'familiar', false),
      ('C', 'distant', false),
      ('D', 'dangerous', true),
      ('E', 'shallow', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-016'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-017', m.id, w, 'sedang', 'In the phrase "its engine a faint hum against the wind", the word "faint" means ….', 'Suara mesin perahu kecil yang terdengar di tengah angin hanya samar-samar. Jadi "faint" berarti nyaris tidak terdengar.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Contextual Meaning'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'very loud', false),
      ('B', 'barely noticeable', true),
      ('C', 'extremely fast', false),
      ('D', 'highly reliable', false),
      ('E', 'quite old', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-018', m.id, w, 'sulit', 'The phrase "weathered face" suggests that Mr. Hadi''s face is ….', '"Weathered" menggambarkan wajah yang berubah karena bertahun-tahun terpapar cuaca. Konteksnya, Mr. Hadi bekerja tiga puluh tahun di tepi laut.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Contextual Meaning'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pale and sick', false),
      ('B', 'freshly washed', false),
      ('C', 'marked by many years of exposure to sun, wind, and age', true),
      ('D', 'covered with sea water', false),
      ('E', 'hidden under a hat', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-019', m.id, w, 'sedang', 'What is the main idea of the first paragraph?', 'Paragraf pertama menggambarkan pekerjaan Mr. Hadi yang sepi namun penting, yaitu menjaga kapal nelayan tiba dengan selamat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Main Idea and Conclusion'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Mr. Hadi spent many years doing lonely but important work to keep boats safe.', true),
      ('B', 'Lighthouses are no longer needed on rocky coasts.', false),
      ('C', 'Mr. Hadi was afraid of the sea.', false),
      ('D', 'Hidden rocks are common in the northern region.', false),
      ('E', 'Fishing boats were rare around the lighthouse.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'TO1-LBE-020', m.id, w, 'sulit', 'Which conclusion can be drawn from the passage as a whole?', 'Kalimat terakhir teks menyatakan bahwa mesin dapat menyalakan lampu tetapi tidak dapat menggantikan perasaan diawasi oleh seseorang yang peduli.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Literasi dalam Bahasa Inggris' and m.nama = 'Main Idea and Conclusion'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Automatic systems are always dangerous.', false),
      ('B', 'Fishermen prefer machines to human keepers.', false),
      ('C', 'Mr. Hadi regretted his career choice.', false),
      ('D', 'Lighthouses should be replaced as soon as possible.', false),
      ('E', 'Human care has a value that technology cannot completely replace.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'TO1-LBE-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

-- ---------- Menempatkan 160 soal ke Try Out 1 (nomor urut per subtes) ----------
update soal
set try_out_id = t.id, nomor = v.nomor
from try_out t,
(values
  ('PU-IND-012', 1),
  ('PU-IND-022', 2),
  ('PU-IND-034', 3),
  ('PU-IND-006', 4),
  ('PU-IND-014', 5),
  ('PU-IND-017', 6),
  ('PU-IND-023', 7),
  ('PU-IND-007', 8),
  ('PU-IND-018', 9),
  ('PU-IND-025', 10),
  ('PU-DED-002', 11),
  ('PU-DED-025', 12),
  ('PU-DED-029', 13),
  ('PU-DED-006', 14),
  ('PU-DED-007', 15),
  ('PU-DED-020', 16),
  ('PU-DED-032', 17),
  ('PU-DED-018', 18),
  ('PU-DED-030', 19),
  ('PU-DED-033', 20),
  ('PU-KUA-002', 21),
  ('PU-KUA-007', 22),
  ('PU-KUA-012', 23),
  ('PU-KUA-005', 24),
  ('PU-KUA-016', 25),
  ('PU-KUA-018', 26),
  ('PU-KUA-021', 27),
  ('PU-KUA-015', 28),
  ('PU-KUA-028', 29),
  ('PU-KUA-031', 30),
  ('PPU-SIN-013', 1),
  ('PPU-SIN-014', 2),
  ('PPU-SIN-015', 3),
  ('PPU-SIN-016', 4),
  ('PPU-SIN-025', 5),
  ('PPU-BEN-012', 6),
  ('PPU-BEN-006', 7),
  ('PPU-BEN-015', 8),
  ('PPU-BEN-021', 9),
  ('PPU-BEN-011', 10),
  ('PPU-IDE-017', 11),
  ('PPU-IDE-018', 12),
  ('PPU-IDE-019', 13),
  ('PPU-IDE-020', 14),
  ('PPU-IDE-023', 15),
  ('PPU-KES-017', 16),
  ('PPU-KES-018', 17),
  ('PPU-KES-019', 18),
  ('PPU-KES-020', 19),
  ('PPU-KES-025', 20),
  ('PBM-SIM-017', 1),
  ('PBM-SIM-018', 2),
  ('PBM-SIM-019', 3),
  ('PBM-SIM-020', 4),
  ('PBM-SIM-022', 5),
  ('PBM-EFE-024', 6),
  ('PBM-EFE-007', 7),
  ('PBM-EFE-015', 8),
  ('PBM-EFE-022', 9),
  ('PBM-EFE-019', 10),
  ('PBM-EJA-015', 11),
  ('PBM-EJA-007', 12),
  ('PBM-EJA-011', 13),
  ('PBM-EJA-012', 14),
  ('PBM-EJA-022', 15),
  ('PBM-KEP-002', 16),
  ('PBM-KEP-009', 17),
  ('PBM-KEP-014', 18),
  ('PBM-KEP-019', 19),
  ('PBM-KEP-023', 20),
  ('PK-BIL-005', 1),
  ('DUMMY-003', 2),
  ('PK-BIL-012', 3),
  ('PK-BIL-023', 4),
  ('PK-BIL-025', 5),
  ('PK-GEO-002', 6),
  ('DUMMY-008', 7),
  ('PK-GEO-013', 8),
  ('PK-GEO-014', 9),
  ('DUMMY-009', 10),
  ('PK-ALJ-004', 11),
  ('PK-ALJ-013', 12),
  ('PK-ALJ-014', 13),
  ('PK-ALJ-019', 14),
  ('PK-ALJ-023', 15),
  ('PK-STA-003', 16),
  ('DUMMY-014', 17),
  ('PK-STA-009', 18),
  ('PK-STA-010', 19),
  ('PK-STA-021', 20),
  ('PM-BAS-005', 1),
  ('PM-BAS-006', 2),
  ('PM-BAS-007', 3),
  ('PM-BAS-008', 4),
  ('PM-PBH-013', 5),
  ('PM-PBH-017', 6),
  ('PM-PBH-018', 7),
  ('PM-PBH-019', 8),
  ('PM-AFP-013', 9),
  ('PM-AFP-015', 10),
  ('PM-AFP-017', 11),
  ('PM-AFP-019', 12),
  ('PM-GP-013', 13),
  ('PM-GP-015', 14),
  ('PM-GP-016', 15),
  ('PM-GP-018', 16),
  ('PM-SP-005', 17),
  ('PM-SP-006', 18),
  ('PM-SP-007', 19),
  ('PM-SP-008', 20),
  ('TO1-LBI-001', 1),
  ('TO1-LBI-002', 2),
  ('TO1-LBI-003', 3),
  ('TO1-LBI-004', 4),
  ('TO1-LBI-005', 5),
  ('TO1-LBI-006', 6),
  ('TO1-LBI-007', 7),
  ('TO1-LBI-008', 8),
  ('TO1-LBI-009', 9),
  ('TO1-LBI-010', 10),
  ('TO1-LBI-011', 11),
  ('TO1-LBI-012', 12),
  ('TO1-LBI-013', 13),
  ('TO1-LBI-014', 14),
  ('TO1-LBI-015', 15),
  ('TO1-LBI-016', 16),
  ('TO1-LBI-017', 17),
  ('TO1-LBI-018', 18),
  ('TO1-LBI-019', 19),
  ('TO1-LBI-020', 20),
  ('TO1-LBI-021', 21),
  ('TO1-LBI-022', 22),
  ('TO1-LBI-023', 23),
  ('TO1-LBI-024', 24),
  ('TO1-LBI-025', 25),
  ('TO1-LBI-026', 26),
  ('TO1-LBI-027', 27),
  ('TO1-LBI-028', 28),
  ('TO1-LBI-029', 29),
  ('TO1-LBI-030', 30),
  ('TO1-LBE-001', 1),
  ('TO1-LBE-002', 2),
  ('TO1-LBE-003', 3),
  ('TO1-LBE-004', 4),
  ('TO1-LBE-005', 5),
  ('TO1-LBE-006', 6),
  ('TO1-LBE-007', 7),
  ('TO1-LBE-008', 8),
  ('TO1-LBE-009', 9),
  ('TO1-LBE-010', 10),
  ('TO1-LBE-011', 11),
  ('TO1-LBE-012', 12),
  ('TO1-LBE-013', 13),
  ('TO1-LBE-014', 14),
  ('TO1-LBE-015', 15),
  ('TO1-LBE-016', 16),
  ('TO1-LBE-017', 17),
  ('TO1-LBE-018', 18),
  ('TO1-LBE-019', 19),
  ('TO1-LBE-020', 20)
) as v (kode, nomor)
where t.judul = 'Try Out 1'
  and soal.kode = v.kode
  and soal.try_out_id is null;

do $cek$
declare jumlah integer;
begin
  select count(*) into jumlah from soal where try_out_id = (select id from try_out where judul = 'Try Out 1');
  if jumlah <> 160 then
    raise exception 'Try Out 1 harus berisi 160 soal, ditemukan %', jumlah;
  end if;
end $cek$;

commit;

-- Pemeriksaan setelah dijalankan (opsional):
-- select s.urutan, s.nama, count(*) as soal
-- from soal q join materi m on m.id = q.materi_id join subtes s on s.id = m.subtes_id
-- where q.try_out_id = (select id from try_out where judul = 'Try Out 1')
-- group by s.urutan, s.nama order by s.urutan;
