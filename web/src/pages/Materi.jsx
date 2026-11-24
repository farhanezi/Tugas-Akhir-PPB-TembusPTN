import { Link } from 'react-router-dom';
import { ChevronRight } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { GalatMuat, Kartu, Kerangka, Progres, Tombol } from '../components/ui.jsx';

const KELOMPOK = ['Tes Potensi Skolastik', 'Tes Literasi'];

function Disarankan({ rek }) {
  if (!rek) return null;
  // Urutan: materi terlemah, lalu subtes terlemah, lalu materi pemula bila data belum cukup.
  let judul = 'Disarankan untukmu';
  let nama; let info; let ke;
  if (rek.status === 'materi' && rek.materi[0]) {
    const m = rek.materi[0];
    nama = m.nama; info = `${m.subtes_nama} · akurasi ${m.akurasi}%`; ke = `/materi/${m.materi_id}`;
  } else if (rek.status === 'subtes' && rek.subtes[0]) {
    const s = rek.subtes[0];
    nama = s.nama; info = `Akurasi ${s.akurasi}%`; ke = `/materi/subtes/${s.id}`;
  } else if (rek.materi_umum[0]) {
    const m = rek.materi_umum[0];
    judul = 'Mulai dari sini';
    nama = m.nama; info = m.subtes_nama; ke = `/materi/${m.materi_id}`;
  } else {
    return null;
  }
  return (
    <section className="flex flex-col gap-3 rounded-card bg-primary-soft p-4" aria-label={judul}>
      <h2 className="text-heading">{judul}</h2>
      <div className="flex items-center gap-3">
        <div className="min-w-0 flex-1">
          <p className="truncate text-[15px] leading-5 font-semibold">{nama}</p>
          <p className="text-caption text-ink2">{info}</p>
        </div>
        <Link to={ke}><Tombol kecil tabIndex={-1}>Pelajari</Tombol></Link>
      </div>
    </section>
  );
}

function KartuSubtes({ s }) {
  const isi = (
    <Kartu className={`flex h-full flex-col justify-between gap-3 ${s.tersedia ? '' : 'bg-bg'}`}>
      <div className="flex items-center gap-3 md:items-start">
        <div className="min-w-0 flex-1">
          <p className={`text-heading ${s.tersedia ? '' : 'text-ink3'}`}>{s.nama}</p>
          <p className={`text-caption ${s.tersedia ? 'text-ink2' : 'text-ink3'}`}>
            {s.tersedia ? `${s.materi_selesai} dari ${s.jumlah_materi} materi selesai` : 'Materi segera hadir'}
          </p>
        </div>
        {s.tersedia && <ChevronRight size={20} strokeWidth={1.75} className="text-ink3" />}
      </div>
      {s.tersedia && <Progres nilai={(s.materi_selesai / s.jumlah_materi) * 100} />}
    </Kartu>
  );
  return s.tersedia
    ? <Link to={`/materi/subtes/${s.id}`} className="block rounded-card active:scale-[0.99]">{isi}</Link>
    : isi;
}

export default function Materi() {
  const subtes = useApi('/subtes');
  const rek = useApi('/rekomendasi');

  const daftar = subtes.data;
  const totalMateri = daftar ? daftar.reduce((n, s) => n + s.jumlah_materi, 0) : 0;
  const totalSelesai = daftar ? daftar.reduce((n, s) => n + s.materi_selesai, 0) : 0;

  return (
    <main className="flex flex-1 flex-col gap-5 px-5 pt-2 pb-6 md:px-4 md:pt-8 lg:px-12">
      <div className="flex flex-col gap-1">
        <h1 className="text-title md:text-display">Materi</h1>
        <p className="text-body text-ink2">{daftar ? `${totalSelesai} dari ${totalMateri} materi selesai` : ' '}</p>
      </div>

      {subtes.memuat && (
        <div className="flex flex-col gap-3" role="status" aria-label="Memuat">
          <Kerangka className="h-24" /><Kerangka className="h-24" /><Kerangka className="h-24" />
        </div>
      )}
      {subtes.galat && <GalatMuat galat={subtes.galat} onUlang={subtes.ulang} />}

      {daftar && (
        <>
          {/* Rekomendasi bersifat tambahan: kalau gagal dimuat, daftar subtes tetap tampil. */}
          <Disarankan rek={rek.data} />
          {KELOMPOK.map((k) => {
            const isi = daftar.filter((s) => s.kelompok === k);
            if (isi.length === 0) return null;
            return (
              <section key={k} className="flex flex-col gap-2.5 md:gap-3" aria-label={k}>
                <h2 className="text-caption text-ink2">{k}</h2>
                <div className="grid gap-2.5 md:grid-cols-2 md:gap-4 lg:grid-cols-4">
                  {isi.map((s) => <KartuSubtes key={s.id} s={s} />)}
                </div>
              </section>
            );
          })}
        </>
      )}
    </main>
  );
}
