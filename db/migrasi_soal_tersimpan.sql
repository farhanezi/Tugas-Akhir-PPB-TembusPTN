-- ===== Soal tersimpan (fitur "Simpan soal" di latihan) =====
-- Jalankan sekali di Supabase > SQL Editor. Aman dijalankan ulang.
-- Satu soal hanya tersimpan sekali per pengguna. sesi_id = sesi latihan asal,
-- dipakai untuk menampilkan jawaban pengguna dan menahan kunci selama sesi mode "akhir" belum selesai.
create table if not exists soal_tersimpan (
  profil_id    uuid   not null references profil (id) on delete cascade,
  soal_id      bigint not null references soal (id)   on delete cascade,
  sesi_id      bigint          references sesi (id)   on delete set null,
  disimpan_at  timestamptz not null default now(),
  primary key (profil_id, soal_id)
);
create index if not exists soal_tersimpan_profil_idx on soal_tersimpan (profil_id, disimpan_at desc);
create index if not exists soal_tersimpan_soal_idx   on soal_tersimpan (soal_id);
create index if not exists soal_tersimpan_sesi_idx   on soal_tersimpan (sesi_id);
alter table soal_tersimpan enable row level security;
