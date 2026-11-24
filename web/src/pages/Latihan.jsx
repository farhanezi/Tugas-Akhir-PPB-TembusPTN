import { Link } from 'react-router-dom';
import { ChevronRight } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { GalatMuat, Kartu, MemuatDaftar } from '../components/ui.jsx';

export default function Latihan() {
  const { data, galat, memuat, ulang } = useApi('/subtes');
  // Subtes yang punya soal latihan ditampilkan lebih dulu.
  const daftar = data ? [...data].sort((a, b) => (b.jumlah_soal_latihan > 0) - (a.jumlah_soal_latihan > 0)) : [];

  return (
    <main className="flex flex-1 flex-col gap-5 px-5 pt-2 pb-6 md:px-4 md:pt-8 lg:px-12">
      <div className="flex flex-col gap-1">
        <h1 className="text-title md:text-display">Latihan Soal</h1>
        <p className="text-body text-ink2">Pilih subtes, atur sendiri materi dan jumlah soalnya.</p>
      </div>

      {memuat && <MemuatDaftar tinggi={['h-[70px]', 'h-[70px]', 'h-[70px]', 'h-[70px]']} />}
      {galat && <GalatMuat galat={galat} onUlang={ulang} />}

      {data && (
        <ul className="grid gap-2.5 md:grid-cols-2 md:gap-4 lg:grid-cols-3">
          {daftar.map((s) => {
            const ada = s.jumlah_soal_latihan > 0;
            const isi = (
              <Kartu className={`flex h-full items-center gap-3 ${ada ? '' : 'bg-bg'}`}>
                <div className="min-w-0 flex-1">
                  <p className={`text-heading ${ada ? '' : 'text-ink3'}`}>{s.nama}</p>
                  <p className={`text-caption ${ada ? 'text-ink2' : 'text-ink3'}`}>
                    {ada ? `${s.jumlah_soal_latihan} soal latihan · ${s.jumlah_materi} materi` : 'Soal latihan segera hadir'}
                  </p>
                </div>
                {ada && <ChevronRight size={20} strokeWidth={1.75} className="shrink-0 text-ink3" />}
              </Kartu>
            );
            return <li key={s.id}>{ada ? <Link to={`/latihan/subtes/${s.id}`} className="block h-full rounded-card active:scale-[0.99]">{isi}</Link> : isi}</li>;
          })}
        </ul>
      )}
    </main>
  );
}
