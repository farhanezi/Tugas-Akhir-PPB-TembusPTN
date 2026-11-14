-- Daftar materi awal per subtes (draf, boleh diubah). Dasar -> lanjut.
-- Aman dijalankan ulang. video_url / pdf_url diisi nanti lewat UPDATE.
-- Contoh: update materi set video_url = 'https://www.youtube.com/watch?v=...'
--         where nama = 'Bilangan' and subtes_id = (select id from subtes where nama = 'Pengetahuan Kuantitatif');
insert into materi (subtes_id, nama, urutan)
select s.id, m.nama, m.urutan
from (values
  ('Penalaran Umum', 'Penalaran Induktif', 1),
  ('Penalaran Umum', 'Penalaran Deduktif', 2),
  ('Penalaran Umum', 'Penalaran Kuantitatif', 3),

  ('Pengetahuan dan Pemahaman Umum', 'Sinonim dan Makna Kata', 1),
  ('Pengetahuan dan Pemahaman Umum', 'Bentuk Kata', 2),
  ('Pengetahuan dan Pemahaman Umum', 'Ide Pokok dan Hubungan Antarparagraf', 3),
  ('Pengetahuan dan Pemahaman Umum', 'Kesesuaian Wacana', 4),

  ('Pemahaman Bacaan dan Menulis', 'Simpulan dan Ide Pokok', 1),
  ('Pemahaman Bacaan dan Menulis', 'Kalimat Efektif', 2),
  ('Pemahaman Bacaan dan Menulis', 'Ejaan dan Konjungsi', 3),
  ('Pemahaman Bacaan dan Menulis', 'Kepaduan Wacana', 4),

  ('Pengetahuan Kuantitatif', 'Bilangan', 1),
  ('Pengetahuan Kuantitatif', 'Geometri', 2),
  ('Pengetahuan Kuantitatif', 'Aljabar dan Fungsi', 3),
  ('Pengetahuan Kuantitatif', 'Statistika dan Peluang', 4),

  ('Literasi dalam Bahasa Indonesia', 'Makna Kontekstual Kata', 1),
  ('Literasi dalam Bahasa Indonesia', 'Inti dan Simpulan Bacaan', 2),
  ('Literasi dalam Bahasa Indonesia', 'Teks Sastra', 3),
  ('Literasi dalam Bahasa Indonesia', 'Teks Eksplanatif dan Ulasan', 4),
  ('Literasi dalam Bahasa Indonesia', 'Teks Argumentatif', 5),

  ('Literasi dalam Bahasa Inggris', 'Contextual Meaning', 1),
  ('Literasi dalam Bahasa Inggris', 'Main Idea and Conclusion', 2),
  ('Literasi dalam Bahasa Inggris', 'Explanatory and Review Text', 3),
  ('Literasi dalam Bahasa Inggris', 'Argumentative Text', 4),

  ('Penalaran Matematika', 'Bilangan dan Aritmetika Sosial', 1),
  ('Penalaran Matematika', 'Pola Bilangan dan Himpunan', 2),
  ('Penalaran Matematika', 'Aljabar, Fungsi, dan Persamaan', 3),
  ('Penalaran Matematika', 'Geometri dan Pengukuran', 4),
  ('Penalaran Matematika', 'Statistika dan Peluang', 5)
) as m (subtes_nama, nama, urutan)
join subtes s on s.nama = m.subtes_nama
on conflict (subtes_id, nama) do update set urutan = excluded.urutan;
