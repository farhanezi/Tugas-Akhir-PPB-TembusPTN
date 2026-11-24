import { Link } from 'react-router-dom';
import { ArrowRight, BookOpen, ChevronRight, PenLine, Target, Timer } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { useAuth } from '../auth/AuthProvider.jsx';
import { bulat } from '../lib/format.js';
import { GalatMuat, JarakTarget, JudulBagian, Kartu, MemuatDaftar, Tombol } from '../components/ui.jsx';
import { BarisLemah } from './Hasil.jsx';
import { ringkasTryOut } from './TryOut.jsx';

const tautanSemua = <Link to="/materi" className="-mr-2 rounded-full px-2 py-1.5 text-[13px] font-semibold text-primary">Semua materi</Link>;

function Banner({ b, tryOut }) {
  const t = b.target;
  const nama = t ? `${t.prodi} ${t.ptn}` : '';
  const target = t ? bulat(t.skor_target) : null;
  const skor = bulat(b.skor_tertinggi);
  let judul; let isi; let aksi = null;

  if (b.status === 'belum_ada_target') {
    judul = 'Pasang targetmu';
    isi = 'Pilih PTN dan prodi tujuan supaya jarak skormu bisa dihitung.';
    aksi = <Link to="/target"><Tombol jenis="lime" penuh ikon={Target} tabIndex={-1}>Pilih target</Tombol></Link>;
  } else if (b.status === 'belum_ada_try_out') {
    judul = 'Belum ada skor';
    isi = `Kerjakan try out pertamamu untuk melihat jarak ke skor target ${target}.`;
    if (tryOut) aksi = <Link to={`/try-out/${tryOut.id}`}><Tombol jenis="lime" penuh ikonKanan={ArrowRight} tabIndex={-1}>{tryOut.status === 'berjalan' ? 'Lanjutkan' : 'Mulai'} {tryOut.judul}</Tombol></Link>;
  } else if (b.status === 'menuju') {
    judul = `${Math.ceil(b.selisih)} poin lagi`;
    isi = `menuju skor target ${nama}. Skor try out tertinggimu ${skor} (estimasi).`;
  } else {
    judul = 'Target tercapai';
    isi = `Skor try out tertinggimu ${skor} (estimasi), sudah di atas skor target ${nama}. Pertahankan.`;
  }

  return (
    <section className="flex flex-col gap-4 rounded-panel bg-panel p-5 md:p-6 lg:flex-row lg:items-center lg:gap-8 lg:p-7" aria-label="Capaian">
      <div className="flex min-w-0 flex-1 flex-col gap-4">
        <div className="flex flex-col gap-1">
          <h2 className={`font-bold tracking-[-0.02em] text-white ${b.status === 'menuju' ? 'text-[34px] leading-10 lg:text-[40px] lg:leading-[46px]' : 'text-[28px] leading-[34px]'}`}>{judul}</h2>
          <p className="text-body text-panel-text">{isi}</p>
        </div>
        {aksi && <div className="hidden lg:block lg:max-w-[320px]">{aksi}</div>}
      </div>
      {target != null && <div className="lg:w-[320px] lg:shrink-0"><JarakTarget skor={skor} target={target} /></div>}
      {aksi && <div className="lg:hidden">{aksi}</div>}
    </section>
  );
}

function Rekomendasi({ r }) {
  if (r.status === 'materi' && r.materi.length > 0) {
    return (
      <section className="flex flex-col gap-3">
        <JudulBagian kanan={tautanSemua}>Perkuat yang lemah</JudulBagian>
        <Kartu className="flex flex-col gap-4">
          {r.materi.map((m, i) => (
            <div key={m.materi_id} className={i ? 'border-t border-line pt-4' : ''}>
              <BarisLemah mendatar nama={m.nama} keterangan={m.subtes_nama} akurasi={m.akurasi} jawaban={m.jumlah_jawaban} materiId={m.materi_id} subtesId={m.jumlah_soal_latihan > 0 ? m.subtes_id : null} />
            </div>
          ))}
        </Kartu>
      </section>
    );
  }
  if (r.status === 'subtes' && r.subtes.length > 0) {
    return (
      <section className="flex flex-col gap-3">
        <JudulBagian kanan={tautanSemua}>Perkuat yang lemah</JudulBagian>
        <Kartu className="py-1">
          <ul>
            {r.subtes.map((s) => (
              <li key={s.id} className="border-t border-line first:border-t-0">
                <Link to={`/materi/subtes/${s.id}`} className="flex items-center gap-3 py-3">
                  <span className="min-w-0 flex-1">
                    <span className="block text-heading">{s.nama}</span>
                    <span className="block text-caption text-ink2">{s.jumlah_jawaban} jawaban</span>
                  </span>
                  <span className="text-heading font-bold text-bad">{s.akurasi}%</span>
                  <ChevronRight size={20} strokeWidth={1.75} className="text-ink3" />
                </Link>
              </li>
            ))}
          </ul>
        </Kartu>
      </section>
    );
  }
  if (r.materi_umum.length === 0) return null;
  return (
    <section className="flex flex-col gap-3">
      <JudulBagian kanan={tautanSemua}>Mulai dari sini</JudulBagian>
      <Kartu className="py-1">
        <ul>
          {r.materi_umum.map((m) => (
            <li key={m.materi_id} className="border-t border-line first:border-t-0">
              <Link to={`/materi/${m.materi_id}`} className="flex items-center gap-3 py-3">
                <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary"><BookOpen size={20} strokeWidth={1.75} /></span>
                <span className="min-w-0 flex-1">
                  <span className="block text-heading">{m.nama}</span>
                  <span className="block text-caption text-ink2">{m.subtes_nama}</span>
                </span>
                <ChevronRight size={20} strokeWidth={1.75} className="text-ink3" />
              </Link>
            </li>
          ))}
        </ul>
      </Kartu>
    </section>
  );
}

