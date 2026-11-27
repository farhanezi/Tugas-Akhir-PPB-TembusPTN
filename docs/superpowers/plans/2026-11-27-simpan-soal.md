# Simpan Soal Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** User bisa menyimpan soal latihan (saat mengerjakan & di halaman Hasil) dan membukanya lagi di `/profil/tersimpan`.

**Architecture:** Tabel `soal_tersimpan` di Supabase, controller Express baru `tersimpanController.js` di belakang `wajibLogin`, hook React `useTersimpan()` untuk status ikon, halaman baru `Tersimpan.jsx` yang memakai ulang `BarisSoal` dari `Hasil.jsx`.

**Tech Stack:** Express 4 + supabase-js (service_role), React 19 + react-router 7 + Tailwind 4 + lucide-react.

**Spec:** `docs/superpowers/specs/2026-11-27-simpan-soal-design.md`

## Global Constraints
- Semua teks UI dan nama kode dalam Bahasa Indonesia, mengikuti gaya file sekitarnya.
- Error API lewat `throw new Galat(KODE, pesan)`; query lewat `periksa(...)`; handler dibungkus `bungkus`.
- Hanya soal latihan (`try_out_id is null`) boleh disimpan.
- Terkunci = sesi asal `pengaturan.umpan_balik === 'akhir'` && `selesai_at` null && `mulai_at` > now − 3 jam. Saat terkunci: `opsi[].is_benar`, `pembahasan`, `jawaban_opsi_id`, `benar` tidak dikirim (dihilangkan / null).
- Jangan commit: user meng-commit & push sendiri.

## Review Focus
1. Soal try out dikirim ke POST → 422 VALIDASI (uji e2e Task 1).
2. `sesi_id` yang tidak ada / milik orang lain → 404 / 403, tidak membocorkan jawaban orang lain (uji e2e Task 1: id tak ada → TIDAK_DITEMUKAN).
3. Simpan dua kali / hapus yang tidak ada → tetap sukses (idempoten; uji e2e Task 1).
4. Sesi `akhir` belum selesai → GET tidak membawa `is_benar`/`pembahasan` (uji e2e Task 1).
5. Gagal jaringan saat toggle ikon → ikon kembali ke keadaan semula dan tidak crash (cek manual Task 2).

---

### Task 1: Database + API soal tersimpan

**Files:**
- Modify: `db/schema.sql` (tambah bagian di akhir file)
- Create: `db/migrasi_soal_tersimpan.sql` (isi sama, untuk dijalankan sekali di SQL Editor)
- Create: `api/src/controllers/tersimpanController.js`
- Modify: `api/src/routes/index.js`
- Test: `api/scripts/uji-e2e.js` (bagian baru setelah blok latihan, sebelum `// ---------- 5. try out`; tambah pembersihan `soal_tersimpan` di blok bersih-bersih)

**Interfaces:**
- Produces (HTTP, semua wajib login):
  - `GET /api/soal-tersimpan/id` → `{ soal_ids: number[] }`
  - `GET /api/soal-tersimpan` → `{ soal: Item[] }`, urut `disimpan_at desc`. `Item = { id, pertanyaan, gambar_url, wacana: string|null, materi: {id,nama}, subtes: {id,nama}, opsi: {id,label,isi,is_benar?}[] (urut label), pembahasan: string|null, jawaban_opsi_id: number|null, benar: boolean|null, terkunci: boolean, disimpan_at }`
  - `POST /api/soal-tersimpan` body `{ soal_id: int, sesi_id?: int }` → `201 { soal_id, tersimpan: true }`
  - `DELETE /api/soal-tersimpan/:soalId` → `200 { soal_id, tersimpan: false }`

- [ ] **Step 1: SQL** — tabel `soal_tersimpan (profil_id uuid references profil on delete cascade, soal_id bigint references soal on delete cascade, sesi_id bigint references sesi on delete set null, disimpan_at timestamptz not null default now(), primary key (profil_id, soal_id))`, indeks `(profil_id, disimpan_at desc)`, `enable row level security`. Taruh di `schema.sql` dan `migrasi_soal_tersimpan.sql`.
- [ ] **Step 2: Tulis uji e2e yang gagal** (pakai `soalL`, `sesiL` dari blok latihan):
  - `POST {soal_id: soalL[0].id, sesi_id: sesiL}` → 201; diulang → 201 (idempoten)
  - `GET /soal-tersimpan/id` → `soal_ids` berisi `soalL[0].id`
  - `GET /soal-tersimpan` → item pertama `id === soalL[0].id`, `terkunci === false`, opsi punya `is_benar`, `jawaban_opsi_id === soalL[0].opsi[0].id`
  - `POST` soal try out (ambil satu id via `supabase.from('soal').select('id').not('try_out_id','is',null).limit(1)`) → `VALIDASI`
  - `POST {soal_id: 999999999}` → `TIDAK_DITEMUKAN`; `POST {soal_id: soalL[1].id, sesi_id: 999999999}` → `TIDAK_DITEMUKAN`
  - Sesi `akhir`: mulai latihan `jumlah:1, umpan_balik:'akhir'`, simpan soalnya dengan sesi itu → GET: item `terkunci === true`, tak ada opsi dengan `is_benar` terdefinisi, `pembahasan === null`
  - `DELETE` dua kali → 200 keduanya; GET id tidak lagi berisi soal itu
  - Bersih-bersih awal: `await supabase.from('soal_tersimpan').delete().eq('profil_id', uid)` sebelum hapus sesi/profil.
