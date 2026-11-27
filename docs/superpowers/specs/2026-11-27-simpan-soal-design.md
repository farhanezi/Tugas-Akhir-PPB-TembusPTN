# Simpan Soal (latihan) — rancangan

## Tujuan
User yang kesulitan di satu soal latihan bisa menyimpannya, lalu membukanya lagi dari halaman Profil untuk dipelajari (soal, kunci, jawabannya dulu, pembahasan).

## Lingkup
- Simpan/batal simpan dari layar mengerjakan latihan (`LatihanKerja`) dan dari daftar soal di halaman Hasil latihan.
- Halaman `/profil/tersimpan`: filter per subtes, daftar soal yang bisa dibuka-tutup (gaya `BarisSoal`), tombol "Hapus dari simpanan".
- Profil: baris menu "Soal tersimpan (N)".

**Tidak termasuk:** soal try out, catatan pribadi, mengerjakan ulang soal tersimpan.

## Pendekatan
- Dipilih: tabel `soal_tersimpan` di Supabase + endpoint Express, sama seperti fitur lain.
- Ditolak: localStorage, karena simpanan harus terikat ke profil, bukan ke perangkat.

## Database
Tabel `soal_tersimpan(profil_id uuid → profil, soal_id → soal, sesi_id → sesi (set null), disimpan_at)`:
- Primary key: (profil_id, soal_id)
- RLS aktif
- Indeks pada (profil_id, disimpan_at desc)

## API
- `GET /api/soal-tersimpan` → `{ soal: [...] }`, diurutkan dari yang terakhir disimpan. Isi tiap soal: id, pertanyaan, gambar_url, wacana, materi {id, nama}, subtes {id, nama}, opsi (dengan is_benar bila terbuka), pembahasan, jawaban_opsi_id, benar, terkunci, disimpan_at.
- `GET /api/soal-tersimpan/id` → `{ soal_ids: [...] }`, ringan, dipakai untuk menandai ikon.
- `POST /api/soal-tersimpan` body `{ soal_id, sesi_id? }` → idempoten. Soal try out ditolak. sesi_id harus milik user.
- `DELETE /api/soal-tersimpan/:soalId` → idempoten.

**Aturan terkunci:** soal dianggap terkunci bila sesi asal memakai umpan_balik `akhir`, sesi itu belum selesai, dan baru dimulai kurang dari 3 jam lalu. Selama terkunci, is_benar, pembahasan, dan jawaban disembunyikan.

## Web
- Ikon Bookmark di header `LatihanKerja` (pojok kanan).
- Ikon Bookmark di baris soal Hasil latihan.
- Status tersimpan diambil dari `/soal-tersimpan/id`, lalu diperbarui secara optimistis.

## Keputusan builder
Ukuran ikon, teks kosong, dan batas tampil awal mengikuti pola halaman Hasil dan Riwayat.
