-- =====================================================================
-- Soal latihan: Pengetahuan dan Pemahaman Umum (100 soal). Orisinal, ditulis untuk TembusPTN.
-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).
-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).
-- =====================================================================

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-SIN-001') then
    insert into wacana (isi) values ('(1) Bank sampah kini menjadi salah satu solusi untuk mengurangi timbunan limbah rumah tangga di perkotaan. (2) Warga memilah sampah anorganik, seperti botol plastik, kardus, dan kaleng, lalu menyetorkannya kepada pengelola. (3) Setiap setoran ditimbang dan dicatat sebagai tabungan atas nama penyetor. (4) Saldo tabungan tersebut dapat ditukar dengan uang tunai atau kebutuhan pokok. (5) Selain mengurangi beban tempat pembuangan akhir, program ini menumbuhkan kebiasaan memilah sampah sejak dari rumah. (6) Namun, keberhasilan bank sampah sangat bergantung pada konsistensi warga dan ketekunan pengelola. (7) Tanpa pendampingan yang berkelanjutan, semangat awal biasanya meredup dalam beberapa bulan. (8) Karena itu, banyak kelurahan mulai menggandeng sekolah dan komunitas pemuda untuk menjaga kesinambungan program.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-001', m.id, w, 'mudah', 'Kata timbunan pada kalimat (1) bersinonim dengan ….', 'Timbunan berarti sesuatu yang ditumpuk dalam jumlah banyak, sinonimnya tumpukan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kantong', false),
      ('B', 'gudang', false),
      ('C', 'tumpukan', true),
      ('D', 'sebaran', false),
      ('E', 'angka', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-002', m.id, w, 'mudah', 'Antonim kata anorganik pada kalimat (2) adalah ….', 'Anorganik adalah bahan yang tidak berasal dari makhluk hidup atau tidak dapat terurai alami; lawan katanya organik.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'organik', true),
      ('B', 'alami', false),
      ('C', 'hayati', false),
      ('D', 'nabati', false),
      ('E', 'kimiawi', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-003', m.id, w, 'sedang', 'Makna kata meredup pada kalimat (7) paling dekat dengan ….', 'Dalam konteks "semangat awal meredup", maknanya berkurang atau melemah secara bertahap.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menghilang seketika', false),
      ('B', 'membesar', false),
      ('C', 'berubah arah', false),
      ('D', 'memanas', false),
      ('E', 'melemah', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-004', m.id, w, 'sedang', 'Kata menggandeng pada kalimat (8) dalam konteks bacaan bermakna ….', 'Kelurahan yang "menggandeng sekolah dan komunitas pemuda" berarti mengajak keduanya bekerja sama, bukan memegang tangan secara harfiah.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'memegang tangan', false),
      ('B', 'mengikuti', false),
      ('C', 'menuntun', false),
      ('D', 'mengajak bekerja sama', true),
      ('E', 'mengawasi', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-SIN-005') then
    insert into wacana (isi) values ('(1) Hutan mangrove berperan penting sebagai benteng alami di wilayah pesisir. (2) Akar-akarnya yang kokoh dan rapat meredam hantaman ombak sehingga abrasi dapat ditekan. (3) Selain itu, kawasan mangrove menjadi tempat berkembang biak berbagai biota laut, seperti ikan, udang, dan kepiting. (4) Nelayan di sekitarnya pun memperoleh tangkapan yang lebih stabil. (5) Sayangnya, luas hutan mangrove terus menyusut karena alih fungsi lahan menjadi tambak dan permukiman. (6) Penebangan liar yang masih terjadi di beberapa daerah memperparah keadaan. (7) Upaya rehabilitasi dengan menanam bibit baru memang gencar dilakukan. (8) Akan tetapi, tanpa pengawasan yang ketat, bibit-bibit tersebut sulit tumbuh menjadi hutan yang lestari.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-005', m.id, w, 'mudah', 'Antonim kata kokoh pada kalimat (2) adalah ….', 'Kokoh berarti kuat dan tidak mudah rusak, lawan katanya rapuh.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'rapat', false),
      ('B', 'rapuh', true),
      ('C', 'keras', false),
      ('D', 'besar', false),
      ('E', 'tebal', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-006', m.id, w, 'sedang', 'Kata gencar pada kalimat (7) bermakna ….', 'Gencar berarti giat, bersemangat, dan intens. Upaya rehabilitasi "gencar dilakukan" berarti dilakukan dengan giat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'giat dan terus-menerus', true),
      ('B', 'terpaksa', false),
      ('C', 'sesekali', false),
      ('D', 'diam-diam', false),
      ('E', 'tertunda', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-007', m.id, w, 'sedang', 'Kata biota pada kalimat (3) bermakna paling dekat dengan ….', 'Biota berarti keseluruhan makhluk hidup (flora dan fauna) di suatu wilayah. Contoh pada kalimat: ikan, udang, kepiting.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'tumbuhan darat', false),
      ('B', 'sumber daya', false),
      ('C', 'benda mati', false),
      ('D', 'makhluk hidup', true),
      ('E', 'jenis makanan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-008', m.id, w, 'sedang', 'Kata yang dipakai dengan makna kiasan dalam bacaan tersebut adalah ….', 'Hutan mangrove tentu bukan benteng sebenarnya; kata benteng dipakai sebagai kiasan untuk pelindung wilayah pesisir. Kata lain dipakai dengan makna sebenarnya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'akar (kalimat 2)', false),
      ('B', 'benteng (kalimat 1)', true),
      ('C', 'berkembang biak (kalimat 3)', false),
      ('D', 'nelayan (kalimat 4)', false),
      ('E', 'bibit (kalimat 7)', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-SIN-009') then
    insert into wacana (isi) values ('(1) Angklung adalah alat musik tradisional dari bambu yang berasal dari tanah Sunda. (2) Setiap angklung hanya menghasilkan satu nada sehingga sebuah lagu baru dapat dimainkan jika banyak pemain bekerja sama. (3) Tidak ada pemain yang menonjol sendiri; semuanya harus tunduk pada irama bersama. (4) Karena itu, bermain angklung dinilai melatih kekompakan dan kedisiplinan. (5) Pada tahun 2010, UNESCO menetapkan angklung sebagai Warisan Budaya Takbenda dari Indonesia. (6) Pengakuan itu mendorong banyak sekolah memasukkan angklung ke dalam kegiatan ekstrakurikuler. (7) Di sejumlah negara, kelompok angklung dibentuk oleh komunitas perantau dan penggemar budaya Indonesia. (8) Dengan demikian, alat musik sederhana ini berfungsi pula sebagai duta budaya bangsa.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-009', m.id, w, 'mudah', 'Kata menonjol pada kalimat (3) bersinonim dengan ….', 'Menonjol berarti tampak lebih dibandingkan yang lain, sinonimnya mencolok.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menyendiri', false),
      ('B', 'tenggelam', false),
      ('C', 'berbunyi', false),
      ('D', 'memimpin', false),
      ('E', 'mencolok', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-010', m.id, w, 'sedang', 'Kata tunduk pada kalimat (3) dalam konteks bacaan paling dekat maknanya dengan ….', 'Pemain "tunduk pada irama bersama" berarti menaati atau mengikuti irama itu, bukan menundukkan kepala.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'menunduk', false),
      ('B', 'takut', false),
      ('C', 'menaati', true),
      ('D', 'menyerah', false),
      ('E', 'membungkuk', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-011', m.id, w, 'sulit', 'Kata duta pada kalimat (8) dalam bacaan tersebut dipakai dengan makna ….', 'Alat musik tidak dapat menjadi duta sebenarnya. Kata duta dipakai kiasan: angklung mewakili dan memperkenalkan budaya bangsa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pejabat pemerintah', false),
      ('B', 'penerjemah', false),
      ('C', 'pedagang', false),
      ('D', 'penghibur', false),
      ('E', 'perwakilan yang memperkenalkan', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-012', m.id, w, 'mudah', 'Antonim kata sederhana pada kalimat (8) adalah ….', 'Sederhana berarti tidak rumit; lawan katanya rumit.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'mudah', false),
      ('B', 'rumit', true),
      ('C', 'kecil', false),
      ('D', 'murah', false),
      ('E', 'biasa', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-SIN-013') then
    insert into wacana (isi) values ('(1) Banyak remaja menganggap tidur larut malam sebagai hal yang biasa. (2) Padahal, kurang tidur secara terus-menerus dapat mengganggu daya ingat dan konsentrasi. (3) Para ahli menyarankan remaja tidur delapan hingga sepuluh jam setiap malam. (4) Sayangnya, gawai yang dibawa ke tempat tidur sering kali merampas waktu istirahat tersebut. (5) Cahaya layar yang terang menghambat tubuh memproduksi hormon yang memicu rasa kantuk. (6) Akibatnya, remaja baru dapat terlelap setelah lewat tengah malam. (7) Untuk memulihkan pola tidur, mereka perlu menjauhkan gawai setidaknya satu jam sebelum tidur. (8) Kebiasaan sederhana ini terbukti membantu tubuh beristirahat lebih nyenyak.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-013', m.id, w, 'sedang', 'Makna kata merampas pada kalimat (4) dalam konteks bacaan adalah ….', 'Gawai yang "merampas waktu istirahat" berarti menyita atau mengambil waktu itu secara paksa.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'mengambil secara paksa', true),
      ('B', 'memberikan', false),
      ('C', 'meminjam', false),
      ('D', 'menyimpan', false),
      ('E', 'menawarkan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-014', m.id, w, 'mudah', 'Kata terlelap pada kalimat (6) bermakna ….', 'Terlelap berarti tertidur, biasanya dengan nyenyak.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'terbangun', false),
      ('B', 'berbaring', false),
      ('C', 'tertidur', true),
      ('D', 'bermimpi', false),
      ('E', 'mengantuk', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-015', m.id, w, 'sedang', 'Antonim kata nyenyak pada kalimat (8) adalah ….', 'Nyenyak berarti tidur dengan tenang dan tidak terganggu, lawan katanya gelisah (tidak tenang).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'lelap', false),
      ('B', 'tenang', false),
      ('C', 'singkat', false),
      ('D', 'gelisah', true),
      ('E', 'dalam', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-015'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-016', m.id, w, 'mudah', 'Kata gawai pada kalimat (4) bersinonim dengan ….', 'Gawai adalah padanan kata gadget, yaitu peranti elektronik kecil seperti ponsel dan tablet.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'televisi', false),
      ('B', 'peranti elektronik', true),
      ('C', 'kamera', false),
      ('D', 'kabel', false),
      ('E', 'kasur', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-016'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-SIN-017') then
    insert into wacana (isi) values ('(1) Pasar tradisional tetap bertahan di tengah menjamurnya toko modern dan belanja daring. (2) Pedagang dan pembeli di sana saling mengenal sehingga tawar-menawar terasa akrab. (3) Barang dagangan, terutama sayur dan ikan, umumnya lebih segar karena dipasok langsung dari petani dan nelayan sekitar. (4) Namun, kondisi pasar sering kali becek, sumpek, dan kurang tertata. (5) Pengelola pasar di beberapa kota mulai membenahi saluran air dan menata lapak pedagang berdasarkan jenis dagangan. (6) Penataan ini diharapkan menarik kembali pembeli muda yang cenderung enggan berbelanja di tempat yang kumuh. (7) Selain itu, pedagang dilatih menerima pembayaran nontunai agar tidak ketinggalan zaman. (8) Jika upaya ini berhasil, pasar tradisional akan tetap menjadi urat nadi ekonomi rakyat.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-017', m.id, w, 'sedang', 'Makna kata menjamurnya pada kalimat (1) adalah ….', 'Menjamur bermakna kiasan: bertambah banyak dan menyebar dengan cepat seperti jamur pada musim hujan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'tumbuh di tempat lembap', false),
      ('B', 'membusuk', false),
      ('C', 'bertambah banyak dengan cepat', true),
      ('D', 'berkurang', false),
      ('E', 'dibangun di pasar', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-018', m.id, w, 'sedang', 'Kata sumpek pada kalimat (4) bermakna ….', 'Sumpek berarti sesak dan kurang udara, sering dipakai untuk ruangan yang penuh dan pengap.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'luas', false),
      ('B', 'sepi', false),
      ('C', 'gelap', false),
      ('D', 'kotor', false),
      ('E', 'sesak dan pengap', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-019', m.id, w, 'mudah', 'Kata kumuh pada kalimat (6) bersinonim dengan ….', 'Kumuh berarti kotor dan tidak terawat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kotor', true),
      ('B', 'rapi', false),
      ('C', 'ramai', false),
      ('D', 'sempit', false),
      ('E', 'gelap', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-SIN-020', m.id, w, 'sulit', 'Ungkapan urat nadi pada kalimat (8) bermakna ….', 'Urat nadi dalam kalimat dipakai kiasan: bagian yang sangat penting dan menopang kehidupan ekonomi rakyat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pembuluh darah', false),
      ('B', 'bagian kecil', false),
      ('C', 'jalur transportasi', false),
      ('D', 'penopang utama', true),
      ('E', 'pekerja pasar', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-SIN-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-SIN-021', m.id, 'mudah', 'Kata yang bersinonim dengan gigih adalah ….', 'Gigih berarti keras dan tekun dalam berusaha, sinonimnya ulet.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'malas', false),
  ('B', 'mudah menyerah', false),
  ('C', 'ragu-ragu', false),
  ('D', 'ulet', true),
  ('E', 'sombong', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-SIN-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-SIN-022', m.id, 'sedang', 'Antonim kata fasih adalah ….', 'Fasih berarti lancar dan jelas dalam berbicara, lawannya terbata-bata (tersendat-sendat).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'terbata-bata', true),
  ('B', 'lancar', false),
  ('C', 'cakap', false),
  ('D', 'mahir', false),
  ('E', 'runtut', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-SIN-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-SIN-023', m.id, 'sulit', 'Dalam kalimat "Kebijakan baru itu menuai kritik tajam dari para pengamat", kata menuai bermakna ….', 'Menuai di sini dipakai kiasan: memperoleh sesuatu sebagai hasil atau akibat dari tindakan, yaitu kritik tajam.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'memotong padi', false),
  ('B', 'memperoleh (sebagai akibat)', true),
  ('C', 'menanam', false),
  ('D', 'mencabut', false),
  ('E', 'membagikan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-SIN-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-SIN-024', m.id, 'mudah', 'Kata yang maknanya lebih luas daripada mawar adalah ….', 'Mawar adalah salah satu jenis bunga, sehingga bunga bermakna lebih luas (hiponim mawar).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'merah', false),
  ('B', 'harum', false),
  ('C', 'bunga', true),
  ('D', 'taman', false),
  ('E', 'duri', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-SIN-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-SIN-025', m.id, 'sedang', 'Pasangan kata berikut yang BERSINONIM adalah ….', 'Tangkas dan cekatan sama-sama bermakna gesit. Pasangan lain berlawanan makna (antonim).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Sinonim dan Makna Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'pandai – bodoh', false),
  ('B', 'rajin – malas', false),
  ('C', 'cantik – buruk', false),
  ('D', 'besar – kecil', false),
  ('E', 'tangkas – cekatan', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-SIN-025'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-001', m.id, 'mudah', 'Kata berimbuhan yang penulisannya BAKU adalah ….', 'Bentuk dasar pengaruh berawal huruf p. Dengan awalan me-, huruf p luluh sehingga menjadi memengaruhi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mempengaruhi', false),
  ('B', 'memengaruhi', true),
  ('C', 'memperngaruhi', false),
  ('D', 'memengaruhkan', false),
  ('E', 'mempengarui', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-001'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-002', m.id, 'mudah', 'Bentuk kata yang tepat dari awalan me- dan kata dasar sapu adalah ….', 'Awalan me- bertemu huruf s, huruf s luluh dan menjadi ny-: menyapu.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mensapu', false),
  ('B', 'mengsapu', false),
  ('C', 'memsapu', false),
  ('D', 'menyapu', true),
  ('E', 'mesapu', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-002'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-003', m.id, 'mudah', 'Bentuk kata yang tepat dari awalan me- dan kata dasar cat (bersuku satu) adalah ….', 'Kata dasar bersuku satu diberi awalan me- menjadi menge-: mengecat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mengecat', true),
  ('B', 'mencat', false),
  ('C', 'mengcat', false),
  ('D', 'menyecat', false),
  ('E', 'memcat', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-003'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-004', m.id, 'sedang', 'Pelaku yang menerjemahkan teks dari satu bahasa ke bahasa lain disebut ….', 'Awalan pe- bertemu kata dasar terjemah (huruf t), huruf t luluh dan menjadi pen-: penerjemah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'pemterjemah', false),
  ('B', 'penterjemah', false),
  ('C', 'pengterjemah', false),
  ('D', 'petrejemah', false),
  ('E', 'penerjemah', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-004'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-005', m.id, 'sedang', 'Makna imbuhan ter- pada kata terjatuh dalam kalimat "Adik terjatuh saat berlari di halaman" adalah ….', 'Terjatuh berarti jatuh tanpa disengaja. Imbuhan ter- di sini menyatakan perbuatan yang tidak disengaja.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'paling', false),
  ('B', 'sudah dalam keadaan', false),
  ('C', 'tidak sengaja', true),
  ('D', 'dapat atau mampu', false),
  ('E', 'sedang', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-005'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-006', m.id, 'sedang', 'Imbuhan ber- yang bermakna "memakai" terdapat pada kalimat ….', 'Berkerudung berarti memakai kerudung. Pada pilihan lain, ber- bermakna melakukan (berlari, berbicara, berkebun, berdiskusi).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Para siswa berlari mengelilingi lapangan.', false),
  ('B', 'Kakak berbicara dengan nada pelan.', false),
  ('C', 'Ayah berkebun setiap hari Minggu.', false),
  ('D', 'Ibu berkerudung biru saat menghadiri pesta.', true),
  ('E', 'Kami berdiskusi hingga larut malam.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-006'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-007', m.id, 'sedang', 'Imbuhan ke-an yang bermakna "mengalami atau tertimpa sesuatu" terdapat pada kalimat ….', 'Kedinginan berarti terkena atau mengalami dingin, seperti kehujanan. Pada pilihan lain, ke-an membentuk kata benda abstrak (kesehatan, ketekunan, kebersihan, keindahan).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kesehatan masyarakat perlu dijaga.', false),
  ('B', 'Para penumpang kedinginan karena pendingin ruangan terlalu rendah.', true),
  ('C', 'Ketekunan siswa itu patut dicontoh.', false),
  ('D', 'Kebersihan kelas dinilai setiap pekan.', false),
  ('E', 'Keindahan alam Raja Ampat mendunia.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-007'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-008', m.id, 'sedang', 'Bentuk ulang yang bermakna "menyerupai" terdapat pada kalimat ….', 'Kuda-kudaan berarti mainan yang menyerupai kuda. Anak-anak bermakna jamak, buah-buahan bermakna aneka buah, bolak-balik bermakna berulang, dan berdekat-dekatan bermakna saling berdekatan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Anak-anak bermain di taman.', false),
  ('B', 'Ibu membeli buah-buahan di pasar.', false),
  ('C', 'Mereka berjalan bolak-balik.', false),
  ('D', 'Para tamu duduk berdekat-dekatan.', false),
  ('E', 'Adik bermain kuda-kudaan di halaman.', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-008'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-009', m.id, 'sedang', 'Bentuk kata yang tepat dari awalan me- dan kata dasar prediksi adalah ….', 'Huruf p pada kata dasar yang berawal gugus konsonan (pr-) tidak luluh, sehingga menjadi memprediksi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'memprediksi', true),
  ('B', 'memrediksi', false),
  ('C', 'memediksi', false),
  ('D', 'menprediksi', false),
  ('E', 'mempredisi', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-009'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-010', m.id, 'mudah', 'Kata berimbuhan berikut yang menyatakan PELAKU adalah ….', 'Penulis berarti orang yang menulis (pelaku). Kata lain menyatakan proses atau hasil (pelatihan, pengertian, penghargaan) dan hal yang dipandang (pemandangan).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'pelatihan', false),
  ('B', 'pemandangan', false),
  ('C', 'penulis', true),
  ('D', 'pengertian', false),
  ('E', 'penghargaan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-010'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-011', m.id, 'sulit', 'Pasangan kata dasar dan bentuk berawalan me- yang TIDAK tepat adalah ….', 'Kata dasar bersuku satu mendapat awalan menge-, sehingga bentuk yang tepat mengebom, bukan membom.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'gigit – menggigit', false),
  ('B', 'pukul – memukul', false),
  ('C', 'tangkap – menangkap', false),
  ('D', 'kupas – mengupas', false),
  ('E', 'bom – membom', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-011'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-012', m.id, 'mudah', 'Kata yang termasuk kata majemuk adalah ….', 'Kereta api terbentuk dari dua kata yang bersama-sama membentuk satu makna baru (kata majemuk). Pilihan lain adalah kata ulang atau kata berimbuhan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kereta api', true),
  ('B', 'makan-makan', false),
  ('C', 'pengertian', false),
  ('D', 'berlari', false),
  ('E', 'kehujanan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-012'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-013', m.id, 'sedang', 'Imbuhan memper- pada kata memperpanjang dalam kalimat "Panitia memperpanjang masa pendaftaran" bermakna ….', 'Memperpanjang berarti membuat sesuatu menjadi lebih panjang. Awalan memper- sering bermakna membuat menjadi lebih (memperbesar, memperkuat).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'melakukan', false),
  ('B', 'menyerupai', false),
  ('C', 'membuat menjadi lebih', true),
  ('D', 'menjadi', false),
  ('E', 'memiliki', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-013'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-014', m.id, 'sulit', 'Penulisan kata gabungan berimbuhan yang tepat adalah ….', 'Kata gabungan yang mendapat awalan sekaligus akhiran ditulis serangkai: dipertanggungjawabkan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'di pertanggungjawabkan', false),
  ('B', 'dipertanggungjawabkan', true),
  ('C', 'dipertanggung jawabkan', false),
  ('D', 'di-pertanggungjawabkan', false),
  ('E', 'dipertanggung-jawabkan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-014'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-015', m.id, 'sedang', 'Bentuk ulang sayur-mayur tergolong reduplikasi ….', 'Sayur-mayur mengulang seluruh kata dengan perubahan bunyi vokal pada bagian ulang (sayur → mayur), sehingga tergolong dwilingga salin suara.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'dwipurwa (suku awal diulang)', false),
  ('B', 'dwilingga murni', false),
  ('C', 'berimbuhan', false),
  ('D', 'dwilingga salin suara (berubah bunyi)', true),
  ('E', 'dwiwasana (suku akhir diulang)', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-015'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-016', m.id, 'mudah', 'Bentuk baku untuk melengkapi kalimat "Warga di pegunungan itu ... air dari sumber mata air alami" adalah ….', 'Kata dasar konsumsi berawal huruf k. Dalam bentuk baku, huruf k luluh: mengonsumsi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'mengkonsumsi', false),
  ('B', 'memkonsumsi', false),
  ('C', 'mengonsumsi', true),
  ('D', 'menkonsumsi', false),
  ('E', 'mengkonsumsikan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-016'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-017', m.id, 'sulit', 'Imbuhan se- yang bermakna "seluruh" terdapat pada kalimat ….', 'Seisi kampung berarti seluruh isi kampung. Sekelas berarti satu kelas, sebuah berarti satu buah, sesekali berarti kadang-kadang, secepat kilat berarti sama cepatnya dengan kilat.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kami duduk sekelas dengan juara olimpiade matematika.', false),
  ('B', 'Ia membeli sebuah buku di toko itu.', false),
  ('C', 'Mereka bertemu sesekali di perpustakaan.', false),
  ('D', 'Pelari itu berlari secepat kilat.', false),
  ('E', 'Seisi kampung ikut bergotong royong.', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-017'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-018', m.id, 'sedang', 'Penulisan di- yang benar terdapat pada kalimat ….', 'Di- sebagai awalan ditulis serangkai dengan kata kerja (diletakkan), sedangkan di sebagai kata depan ditulis terpisah dari kata yang mengikutinya (di atas).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Buku itu diatas meja.', false),
  ('B', 'Buku itu diletakkan di atas meja.', true),
  ('C', 'Buku itu di letakkan diatas meja.', false),
  ('D', 'Buku itu diletakkan diatas meja.', false),
  ('E', 'Buku itu di letakkan di atas meja.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-018'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-019', m.id, 'sedang', 'Dalam kalimat "Dialah siswa terbaik di sekolah ini", kata terbaik termasuk kelas kata ….', 'Terbaik terbentuk dari ter- + baik dan menyatakan tingkat paling. Kata ini menerangkan sifat siswa sehingga tergolong kata sifat (adjektiva).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'kata kerja', false),
  ('B', 'kata benda', false),
  ('C', 'kata ganti', false),
  ('D', 'kata sifat', true),
  ('E', 'kata bilangan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-019'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-020', m.id, 'sedang', 'Kata dasar dari penyelenggaraan adalah ….', 'Penyelenggaraan = pe-an + selenggara. Huruf s pada selenggara luluh menjadi ny- (penyelenggara-an).'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'selenggara', true),
  ('B', 'enggara', false),
  ('C', 'lenggara', false),
  ('D', 'selenggaraan', false),
  ('E', 'penyelenggara', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-020'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-021', m.id, 'sedang', 'Kata berimbuhan pe-an yang bermakna "tempat" adalah ….', 'Pelabuhan berarti tempat kapal berlabuh. Pelatihan, penulisan, dan pengamatan menyatakan proses; perubahan menyatakan hasil atau hal berubah.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'pelatihan', false),
  ('B', 'pelabuhan', true),
  ('C', 'penulisan', false),
  ('D', 'pengamatan', false),
  ('E', 'perubahan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-022', m.id, 'sedang', 'Imbuhan me-kan yang bermakna "melakukan sesuatu untuk orang lain" terdapat pada kalimat ….', 'Membelikan berarti membeli sesuatu untuk orang lain (adik). Imbuhan me-kan pada kata lain bermakna menyebabkan atau menjadikan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Pak Guru menjelaskan rumus itu kepada siswa.', false),
  ('B', 'Dia memperbaiki sepeda motornya sendiri.', false),
  ('C', 'Ia menjatuhkan gelas di dapur.', false),
  ('D', 'Andi menyelesaikan tugasnya.', false),
  ('E', 'Ibu membelikan adik sepasang sepatu baru.', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-023', m.id, 'sulit', 'Bentuk ulang yang bermakna "saling" terdapat pada kalimat ….', 'Tolong-menolong berarti saling menolong. Berlari-lari dan memukul-mukul bermakna perbuatan berulang, buku-buku bermakna jamak, dan bunga-bungaan bermakna aneka bunga.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Warga desa bergotong royong dan tolong-menolong membangun jembatan.', true),
  ('B', 'Anak-anak berlari-lari di halaman.', false),
  ('C', 'Ia membeli buku-buku baru.', false),
  ('D', 'Dia memukul-mukul meja dengan kesal.', false),
  ('E', 'Mereka menanam bunga-bungaan di taman.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-024', m.id, 'mudah', 'Penulisan bentuk ulang yang benar adalah ….', 'Bentuk ulang ditulis lengkap dengan tanda hubung tanpa spasi: anak-anak. Angka 2 tidak dipakai pada tulisan resmi.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'hati2', false),
  ('B', 'berjalan jalan', false),
  ('C', 'tanda tanda', false),
  ('D', 'anak-anak', true),
  ('E', 'anak - anak', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-BEN-025', m.id, 'sulit', 'Perbedaan makna antara penjual dan penjualan adalah ….', 'Penjual (pe- + jual) bermakna orang yang menjual. Penjualan (pe-an + jual) bermakna proses atau hal menjual.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Bentuk Kata'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'keduanya bermakna pelaku', false),
  ('B', 'penjual bermakna proses, penjualan bermakna pelaku', false),
  ('C', 'penjual bermakna pelaku, penjualan bermakna proses atau hal menjual', true),
  ('D', 'keduanya bermakna proses', false),
  ('E', 'penjual bermakna tempat, penjualan bermakna alat', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-BEN-025'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-IDE-001') then
    insert into wacana (isi) values ('Paragraf 1: (1) Pemasangan panel surya di atap rumah semakin diminati oleh rumah tangga perkotaan. (2) Listrik yang dihasilkan panel dapat dipakai langsung untuk kebutuhan rumah sehingga tagihan listrik bulanan menurun. (3) Kelebihan daya pada siang hari bahkan dapat disimpan dalam baterai untuk dipakai pada malam hari. (4) Dengan demikian, pemilik rumah tidak lagi sepenuhnya bergantung pada jaringan listrik negara.
Paragraf 2: (5) Meskipun demikian, biaya awal pemasangan panel surya masih tergolong tinggi bagi sebagian besar keluarga. (6) Harga panel, inverter, dan baterai harus dibayar di muka, sedangkan penghematan baru terasa setelah beberapa tahun. (7) Karena itu, sejumlah penyedia jasa menawarkan skema cicilan untuk meringankan beban pemasang. (8) Tanpa dukungan kebijakan yang tepat, pemanfaatan energi surya di rumah tangga akan sulit berkembang secara luas.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-001', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan tersebut adalah ….', 'Paragraf pertama menjelaskan peminatan panel surya atap beserta manfaatnya (tagihan turun, daya dapat disimpan, tidak sepenuhnya bergantung pada jaringan listrik). Pilihan lain terlalu sempit atau tidak disebut dalam bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Panel surya hanya cocok dipasang pada rumah berukuran besar.', false),
      ('B', 'Listrik dari panel surya selalu lebih murah daripada listrik negara.', false),
      ('C', 'Baterai merupakan komponen terpenting pada panel surya.', false),
      ('D', 'Penghuni rumah perkotaan wajib memasang panel surya.', false),
      ('E', 'Panel surya atap diminati karena menekan tagihan listrik dan mengurangi ketergantungan pada jaringan listrik negara.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-002', m.id, w, 'mudah', 'Kalimat utama paragraf kedua terdapat pada kalimat ….', 'Kalimat (5) memuat gagasan utama paragraf kedua, yaitu biaya awal yang tinggi. Kalimat (6) sampai (8) menjelaskan dan menindaklanjutinya. Kalimat (4) milik paragraf pertama.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '(4)', false),
      ('B', '(5)', true),
      ('C', '(6)', false),
      ('D', '(7)', false),
      ('E', '(8)', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-003', m.id, w, 'sedang', 'Hubungan antara paragraf pertama dan paragraf kedua pada bacaan tersebut adalah ….', 'Paragraf pertama menyampaikan manfaat panel surya, paragraf kedua menyampaikan kendala biaya yang diawali "Meskipun demikian". Hubungan keduanya adalah pertentangan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'sebab-akibat', false),
      ('B', 'persamaan', false),
      ('C', 'urutan waktu', false),
      ('D', 'pertentangan antara manfaat dan kendala', true),
      ('E', 'perincian', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-004', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tersebut adalah ….', 'Bacaan memuat manfaat (paragraf 1) dan tantangan biaya serta kebijakan (paragraf 2). Pilihan A merangkum keduanya. Pilihan lain berlebihan atau tidak sesuai bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Panel surya atap menjanjikan penghematan, tetapi biaya awal yang tinggi dan dukungan kebijakan menjadi tantangan pemanfaatannya.', true),
      ('B', 'Panel surya sebaiknya tidak dipasang karena biaya awalnya terlalu mahal.', false),
      ('C', 'Skema cicilan sepenuhnya menyelesaikan masalah biaya panel surya.', false),
      ('D', 'Pemerintah wajib menanggung seluruh biaya pemasangan panel surya.', false),
      ('E', 'Rumah tangga perkotaan sudah tidak memerlukan jaringan listrik negara.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-IDE-005') then
    insert into wacana (isi) values ('Paragraf 1: (1) Literasi keuangan penting dimiliki sejak usia remaja. (2) Remaja yang memahami cara mengatur uang saku cenderung lebih bijak dalam menentukan prioritas pengeluaran. (3) Mereka juga lebih mudah menyisihkan sebagian uang untuk ditabung. (4) Kebiasaan baik ini akan terbawa hingga dewasa.
Paragraf 2: (5) Sayangnya, tidak semua remaja memperoleh pendidikan keuangan di sekolah. (6) Kurikulum umumnya lebih menitikberatkan pada pengetahuan akademik. (7) Akibatnya, banyak remaja belajar mengelola uang secara otodidak dan rentan tergoda belanja daring. (8) Oleh sebab itu, sekolah perlu menyisipkan materi pengelolaan keuangan ke dalam kegiatan belajar.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-005', m.id, w, 'mudah', 'Kalimat utama paragraf pertama terdapat pada kalimat ….', 'Kalimat (1) menyatakan gagasan umum: literasi keuangan penting sejak remaja. Kalimat (2) sampai (4) menjelaskan alasannya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '(4)', false),
      ('B', '(3)', false),
      ('C', '(1)', true),
      ('D', '(2)', false),
      ('E', 'tidak ada kalimat utama', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-006', m.id, w, 'sedang', 'Gagasan utama paragraf kedua adalah ….', 'Paragraf kedua menyatakan masalah (tidak semua remaja mendapat pendidikan keuangan), akibatnya, dan saran agar sekolah menyisipkan materinya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kurikulum sekolah terlalu menekankan pelajaran akademik sehingga siswa kewalahan.', false),
      ('B', 'Banyak remaja tidak memperoleh pendidikan keuangan di sekolah sehingga sekolah perlu menyisipkannya dalam pembelajaran.', true),
      ('C', 'Belanja daring merupakan penyebab utama remaja boros.', false),
      ('D', 'Remaja lebih baik belajar mengelola uang secara otodidak.', false),
      ('E', 'Pendidikan keuangan sudah tersedia di sebagian besar sekolah.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-007', m.id, w, 'sedang', 'Hubungan antara kalimat (6) dan kalimat (7) adalah ….', 'Kurikulum yang lebih menitikberatkan pelajaran akademik (6) menyebabkan remaja belajar mengelola uang secara otodidak (7). Kata "Akibatnya" menandai hubungan sebab-akibat.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pertentangan', false),
      ('B', 'perbandingan', false),
      ('C', 'contoh', false),
      ('D', 'syarat', false),
      ('E', 'sebab-akibat', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-008', m.id, w, 'sedang', 'Kata sayangnya pada kalimat (5) menandai hubungan antarparagraf berupa ….', 'Paragraf pertama berisi kondisi ideal (pentingnya literasi keuangan), sedangkan paragraf kedua menyatakan kenyataan yang tidak sesuai harapan. Kata sayangnya menandai pertentangan itu.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'pertentangan antara kondisi ideal dan kenyataan', true),
      ('B', 'penambahan informasi sejenis', false),
      ('C', 'urutan waktu', false),
      ('D', 'pemberian contoh', false),
      ('E', 'simpulan', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-IDE-009') then
    insert into wacana (isi) values ('Paragraf 1: (1) Desa wisata menjadi cara baru bagi masyarakat desa untuk memperoleh penghasilan tambahan. (2) Wisatawan diajak menginap di rumah warga, mencicipi masakan lokal, dan mengikuti kegiatan bertani atau membuat kerajinan. (3) Pengalaman langsung semacam ini sulit ditemukan di tempat wisata komersial. (4) Warga pun mendapat ruang untuk memperkenalkan budaya dan hasil bumi mereka.
Paragraf 2: (5) Di sisi lain, kehadiran wisatawan yang terlalu banyak dapat mengubah kehidupan desa. (6) Sampah meningkat, jalan desa menjadi macet, dan kegiatan adat kadang dijadikan tontonan semata. (7) Beberapa desa mengatasinya dengan membatasi jumlah pengunjung setiap hari. (8) Pembatasan ini terbukti menjaga kenyamanan warga sekaligus kelestarian lingkungan.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-009', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan mengenai desa wisata tersebut adalah ….', 'Paragraf pertama menjelaskan desa wisata sebagai sumber penghasilan tambahan beserta kegiatan dan manfaat budayanya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Wisatawan lebih menyukai desa daripada kota.', false),
      ('B', 'Warga desa wajib menyediakan penginapan.', false),
      ('C', 'Kerajinan desa lebih bagus daripada produk pabrik.', false),
      ('D', 'Desa wisata menjadi sumber penghasilan tambahan dan sarana memperkenalkan budaya warga.', true),
      ('E', 'Tempat wisata komersial akan segera ditutup.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-010', m.id, w, 'mudah', 'Kalimat penjelas yang berisi contoh kegiatan wisatawan di desa terdapat pada kalimat ….', 'Kalimat (2) menyebutkan kegiatan yang dilakukan wisatawan: menginap, mencicipi masakan lokal, bertani, dan membuat kerajinan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', '(1)', false),
      ('B', '(3)', false),
      ('C', '(2)', true),
      ('D', '(4)', false),
      ('E', '(8)', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-011', m.id, w, 'sulit', 'Pola pengembangan paragraf kedua adalah ….', 'Kalimat (5) dan (6) menyebutkan masalah akibat wisatawan yang terlalu banyak. Kalimat (7) dan (8) menyebutkan pemecahannya, yaitu pembatasan pengunjung.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'induktif', false),
      ('B', 'deskriptif', false),
      ('C', 'perbandingan', false),
      ('D', 'masalah dan pemecahan', true),
      ('E', 'kronologis', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-012', m.id, w, 'sedang', 'Simpulan yang paling tepat dari bacaan mengenai desa wisata tersebut adalah ….', 'Paragraf pertama menyampaikan manfaat, paragraf kedua dampak negatif dan cara mengatasinya. Simpulan yang mencakup keduanya adalah C.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Desa wisata sebaiknya tidak dikembangkan.', false),
      ('B', 'Wisatawan tidak boleh menginap di rumah warga.', false),
      ('C', 'Desa wisata menguntungkan warga, tetapi perlu dikelola agar dampak negatifnya terkendali.', true),
      ('D', 'Pembatasan pengunjung menurunkan penghasilan warga desa.', false),
      ('E', 'Kegiatan adat sebaiknya dihentikan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-IDE-013') then
    insert into wacana (isi) values ('Paragraf 1: (1) Penggunaan transportasi umum perlu terus didorong di kota-kota besar. (2) Satu bus yang terisi penuh dapat menggantikan puluhan kendaraan pribadi di jalan. (3) Dengan berkurangnya kendaraan pribadi, kemacetan dan polusi udara dapat ditekan. (4) Warga juga dapat menghemat biaya perjalanan harian.
Paragraf 2: (5) Namun, minat masyarakat untuk beralih ke transportasi umum belum tinggi. (6) Banyak yang menilai jadwal kedatangan kendaraan tidak pasti. (7) Sebagian lainnya mengeluhkan jarak halte yang jauh dari permukiman. (8) Pemerintah kota perlu memperbaiki ketepatan waktu dan memperluas jangkauan layanan agar masyarakat mau beralih.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-013', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan mengenai transportasi umum tersebut adalah ….', 'Paragraf pertama menyebutkan perlunya mendorong transportasi umum dan manfaat-manfaatnya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kendaraan pribadi sebaiknya dilarang di kota besar.', false),
      ('B', 'Transportasi umum perlu didorong karena mengurangi kemacetan, polusi, dan biaya perjalanan.', true),
      ('C', 'Bus lebih nyaman daripada kendaraan pribadi.', false),
      ('D', 'Polusi udara hanya disebabkan oleh kendaraan pribadi.', false),
      ('E', 'Harga tiket transportasi umum sudah murah.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-014', m.id, w, 'sedang', 'Kalimat (6) dan (7) berfungsi sebagai ….', 'Kalimat (6) dan (7) menyebutkan jadwal tidak pasti dan halte jauh, yaitu alasan mengapa minat masyarakat belum tinggi seperti dinyatakan kalimat (5).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'penjelas alasan rendahnya minat beralih ke transportasi umum', true),
      ('B', 'contoh keberhasilan transportasi umum', false),
      ('C', 'kalimat utama paragraf kedua', false),
      ('D', 'simpulan seluruh bacaan', false),
      ('E', 'pertentangan terhadap kalimat (5)', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-015', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan mengenai transportasi umum tersebut adalah ….', 'Manfaat disebutkan di paragraf pertama dan hambatan serta perbaikan di paragraf kedua. Simpulan yang mencakup keduanya adalah E.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Warga lebih baik tetap memakai kendaraan pribadi.', false),
      ('B', 'Transportasi umum tidak memberikan manfaat bagi kota.', false),
      ('C', 'Pemerintah kota tidak perlu memperluas layanan.', false),
      ('D', 'Halte transportasi umum harus dipindahkan ke permukiman pribadi.', false),
      ('E', 'Transportasi umum bermanfaat, tetapi agar peminatnya meningkat, ketepatan waktu dan jangkauan layanan perlu diperbaiki.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-015'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-016', m.id, w, 'sedang', 'Judul yang paling tepat untuk bacaan tersebut adalah ….', 'Bacaan membahas manfaat transportasi umum dan upaya agar warga mau beralih. Judul A mencakup keduanya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Mendorong Warga Beralih ke Transportasi Umum', true),
      ('B', 'Sejarah Perkembangan Bus Kota', false),
      ('C', 'Mengatasi Kemacetan dengan Pembangunan Jalan Tol', false),
      ('D', 'Keluhan Pengguna Kendaraan Pribadi', false),
      ('E', 'Hemat Biaya dengan Sepeda Motor', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-016'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-IDE-017') then
    insert into wacana (isi) values ('Paragraf 1: (1) Pelaku usaha mikro kini memanfaatkan media sosial untuk memasarkan produknya. (2) Foto produk yang menarik dan ulasan pelanggan dapat meningkatkan kepercayaan calon pembeli. (3) Pesanan pun datang dari luar kota tanpa pelaku usaha harus membuka toko baru. (4) Kemudahan ini membuat banyak usaha rumahan mampu bertahan, bahkan berkembang.
Paragraf 2: (5) Meski begitu, persaingan di media sosial sangat ketat. (6) Produk yang sama dijual oleh banyak penjual dengan harga yang saling menekan. (7) Pelaku usaha yang hanya mengandalkan harga murah akan kesulitan menjaga keuntungan. (8) Karena itu, diferensiasi produk dan pelayanan yang baik menjadi kunci untuk menang dalam persaingan.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-017', m.id, w, 'mudah', 'Ide pokok paragraf pertama bacaan mengenai usaha mikro tersebut adalah ….', 'Paragraf pertama menjelaskan pemanfaatan media sosial oleh pelaku usaha mikro beserta manfaatnya (kepercayaan pembeli, pesanan luar kota).'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Usaha rumahan wajib membuka toko di setiap kota.', false),
      ('B', 'Foto produk lebih penting daripada kualitas produk.', false),
      ('C', 'Media sosial menggantikan seluruh toko fisik.', false),
      ('D', 'Ulasan pelanggan selalu bernilai positif.', false),
      ('E', 'Pelaku usaha mikro memanfaatkan media sosial untuk memasarkan produk dan memperluas pasar.', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-018', m.id, w, 'sedang', 'Kalimat (8) berfungsi sebagai ….', 'Kalimat (8) diawali "Karena itu" dan memuat kunci menghadapi persaingan, sehingga berfungsi sebagai saran sekaligus simpulan paragraf kedua.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'contoh persaingan di media sosial', false),
      ('B', 'pertentangan terhadap kalimat (7)', false),
      ('C', 'saran sebagai penutup yang menyimpulkan paragraf kedua', true),
      ('D', 'penjelas kalimat (1)', false),
      ('E', 'awal pembahasan baru', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-019', m.id, w, 'sulit', 'Kalimat (4) pada bacaan tersebut berfungsi sebagai ….', 'Kalimat (4) diawali "Kemudahan ini" yang merujuk pada manfaat sebelumnya, sehingga berfungsi menyimpulkan manfaat pemanfaatan media sosial bagi usaha rumahan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'kalimat utama paragraf pertama', false),
      ('B', 'penutup yang menyimpulkan manfaat pemanfaatan media sosial', true),
      ('C', 'pertentangan terhadap kalimat (1)', false),
      ('D', 'contoh produk yang laris', false),
      ('E', 'penghubung ke paragraf pertama', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-IDE-020', m.id, w, 'sedang', 'Gagasan utama paragraf kedua bacaan mengenai usaha mikro tersebut adalah ….', 'Paragraf kedua menyatakan persaingan ketat dan menyarankan diferensiasi produk serta pelayanan yang baik.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Harga murah adalah satu-satunya cara memenangkan persaingan.', false),
      ('B', 'Media sosial tidak layak digunakan untuk berdagang.', false),
      ('C', 'Banyak penjual lebih memilih toko fisik.', false),
      ('D', 'Persaingan di media sosial ketat sehingga pelaku usaha perlu membedakan produk dan pelayanannya.', true),
      ('E', 'Ulasan pelanggan tidak berpengaruh pada penjualan.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-IDE-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-IDE-021', m.id, 'mudah', 'Perhatikan paragraf berikut.
(1) Membaca buku sebelum tidur memberi banyak manfaat. (2) Kegiatan ini membantu pikiran menjadi lebih tenang. (3) Perpustakaan daerah buka setiap hari kerja. (4) Selain itu, kebiasaan ini memperkaya kosakata.
Kalimat yang TIDAK mendukung ide pokok paragraf tersebut adalah kalimat ….', 'Ide pokok paragraf adalah manfaat membaca sebelum tidur. Kalimat (3) membahas jam buka perpustakaan sehingga tidak mendukung ide pokok.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(1)', false),
  ('B', '(2)', false),
  ('C', '(3)', true),
  ('D', '(4)', false),
  ('E', 'tidak ada', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-IDE-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-IDE-022', m.id, 'sedang', 'Perhatikan paragraf berikut.
(1) Pagi tadi harga cabai naik. (2) Siang harinya harga bawang ikut naik. (3) Menjelang sore, harga telur pun melonjak. (4) Jadi, harga kebutuhan pokok sedang bergerak naik.
Berdasarkan letak kalimat utamanya, paragraf tersebut tergolong paragraf ….', 'Kalimat utama (4) berada di akhir paragraf dan didahului penjelasan khusus (1)–(3). Letak kalimat utama di akhir menandai paragraf induktif.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'deduktif', false),
  ('B', 'campuran', false),
  ('C', 'deskriptif', false),
  ('D', 'induktif', true),
  ('E', 'naratif', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-IDE-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-IDE-023', m.id, 'sedang', 'Perhatikan paragraf berikut.
(1) Perpustakaan berperan penting dalam membentuk kebiasaan membaca. (2) Koleksi buku yang beragam memudahkan anak memilih bacaan sesuai minat. (3) Suasana yang tenang membantu anak berkonsentrasi. (4) Program bedah buku mengajak anak berdiskusi tentang bacaan.
Ide pokok paragraf tersebut adalah ….', 'Kalimat (1) menyatakan gagasan utama, sedangkan kalimat (2)–(4) menjelaskan bentuk peran perpustakaan.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Koleksi buku perpustakaan selalu lengkap.', false),
  ('B', 'Anak lebih senang berdiskusi daripada membaca.', false),
  ('C', 'Program bedah buku hanya diikuti anak berprestasi.', false),
  ('D', 'Suasana tenang adalah syarat utama membaca.', false),
  ('E', 'Perpustakaan berperan dalam membentuk kebiasaan membaca.', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-IDE-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-IDE-024', m.id, 'sulit', 'Perhatikan paragraf berikut.
Penyakit diare banyak diderita warga di wilayah yang sulit memperoleh air bersih. Warga terpaksa memakai air sungai yang tercemar untuk memasak dan mencuci peralatan makan. Kuman dari air tersebut mudah berpindah ke makanan. Setelah dibangun sumur bor dan saluran air bersih, jumlah penderita diare di wilayah itu menurun tajam.
Kalimat penutup yang paling tepat untuk melengkapi paragraf tersebut adalah ….', 'Paragraf menunjukkan hubungan air bersih dengan penurunan diare. Kalimat penutup yang tepat menyimpulkan hubungan itu, diawali penanda simpulan "Dengan demikian".'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Dengan demikian, penyediaan air bersih merupakan langkah penting untuk menjaga kesehatan warga.', true),
  ('B', 'Sebaliknya, air sungai sebaiknya digunakan untuk mencuci peralatan makan.', false),
  ('C', 'Misalnya, penderita diare sebaiknya tidak makan makanan berkuah.', false),
  ('D', 'Namun, sumur bor dan saluran air bersih memerlukan biaya perawatan.', false),
  ('E', 'Sementara itu, pembangunan jalan desa juga perlu dipercepat.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-IDE-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-IDE-025', m.id, 'sedang', 'Perhatikan paragraf yang kalimat pembukanya dihilangkan berikut.
(...) Pengunjung dapat menyaksikan proses pembuatan batik tulis secara langsung. Mereka juga dapat mencoba membatik di atas kain kecil. Hasil karya itu boleh dibawa pulang sebagai kenang-kenangan.
Kalimat pembuka yang paling tepat adalah ….', 'Kalimat-kalimat sesudahnya membahas kegiatan membatik yang dapat dilakukan pengunjung. Kalimat pembuka yang paling sesuai adalah pengenalan kegiatan tersebut.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Ide Pokok dan Hubungan Antarparagraf'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Batik telah ditetapkan sebagai warisan budaya dunia oleh UNESCO.', false),
  ('B', 'Museum itu menyediakan kegiatan membatik bagi para pengunjung.', true),
  ('C', 'Harga kain batik di pasar sedang naik.', false),
  ('D', 'Banyak orang lebih menyukai pakaian modern.', false),
  ('E', 'Motif batik sangat beragam di setiap daerah.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-IDE-025'
on conflict (soal_id, label) do nothing;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-KES-001') then
    insert into wacana (isi) values ('(1) Tenun ikat merupakan kain tradisional yang dibuat dengan cara mengikat benang sebelum dicelup. (2) Bagian benang yang diikat tidak menyerap warna sehingga menghasilkan motif ketika benang ditenun. (3) Proses pembuatannya memerlukan ketelitian karena kesalahan pada satu ikatan dapat mengubah motif seluruh kain. (4) Selembar kain dengan motif rumit bahkan dapat dikerjakan selama berbulan-bulan. (5) [....] harga tenun ikat asli cenderung lebih tinggi daripada kain bermotif cetak. (6) Para pengrajin berharap konsumen memahami nilai kerja tangan di balik setiap lembar kain. (7) Sebagian pengrajin muda mulai memasarkan produknya melalui platform daring untuk menjangkau pembeli di luar daerah.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-001', m.id, w, 'mudah', 'Pernyataan yang sesuai dengan isi bacaan tentang tenun ikat adalah ….', 'Kalimat (1) dan (2) menyatakan bahwa benang diikat sebelum dicelup sehingga bagian yang terikat tidak berwarna dan membentuk motif. Pilihan lain bertentangan dengan bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Motif tenun ikat dibuat dengan mencetak gambar pada kain jadi.', false),
      ('B', 'Tenun ikat dapat diselesaikan dalam satu hari.', false),
      ('C', 'Motif tenun ikat dihasilkan dari benang yang diikat sebelum dicelup.', true),
      ('D', 'Semua pengrajin tenun ikat menolak penjualan daring.', false),
      ('E', 'Tenun ikat berharga lebih murah daripada kain cetak.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-001'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-002', m.id, w, 'sedang', 'Kata penghubung yang tepat untuk melengkapi bagian rumpang pada kalimat (5) adalah ….', 'Proses pembuatan yang teliti dan lama (kalimat 3–4) menjadi sebab harga tinggi (kalimat 5), sehingga penghubung yang tepat adalah "Oleh karena itu".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Namun', false),
      ('B', 'Padahal', false),
      ('C', 'Sebaliknya', false),
      ('D', 'Misalnya', false),
      ('E', 'Oleh karena itu', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-002'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-003', m.id, w, 'sedang', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang tenun ikat adalah ….', 'Kalimat (4) menyatakan kain dengan motif rumit dapat dikerjakan berbulan-bulan, bukan beberapa hari.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kesalahan pada satu ikatan dapat mengubah motif kain.', false),
      ('B', 'Kain tenun ikat berpola rumit biasanya selesai dalam beberapa hari.', true),
      ('C', 'Beberapa kain dikerjakan selama berbulan-bulan.', false),
      ('D', 'Sebagian pengrajin muda memasarkan produknya secara daring.', false),
      ('E', 'Benang yang terikat tidak menyerap warna saat dicelup.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-003'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-004', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tentang tenun ikat tersebut adalah ….', 'Bacaan menjelaskan proses yang rumit dan memakan waktu, lalu menyebut harga yang tinggi dan harapan agar konsumen memahami nilai kerja tangan. Simpulan A merangkum hubungan itu.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Harga tinggi tenun ikat asli sebanding dengan ketelitian dan waktu pengerjaannya.', true),
      ('B', 'Tenun ikat sebaiknya dibuat dengan mesin agar murah.', false),
      ('C', 'Pengrajin muda tidak berminat melanjutkan tenun ikat.', false),
      ('D', 'Kain bermotif cetak lebih bernilai seni daripada tenun ikat.', false),
      ('E', 'Konsumen sudah memahami nilai kerja tangan pengrajin.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-004'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-KES-005') then
    insert into wacana (isi) values ('(1) Terumbu karang sering disebut hutan hujan tropis di laut karena menjadi rumah bagi sangat banyak jenis biota. (2) Karang tumbuh sangat lambat, hanya beberapa sentimeter dalam setahun. (3) Karena itu, kerusakan yang terjadi dalam waktu singkat memerlukan puluhan tahun untuk pulih. (4) Salah satu penyebab kerusakannya adalah penangkapan ikan dengan bahan peledak. (5) Kenaikan suhu laut juga membuat karang memutih dan akhirnya mati. (6) Padahal, terumbu karang melindungi pantai dari gelombang besar dan menopang kehidupan nelayan. (7) [....] pelestarian terumbu karang tidak dapat ditunda lagi.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-005', m.id, w, 'mudah', 'Pernyataan yang sesuai dengan isi bacaan tentang terumbu karang adalah ….', 'Kalimat (2) dan (3) menyatakan karang tumbuh lambat sehingga kerusakan memerlukan puluhan tahun untuk pulih.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Karang tumbuh sangat cepat sehingga cepat pulih.', false),
      ('B', 'Terumbu karang hanya dihuni oleh satu jenis ikan.', false),
      ('C', 'Suhu laut yang naik membuat karang semakin berwarna cerah.', false),
      ('D', 'Pertumbuhan karang yang lambat membuat pemulihannya memerlukan waktu lama.', true),
      ('E', 'Nelayan tidak memperoleh manfaat dari terumbu karang.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-005'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-006', m.id, w, 'sedang', 'Kata penghubung yang tepat untuk melengkapi bagian rumpang pada kalimat (7) bacaan tentang terumbu karang adalah ….', 'Kalimat (7) merupakan simpulan dari penjelasan sebelumnya tentang pentingnya dan rusaknya terumbu karang. Penghubung yang tepat adalah "Dengan demikian,".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Misalnya,', false),
      ('B', 'Akan tetapi,', false),
      ('C', 'Selain itu,', false),
      ('D', 'Sebaliknya,', false),
      ('E', 'Dengan demikian,', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-006'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-007', m.id, w, 'sedang', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang terumbu karang adalah ….', 'Bacaan menyatakan karang tumbuh sangat lambat dan pulih setelah puluhan tahun, sehingga pernyataan A bertentangan dengan bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Karang tumbuh cepat sehingga kerusakan dapat pulih dalam waktu singkat.', true),
      ('B', 'Penangkapan ikan dengan bahan peledak merusak terumbu karang.', false),
      ('C', 'Kenaikan suhu laut dapat mematikan karang.', false),
      ('D', 'Terumbu karang melindungi pantai dari gelombang besar.', false),
      ('E', 'Terumbu karang menjadi rumah bagi banyak biota laut.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-007'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-008', m.id, w, 'sulit', 'Pernyataan yang dapat disimpulkan dari bacaan tentang terumbu karang adalah ….', 'Kalimat (6) menyatakan terumbu karang melindungi pantai dan menopang nelayan, sehingga kerusakannya dapat merugikan masyarakat pesisir. Pilihan lain berlebihan atau bertentangan dengan bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Nelayan sebaiknya berhenti menangkap ikan di laut.', false),
      ('B', 'Gelombang besar hanya terjadi di daerah yang tidak memiliki karang.', false),
      ('C', 'Kerusakan terumbu karang dapat merugikan masyarakat pesisir, termasuk nelayan.', true),
      ('D', 'Karang yang memutih akan segera pulih dengan sendirinya.', false),
      ('E', 'Semua kerusakan karang disebabkan oleh bahan peledak.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-008'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-KES-009') then
    insert into wacana (isi) values ('(1) Perpustakaan keliling hadir untuk menjangkau warga yang tinggal jauh dari perpustakaan daerah. (2) Mobil yang dilengkapi rak buku itu mengunjungi desa-desa sesuai jadwal mingguan. (3) Anak-anak biasanya sudah menunggu di lapangan sebelum mobil tiba. (4) Selain meminjamkan buku, petugas mendongeng dan mengajak anak bermain tebak kata. (5) Namun, koleksi buku di mobil itu terbatas dan sebagian bukunya sudah lusuh. (6) Beberapa donatur mulai menyumbangkan buku baru. (7) [....] jumlah peminjam di desa-desa terpencil terus bertambah.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-009', m.id, w, 'mudah', 'Pernyataan yang sesuai dengan isi bacaan tentang perpustakaan keliling adalah ….', 'Kalimat (4) menyatakan selain meminjamkan buku, petugas mendongeng dan mengajak anak bermain tebak kata.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Petugas hanya bertugas menjaga mobil perpustakaan.', false),
      ('B', 'Petugas tidak hanya meminjamkan buku, tetapi juga mengajak anak beraktivitas.', true),
      ('C', 'Perpustakaan keliling hanya melayani warga kota.', false),
      ('D', 'Anak-anak tidak tertarik pada kegiatan perpustakaan keliling.', false),
      ('E', 'Semua buku di perpustakaan keliling berkondisi baru.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-009'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-010', m.id, w, 'sedang', 'Kata penghubung yang tepat untuk melengkapi bagian rumpang pada kalimat (7) bacaan tentang perpustakaan keliling adalah ….', 'Kehadiran perpustakaan keliling dan sumbangan buku baru berakibat pada bertambahnya peminjam. Penghubung yang tepat adalah "Hasilnya,".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Sebaliknya,', false),
      ('B', 'Misalnya,', false),
      ('C', 'Padahal,', false),
      ('D', 'Hasilnya,', true),
      ('E', 'Meskipun demikian,', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-010'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-011', m.id, w, 'sedang', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang perpustakaan keliling adalah ….', 'Bacaan menyebut kunjungan sesuai jadwal mingguan, bukan setiap hari.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Mobil perpustakaan mengunjungi desa sesuai jadwal mingguan.', false),
      ('B', 'Mobil perpustakaan mengunjungi setiap desa setiap hari.', true),
      ('C', 'Beberapa donatur menyumbangkan buku baru.', false),
      ('D', 'Anak-anak sering sudah menunggu sebelum mobil tiba.', false),
      ('E', 'Perpustakaan keliling menjangkau warga yang jauh dari perpustakaan daerah.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-011'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-012', m.id, w, 'sedang', 'Kendala yang dihadapi perpustakaan keliling menurut bacaan tersebut adalah ….', 'Kalimat (5) menyebut koleksi buku terbatas dan sebagian buku sudah lusuh sebagai kendala.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Anak-anak tidak mau meminjam buku.', false),
      ('B', 'Petugas tidak bersedia mendongeng.', false),
      ('C', 'Jadwal kunjungan tidak ditentukan.', false),
      ('D', 'Koleksi buku terbatas dan sebagian buku sudah lusuh.', true),
      ('E', 'Desa terpencil menolak kedatangan mobil.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-012'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-KES-013') then
    insert into wacana (isi) values ('(1) Sisa dapur, seperti kulit sayur dan ampas kopi, sebenarnya dapat diolah menjadi kompos di rumah. (2) Caranya cukup sederhana: sisa dapur dimasukkan ke dalam wadah berlubang, lalu dicampur dengan tanah dan daun kering. (3) Campuran itu perlu diaduk seminggu sekali agar mendapat cukup udara. (4) Dalam beberapa minggu, bahan tersebut berubah menjadi pupuk yang menyuburkan tanaman. (5) Kompos buatan sendiri juga membantu mengurangi sampah yang berakhir di tempat pembuangan. (6) [....] daging dan minyak sebaiknya tidak dimasukkan karena menimbulkan bau dan mengundang hama. (7) Dengan mengelola sisa dapur sendiri, rumah tangga ikut menjaga lingkungan sekaligus menghemat biaya pupuk.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-013', m.id, w, 'mudah', 'Pernyataan yang sesuai dengan isi bacaan tentang kompos rumah tangga adalah ….', 'Kalimat (2) menyebutkan sisa dapur dimasukkan ke wadah berlubang dan dicampur dengan tanah dan daun kering.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kompos rumah tangga dibuat dari sisa dapur yang dicampur dengan tanah dan daun kering.', true),
      ('B', 'Kompos hanya dapat dibuat di pabrik pupuk.', false),
      ('C', 'Campuran kompos tidak perlu diberi udara.', false),
      ('D', 'Kompos tidak berguna bagi tanaman.', false),
      ('E', 'Kompos dibuat dari sisa daging dan minyak.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-013'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-014', m.id, w, 'sedang', 'Kata penghubung yang tepat untuk melengkapi bagian rumpang pada kalimat (6) bacaan tentang kompos adalah ….', 'Kalimat (6) menyampaikan pengecualian terhadap kemudahan membuat kompos: daging dan minyak tidak boleh dimasukkan. Penghubung yang tepat adalah "Namun,".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Akibatnya,', false),
      ('B', 'Dengan demikian,', false),
      ('C', 'Sehingga,', false),
      ('D', 'Misalnya,', false),
      ('E', 'Namun,', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-014'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-015', m.id, w, 'sedang', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang kompos adalah ….', 'Kalimat (3) menyatakan campuran diaduk seminggu sekali, bukan setiap hari.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Kompos membantu mengurangi sampah yang dibuang ke tempat pembuangan.', false),
      ('B', 'Pembuatan kompos dapat menghemat biaya pupuk.', false),
      ('C', 'Campuran kompos harus diaduk setiap hari.', true),
      ('D', 'Kulit sayur dan ampas kopi dapat dijadikan kompos.', false),
      ('E', 'Dalam beberapa minggu bahan berubah menjadi pupuk.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-015'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-016', m.id, w, 'sulit', 'Simpulan yang paling tepat dari bacaan tentang kompos tersebut adalah ….', 'Bacaan menyebut manfaat bagi lingkungan dan penghematan pupuk, serta batasan bahan (daging dan minyak tidak boleh). Simpulan D mencakup semuanya.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Pengelolaan sampah sebaiknya diserahkan sepenuhnya kepada pemerintah.', false),
      ('B', 'Semua sisa dapur aman dijadikan kompos.', false),
      ('C', 'Pembuatan kompos rumah tangga rumit dan memerlukan alat mahal.', false),
      ('D', 'Mengompos sisa dapur bermanfaat bagi lingkungan dan menghemat biaya, asalkan bahan yang dimasukkan tepat.', true),
      ('E', 'Kompos hanya cocok untuk tanaman hias.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-016'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

do $do$
declare w bigint;
begin
  if not exists (select 1 from soal where kode = 'PPU-KES-017') then
    insert into wacana (isi) values ('(1) Indonesia berada di wilayah pertemuan lempeng tektonik sehingga rawan gempa bumi. (2) Karena itu, pengetahuan tentang cara menyelamatkan diri sangat penting bagi masyarakat. (3) Saat gempa terjadi, orang di dalam gedung dianjurkan berlindung di bawah meja yang kokoh dan menjauhi kaca. (4) Setelah getaran berhenti, barulah mereka keluar menuju lapangan terbuka. (5) Sekolah di daerah rawan gempa rutin mengadakan simulasi evakuasi. (6) [....] siswa tidak panik ketika bencana benar-benar terjadi. (7) Simulasi ini dinilai lebih efektif jika melibatkan guru, siswa, dan warga sekitar sekolah.') returning id into w;
    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-017', m.id, w, 'mudah', 'Pernyataan yang sesuai dengan isi bacaan tentang gempa bumi adalah ….', 'Kalimat (3) menyebut orang di dalam gedung dianjurkan berlindung di bawah meja yang kokoh dan menjauhi kaca.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Orang di dalam gedung dianjurkan berlari ke tangga saat gempa terjadi.', false),
      ('B', 'Berlindung di bawah meja yang kokoh dianjurkan saat gempa terjadi di dalam gedung.', true),
      ('C', 'Orang sebaiknya keluar gedung saat getaran masih terasa.', false),
      ('D', 'Simulasi evakuasi hanya perlu dilakukan satu kali.', false),
      ('E', 'Gempa bumi tidak terjadi di Indonesia.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-017'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-018', m.id, w, 'sedang', 'Kata penghubung yang tepat untuk melengkapi bagian rumpang pada kalimat (6) bacaan tentang gempa bumi adalah ….', 'Simulasi evakuasi dilakukan agar siswa tidak panik saat bencana nyata. Kalimat (6) menyatakan akibat atau tujuan sehingga tepat diawali "Dengan demikian,".'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Misalnya,', false),
      ('B', 'Sebaliknya,', false),
      ('C', 'Meskipun,', false),
      ('D', 'Padahal,', false),
      ('E', 'Dengan demikian,', true)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-018'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-019', m.id, w, 'sedang', 'Pernyataan berikut yang TIDAK sesuai dengan bacaan tentang gempa bumi adalah ….', 'Kalimat (4) menyatakan orang keluar setelah getaran berhenti, bukan saat getaran masih berlangsung.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Indonesia rawan gempa karena berada di pertemuan lempeng tektonik.', false),
      ('B', 'Orang dianjurkan menjauhi kaca saat gempa terjadi.', false),
      ('C', 'Setelah gempa, orang dianjurkan keluar ketika getaran masih berlangsung.', true),
      ('D', 'Sekolah di daerah rawan gempa rutin mengadakan simulasi evakuasi.', false),
      ('E', 'Simulasi lebih efektif bila melibatkan warga sekitar sekolah.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-019'
    on conflict (soal_id, label) do nothing;

    insert into soal (kode, materi_id, wacana_id, kesulitan, pertanyaan, pembahasan)
    select 'PPU-KES-020', m.id, w, 'sulit', 'Pernyataan yang dapat disimpulkan dari bacaan tentang gempa bumi tersebut adalah ….', 'Kalimat (5)–(6) menunjukkan simulasi dilakukan agar siswa tidak panik saat bencana nyata. Pilihan lain tidak ditunjang bacaan.'
    from materi m join subtes s on s.id = m.subtes_id
    where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
    on conflict (kode) do nothing;
    insert into opsi (soal_id, label, isi, is_benar)
    select so.id, v.label, v.isi, v.is_benar
    from soal so, (values
      ('A', 'Latihan evakuasi bertujuan membiasakan siswa bertindak tenang saat bencana.', true),
      ('B', 'Gempa bumi hanya terjadi pada siang hari.', false),
      ('C', 'Orang yang berada di lapangan terbuka tidak perlu menyelamatkan diri.', false),
      ('D', 'Hanya guru yang perlu mengikuti simulasi evakuasi.', false),
      ('E', 'Gempa bumi dapat dicegah dengan simulasi.', false)
    ) as v (label, isi, is_benar)
    where so.kode = 'PPU-KES-020'
    on conflict (soal_id, label) do nothing;


  end if;
end $do$;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-KES-021', m.id, 'mudah', 'Perhatikan paragraf berikut.
(1) Sungai di kota itu kini jernih setelah warga bergotong royong membersihkannya. (2) Ikan-ikan kembali bermunculan di aliran sungai. (3) Karena sungai makin tercemar, wisatawan semakin ramai berkunjung. (4) Pemerintah kota berencana membangun taman di tepian sungai.
Kalimat yang tidak logis dalam paragraf tersebut adalah kalimat ….', 'Kalimat (1) dan (2) menyatakan sungai makin bersih. Kalimat (3) menyebut sungai makin tercemar sehingga bertentangan dan tidak logis.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', '(3)', true),
  ('B', '(1)', false),
  ('C', '(2)', false),
  ('D', '(4)', false),
  ('E', 'tidak ada kalimat yang tidak logis', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-KES-021'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-KES-022', m.id, 'sedang', 'Kata hubung yang tepat untuk melengkapi kalimat "Hasil panen meningkat [....] petani menerapkan pola tanam baru" adalah ….', 'Pola tanam baru menjadi sebab meningkatnya hasil panen, sehingga kata hubung yang tepat adalah karena.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'meskipun', false),
  ('B', 'agar', false),
  ('C', 'karena', true),
  ('D', 'sehingga', false),
  ('E', 'sedangkan', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-KES-022'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-KES-023', m.id, 'sulit', 'Perhatikan paragraf berikut.
Sebuah sekolah menerapkan program bebas kendaraan pribadi setiap hari Jumat. Hasilnya, jumlah siswa yang berjalan kaki atau bersepeda menjadi dua kali lipat dan kemacetan di depan sekolah berkurang.
Simpulan yang paling tepat berdasarkan paragraf tersebut adalah ….', 'Paragraf menyebut kemacetan berkurang setelah program diterapkan. Pilihan lain berlebihan atau tidak disebutkan: tidak semua siswa bersepeda, program hanya pada hari Jumat, kemacetan hanya berkurang.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Semua siswa kini berangkat dengan bersepeda.', false),
  ('B', 'Sekolah melarang kendaraan pribadi setiap hari.', false),
  ('C', 'Kemacetan di depan sekolah hilang sepenuhnya.', false),
  ('D', 'Program bebas kendaraan pribadi mengurangi kemacetan di depan sekolah.', true),
  ('E', 'Jumlah siswa di sekolah itu berkurang.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-KES-023'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-KES-024', m.id, 'mudah', 'Perhatikan paragraf berikut.
Saat banyak temannya menunda belajar hingga menjelang ujian, Rani mengulang materi sedikit demi sedikit setiap hari. Ketika ujian tiba, ia tampak tenang dan menyelesaikan soal dengan baik.
Pernyataan yang paling sesuai dengan paragraf tersebut adalah ….', 'Paragraf membandingkan kebiasaan Rani (belajar rutin) dengan teman yang menunda, dan menunjukkan hasil Rani tenang dan baik, sehingga pernyataan B sesuai.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Menunda belajar membuat siswa lebih tenang saat ujian.', false),
  ('B', 'Belajar sedikit demi sedikit secara rutin membuat Rani lebih siap menghadapi ujian.', true),
  ('C', 'Semua teman Rani gagal dalam ujian.', false),
  ('D', 'Rani hanya belajar pada malam sebelum ujian.', false),
  ('E', 'Ujian itu sangat mudah bagi semua siswa.', false)
) as v (label, isi, is_benar)
where so.kode = 'PPU-KES-024'
on conflict (soal_id, label) do nothing;

insert into soal (kode, materi_id, kesulitan, pertanyaan, pembahasan)
select 'PPU-KES-025', m.id, 'sedang', 'Perhatikan paragraf berikut.
Kunang-kunang menghasilkan cahaya melalui reaksi kimia di dalam tubuhnya. Cahaya itu digunakan untuk menarik pasangan dan mengusir pemangsa. Kini kunang-kunang semakin jarang ditemukan karena cahaya buatan di perkotaan mengganggu cara mereka berkomunikasi.
Pernyataan yang sesuai dengan paragraf tersebut adalah ….', 'Kalimat terakhir menyebutkan cahaya buatan di perkotaan mengganggu komunikasi kunang-kunang. Pilihan lain bertentangan dengan paragraf.'
from materi m join subtes s on s.id = m.subtes_id
where s.nama = 'Pengetahuan dan Pemahaman Umum' and m.nama = 'Kesesuaian Wacana'
on conflict (kode) do nothing;
insert into opsi (soal_id, label, isi, is_benar)
select so.id, v.label, v.isi, v.is_benar
from soal so, (values
  ('A', 'Kunang-kunang menghasilkan cahaya dari sinar matahari yang disimpan.', false),
  ('B', 'Kunang-kunang semakin sering ditemukan di perkotaan.', false),
  ('C', 'Cahaya kunang-kunang hanya digunakan untuk mencari makan.', false),
  ('D', 'Kunang-kunang tidak memiliki pemangsa.', false),
  ('E', 'Cahaya buatan dapat mengganggu komunikasi kunang-kunang.', true)
) as v (label, isi, is_benar)
where so.kode = 'PPU-KES-025'
on conflict (soal_id, label) do nothing;