- [ ] **Step 3: Jalankan** `cd api && npm run uji` → bagian baru GAGAL (404 rute).
- [ ] **Step 4: Implement** `tersimpanController.js` (`daftarId`, `daftar`, `simpan`, `hapus`) + rute di `routes/index.js`. `simpan`: validasi integer, cek soal ada & `try_out_id` null, bila `sesi_id` ada cek sesi ada (404) & milik user (403 BUKAN_PEMILIK), `pastikanProfil`, `upsert` onConflict `profil_id,soal_id`. `daftar`: ambil baris tersimpan, soal dengan `materi:materi_id (id, nama, subtes:subtes_id (id, nama))`, sesi asal (`id, pengaturan, mulai_at, selesai_at`), jawaban dari sesi asal; hitung `terkunci` sesuai Global Constraints.
- [ ] **Step 5: Jalankan** `npm run uji` → semua LULUS (perlu migrasi Step 1 sudah dijalankan di Supabase).

### Task 2: Web — tombol simpan, halaman Soal tersimpan, menu Profil

**Files:**
- Create: `web/src/lib/tersimpan.js`
- Create: `web/src/pages/Tersimpan.jsx`
- Modify: `web/src/pages/LatihanKerja.jsx` (header), `web/src/pages/Hasil.jsx` (`BarisSoal`, `DaftarSoal`, `HasilLatihan`), `web/src/pages/Profil.jsx` (kartu menu), `web/src/App.jsx` (rute)

**Interfaces:**
- Consumes: endpoint Task 1.
- Produces:
  - `useTersimpan(): { ids: Set<number>, ubah(soalId: number, sesiId?: number): Promise<boolean> }` — memuat `/soal-tersimpan/id` sekali; `ubah` optimistis (POST/DELETE), rollback bila gagal, mengembalikan sukses/tidak, tidak melempar.
  - `export function BarisSoal({ soal, tersimpan?: boolean, onSimpan?: () => void })` dari `Hasil.jsx`. Bila `onSimpan` ada, tombol ikon Bookmark (terisi saat `tersimpan`) di sebelah kanan tombol buka-tutup (bukan di dalamnya). Bila `soal.terkunci`: status "Kunci muncul setelah sesi selesai", opsi tanpa tanda benar/salah, kotak pembahasan berisi teks yang sama.

- [ ] **Step 1:** `lib/tersimpan.js` dengan `useTersimpan`.
- [ ] **Step 2:** `LatihanKerja`: tombol ikon Bookmark di kanan header (`aria-label` "Simpan soal"/"Hapus dari simpanan", `aria-pressed`), memanggil `ubah(soal.id, Number(id))`. Sesuaikan `pr-10` pada div progres.
- [ ] **Step 3:** `Hasil.jsx`: export `BarisSoal` + prop di atas; `DaftarSoal` meneruskan `tersimpan/onSimpan` opsional; hanya `HasilLatihan` yang mengisinya dengan `ubah(s.id, d.sesi_id)`.
- [ ] **Step 4:** `Tersimpan.jsx` di `/profil/tersimpan` (rute di grup `Kerangka` seperti `/profil/riwayat`): `BarAtas judul="Soal tersimpan" ke="/profil"`, chip subtes ("Semua" + subtes yang ada di data), daftar `BarisSoal` dengan `nomor` = urutan tampil, hapus = `ubah` lalu buang dari daftar. Kosong: "Belum ada soal tersimpan" + "Tekan ikon simpan saat latihan untuk menyimpan soal yang ingin kamu pelajari lagi." Pakai `MemuatDaftar`/`GalatMuat`.
- [ ] **Step 5:** `Profil.jsx`: baris menu "Soal tersimpan" (ikon Bookmark, jumlah dari `useTersimpan().ids.size`) di atas Riwayat, tampil di semua ukuran layar.
- [ ] **Step 6: Verifikasi** `cd web && npm run build` → sukses. Cek manual di `npm run dev`: simpan saat latihan → muncul di Profil; hapus dari halaman Tersimpan; ikon di Hasil latihan sinkron; matikan API lalu tekan ikon → ikon kembali.
