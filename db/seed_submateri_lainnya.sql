-- Sub materi untuk PU, PPU, PBM, LBI, LBE (59 sub materi). Aman dijalankan ulang.
-- Melengkapi seed_submateri.sql (PK dan PM). Jalankan SETELAH seed_materi.sql dan migrasi_submateri.sql.
-- Dasar: kisi-kisi UTBK-SNBT 2026 (referensi-subtes-utbk.md), dipecah satu tingkat ke bawah.
-- Catatan: materi yang tadinya ditandai selesai langsung akan dianggap belum selesai
-- sampai semua sub materinya ditandai selesai (aturan materiSelesai di api/src/utils/bantu.js).
insert into submateri (materi_id, nama, urutan)
select m.id, v.nama, v.urutan
from (values
  -- Penalaran Umum (9)
  ('Penalaran Umum', 'Penalaran Induktif', 'Hubungan Sebab-Akibat', 1),
  ('Penalaran Umum', 'Penalaran Induktif', 'Kesesuaian Pernyataan dengan Data', 2),
  ('Penalaran Umum', 'Penalaran Induktif', 'Analogi dan Generalisasi', 3),
  ('Penalaran Umum', 'Penalaran Deduktif', 'Logika Proposisi dan Kuantor', 1),
  ('Penalaran Umum', 'Penalaran Deduktif', 'Silogisme dan Simpulan Logis', 2),
  ('Penalaran Umum', 'Penalaran Deduktif', 'Penalaran Analitik (Urutan dan Posisi)', 3),
  ('Penalaran Umum', 'Penalaran Kuantitatif', 'Perbandingan Kuantitas', 1),
  ('Penalaran Umum', 'Penalaran Kuantitatif', 'Pola Bilangan dan Deret', 2),
  ('Penalaran Umum', 'Penalaran Kuantitatif', 'Aritmetika Dasar dalam Soal Cerita', 3),

  -- Pengetahuan dan Pemahaman Umum (11)
  ('Pengetahuan dan Pemahaman Umum', 'Sinonim dan Makna Kata', 'Sinonim dan Antonim', 1),
  ('Pengetahuan dan Pemahaman Umum', 'Sinonim dan Makna Kata', 'Makna Kata dalam Konteks', 2),
  ('Pengetahuan dan Pemahaman Umum', 'Sinonim dan Makna Kata', 'Istilah dan Kata Serapan', 3),
  ('Pengetahuan dan Pemahaman Umum', 'Bentuk Kata', 'Imbuhan dan Kata Turunan', 1),
  ('Pengetahuan dan Pemahaman Umum', 'Bentuk Kata', 'Kata Ulang dan Kata Majemuk', 2),
  ('Pengetahuan dan Pemahaman Umum', 'Bentuk Kata', 'Kata Baku', 3),
  ('Pengetahuan dan Pemahaman Umum', 'Ide Pokok dan Hubungan Antarparagraf', 'Ide Pokok Paragraf', 1),
  ('Pengetahuan dan Pemahaman Umum', 'Ide Pokok dan Hubungan Antarparagraf', 'Hubungan Antarparagraf', 2),
  ('Pengetahuan dan Pemahaman Umum', 'Ide Pokok dan Hubungan Antarparagraf', 'Fungsi Kalimat dalam Paragraf', 3),
  ('Pengetahuan dan Pemahaman Umum', 'Kesesuaian Wacana', 'Kesesuaian Pernyataan dengan Bacaan', 1),
  ('Pengetahuan dan Pemahaman Umum', 'Kesesuaian Wacana', 'Informasi Tersirat', 2),

  -- Pemahaman Bacaan dan Menulis (13)
  ('Pemahaman Bacaan dan Menulis', 'Simpulan dan Ide Pokok', 'Gagasan Utama Bacaan', 1),
  ('Pemahaman Bacaan dan Menulis', 'Simpulan dan Ide Pokok', 'Simpulan dan Inferensi', 2),
  ('Pemahaman Bacaan dan Menulis', 'Simpulan dan Ide Pokok', 'Makna dan Bentuk Kata dalam Bacaan', 3),
  ('Pemahaman Bacaan dan Menulis', 'Kalimat Efektif', 'Ciri Kalimat Efektif', 1),
  ('Pemahaman Bacaan dan Menulis', 'Kalimat Efektif', 'Kalimat Rancu dan Pleonasme', 2),
  ('Pemahaman Bacaan dan Menulis', 'Kalimat Efektif', 'Struktur Kalimat (S-P-O-K)', 3),
  ('Pemahaman Bacaan dan Menulis', 'Ejaan dan Konjungsi', 'Huruf Kapital dan Huruf Miring', 1),
  ('Pemahaman Bacaan dan Menulis', 'Ejaan dan Konjungsi', 'Tanda Baca', 2),
  ('Pemahaman Bacaan dan Menulis', 'Ejaan dan Konjungsi', 'Penulisan Kata', 3),
  ('Pemahaman Bacaan dan Menulis', 'Ejaan dan Konjungsi', 'Konjungsi dan Kata Depan', 4),
  ('Pemahaman Bacaan dan Menulis', 'Kepaduan Wacana', 'Kohesi dan Koherensi', 1),
  ('Pemahaman Bacaan dan Menulis', 'Kepaduan Wacana', 'Kalimat Sumbang', 2),
  ('Pemahaman Bacaan dan Menulis', 'Kepaduan Wacana', 'Melengkapi dan Menyusun Paragraf', 3),

  -- Literasi dalam Bahasa Indonesia (14)
  ('Literasi dalam Bahasa Indonesia', 'Makna Kontekstual Kata', 'Makna Kata dan Frasa dalam Teks', 1),
  ('Literasi dalam Bahasa Indonesia', 'Makna Kontekstual Kata', 'Makna Denotatif, Konotatif, dan Kiasan', 2),
  ('Literasi dalam Bahasa Indonesia', 'Inti dan Simpulan Bacaan', 'Gagasan Utama Teks', 1),
  ('Literasi dalam Bahasa Indonesia', 'Inti dan Simpulan Bacaan', 'Simpulan dan Informasi Tersirat', 2),
  ('Literasi dalam Bahasa Indonesia', 'Inti dan Simpulan Bacaan', 'Membaca Grafik dan Tabel dalam Teks', 3),
  ('Literasi dalam Bahasa Indonesia', 'Teks Sastra', 'Unsur Intrinsik Cerita', 1),
  ('Literasi dalam Bahasa Indonesia', 'Teks Sastra', 'Puisi dan Majas', 2),
  ('Literasi dalam Bahasa Indonesia', 'Teks Sastra', 'Nilai dan Amanat', 3),
  ('Literasi dalam Bahasa Indonesia', 'Teks Eksplanatif dan Ulasan', 'Teks Eksplanatif', 1),
  ('Literasi dalam Bahasa Indonesia', 'Teks Eksplanatif dan Ulasan', 'Teks Ulasan', 2),
  ('Literasi dalam Bahasa Indonesia', 'Teks Eksplanatif dan Ulasan', 'Teks Personal dan Inspiratif', 3),
  ('Literasi dalam Bahasa Indonesia', 'Teks Argumentatif', 'Argumen, Fakta, dan Opini', 1),
  ('Literasi dalam Bahasa Indonesia', 'Teks Argumentatif', 'Kekuatan dan Kelemahan Argumen', 2),
  ('Literasi dalam Bahasa Indonesia', 'Teks Argumentatif', 'Sikap dan Tujuan Penulis', 3),

  -- Literasi dalam Bahasa Inggris (12)
  ('Literasi dalam Bahasa Inggris', 'Contextual Meaning', 'Vocabulary in Context', 1),
  ('Literasi dalam Bahasa Inggris', 'Contextual Meaning', 'Reference Words', 2),
  ('Literasi dalam Bahasa Inggris', 'Contextual Meaning', 'Figurative Language', 3),
  ('Literasi dalam Bahasa Inggris', 'Main Idea and Conclusion', 'Main Idea and Topic', 1),
  ('Literasi dalam Bahasa Inggris', 'Main Idea and Conclusion', 'Inference and Conclusion', 2),
  ('Literasi dalam Bahasa Inggris', 'Main Idea and Conclusion', 'Supporting Details', 3),
  ('Literasi dalam Bahasa Inggris', 'Explanatory and Review Text', 'Explanatory Text', 1),
  ('Literasi dalam Bahasa Inggris', 'Explanatory and Review Text', 'Review Text', 2),
  ('Literasi dalam Bahasa Inggris', 'Explanatory and Review Text', 'Personal and Inspirational Text', 3),
  ('Literasi dalam Bahasa Inggris', 'Argumentative Text', 'Claims, Facts, and Opinions', 1),
  ('Literasi dalam Bahasa Inggris', 'Argumentative Text', 'Strengthening and Weakening Arguments', 2),
  ('Literasi dalam Bahasa Inggris', 'Argumentative Text', 'Author''s Purpose and Tone', 3)
) as v (subtes_nama, materi_nama, nama, urutan)
join subtes s on s.nama = v.subtes_nama
join materi m on m.subtes_id = s.id and m.nama = v.materi_nama
on conflict (materi_id, nama) do update set urutan = excluded.urutan;

-- Cek: harus 0 baris (semua materi kini punya sub materi).
-- select s.nama, m.nama from materi m join subtes s on s.id = m.subtes_id
-- where not exists (select 1 from submateri x where x.materi_id = m.id);
