import { Link } from 'react-router-dom';
import { Check, ChevronRight } from 'lucide-react';
import { Kartu } from './ui.jsx';

// Daftar sub materi satu materi. Halaman di ponsel, panel kiri di desktop.
export default function DaftarSubmateri({ materi, submateri, aktifId, panel }) {
  const Judul = panel ? 'h2' : 'h1';
  const selesai = submateri.filter((x) => x.selesai).length;
  return (
    <div className="flex flex-col gap-3">
      <div className="flex flex-col gap-1 lg:rounded-card lg:bg-surface lg:p-4 lg:ring-1 lg:ring-line lg:ring-inset">
        <Judul className="text-title lg:text-heading">{materi.nama}</Judul>
        <p className="text-body text-ink2 lg:text-caption">{selesai} dari {submateri.length} sub materi selesai</p>
      </div>
      <Kartu className="py-2 lg:p-2">
        <ul>
          {submateri.map((x, i) => {
            const aktif = x.id === aktifId;
            return (
              <li key={x.id} className={i > 0 ? 'border-t border-line lg:border-t-0' : ''}>
                <Link to={`/submateri/${x.id}`} aria-current={aktif ? 'page' : undefined} className={`flex items-center gap-3 py-3 lg:rounded-field lg:px-3 lg:py-2.5 ${aktif ? 'lg:bg-primary-soft' : 'lg:hover:bg-bg'}`}>
                  <span className={`grid size-7 shrink-0 place-items-center rounded-full ${x.selesai ? 'bg-primary text-white' : 'bg-surface ring-1 ring-inset ring-line'}`} aria-label={x.selesai ? 'Selesai' : 'Belum selesai'}>
                    {x.selesai && <Check size={16} strokeWidth={2} />}
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className={`block text-heading ${aktif ? 'lg:text-primary' : ''}`}>{x.nama}</span>
                    <span className="block text-caption text-ink2">{x.ada_video || x.ada_pdf ? [x.ada_video && 'Video', x.ada_pdf && 'PDF'].filter(Boolean).join(' · ') : 'Segera hadir'}</span>
                  </span>
                  <ChevronRight size={20} strokeWidth={1.75} className="text-ink3 lg:hidden" />
                </Link>
              </li>
            );
          })}
        </ul>
      </Kartu>
    </div>
  );
}
