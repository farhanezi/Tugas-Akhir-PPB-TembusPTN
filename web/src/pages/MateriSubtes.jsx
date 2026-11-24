import { useParams } from 'react-router-dom';
import { BookOpen } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { BarAtas, GalatMuat, MemuatDaftar } from '../components/ui.jsx';
import DaftarMateri from '../components/DaftarMateri.jsx';

export default function MateriSubtes() {
  const { id } = useParams();
  const { data, galat, memuat, ulang } = useApi(`/subtes/${id}/materi`);

  return (
    <>
      <BarAtas judul="Materi" ke="/materi" />
      <main className="flex flex-1 flex-col gap-5 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {memuat && <MemuatDaftar tinggi={['h-16', 'h-52']} />}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}
        {data && (
          <div className="lg:flex lg:items-start lg:gap-6">
            <div className="lg:w-[340px] lg:shrink-0"><DaftarMateri subtes={data.subtes} materi={data.materi} /></div>
            {/* Desktop: kolom kanan menunggu materi dipilih. */}
            <div className="hidden min-h-[320px] flex-1 flex-col items-center justify-center gap-2 rounded-card border border-dashed border-line text-center text-ink2 lg:flex">
              <BookOpen size={28} strokeWidth={1.75} />
              <p className="text-heading text-ink">Pilih materi untuk mulai belajar</p>
              <p className="text-body">Video dan catatan materi tampil di sini.</p>
            </div>
          </div>
        )}
      </main>
    </>
  );
}