export default function Dashboard() {
  const { profil, sesi } = useAuth();
  const { data, galat, memuat, ulang } = useApi('/dashboard');
  const nama = data?.nama ?? profil.nama;
  const t = profil.target;
  const berikut = data?.try_out.find((x) => x.status === 'berjalan') || data?.try_out.find((x) => x.status === 'belum');
  const baru = data && data.rekomendasi.status === 'umum';

  return (
    <main className="flex flex-1 flex-col gap-5 px-5 pt-2 pb-6 md:px-4 md:pt-8 lg:px-12">
      <div className="flex items-center gap-3">
        <div className="min-w-0 flex-1">
          <h1 className="truncate text-title md:text-display">Halo{nama ? `, ${nama.split(' ')[0]}` : ''}</h1>
          <p className="truncate text-caption text-ink2 md:text-body">{t ? `Target: ${t.prodi} ${t.ptn}` : 'Belum ada target'}</p>
        </div>
        <Link to="/profil" aria-label="Profil" className="grid size-10 shrink-0 place-items-center rounded-full bg-lime text-[16px] font-bold text-lime-ink md:hidden">
          {(nama || sesi.user.email)[0].toUpperCase()}
        </Link>
      </div>

      {memuat && <MemuatDaftar tinggi={['h-48', 'h-40', 'h-32']} />}
      {galat && <GalatMuat galat={galat} onUlang={ulang} />}

      {data && (
        <div className="flex flex-col gap-5 lg:flex-row lg:items-start lg:gap-6">
          <div className="flex min-w-0 flex-1 flex-col gap-5 lg:gap-6">
            <Banner b={data.banner} tryOut={berikut} />
            <Rekomendasi r={data.rekomendasi} />
          </div>
          <div className="flex flex-col gap-5 md:grid md:grid-cols-2 md:items-start lg:flex lg:w-[360px] lg:shrink-0 lg:items-stretch">

          {berikut && data.banner.status !== 'belum_ada_try_out' && (
            <section className="flex flex-col gap-3">
              <JudulBagian>{berikut.status === 'berjalan' ? 'Try out sedang berjalan' : 'Try out berikutnya'}</JudulBagian>
              <Kartu className="flex flex-col gap-3.5">
                <div className="flex items-center gap-3">
                  <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-lime text-lime-ink"><Timer size={22} strokeWidth={1.75} /></span>
                  <div className="min-w-0 flex-1">
                    <p className="text-heading">{berikut.judul}</p>
                    <p className="text-caption text-ink2">{ringkasTryOut(berikut)}</p>
                  </div>
                </div>
                <Link to={`/try-out/${berikut.id}`}><Tombol penuh ikonKanan={ArrowRight} tabIndex={-1}>{berikut.status === 'berjalan' ? 'Lanjutkan' : 'Lihat try out'}</Tombol></Link>
              </Kartu>
            </section>
          )}

          {baru && (
            <section className="flex flex-col gap-3">
              <JudulBagian>Coba latihan singkat</JudulBagian>
              <Kartu className="flex flex-col gap-3.5">
                <p className="text-body text-ink2">Pilih subtes, ambil beberapa soal, dan lihat pembahasannya langsung setelah menjawab.</p>
                <Link to="/latihan"><Tombol penuh jenis="soft" ikon={PenLine} tabIndex={-1}>Atur latihan</Tombol></Link>
              </Kartu>
            </section>
          )}

          <section className="flex flex-col gap-3">
            <JudulBagian>Progres materi</JudulBagian>
            <Kartu className="flex flex-col gap-3.5">
              <p className="flex items-end gap-2">
                <span className="text-[28px] leading-8 font-bold tracking-[-0.02em]">{profil.ringkasan?.materi_selesai ?? 0}</span>
                <span className="pb-1 text-caption text-ink2">materi selesai</span>
              </p>
              <Link to="/materi"><Tombol penuh jenis="soft" ikon={BookOpen} tabIndex={-1}>Lanjut belajar</Tombol></Link>
            </Kartu>
          </section>
          </div>
        </div>
      )}
    </main>
  );
}
