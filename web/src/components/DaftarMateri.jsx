import { Link } from 'react-router-dom';
import { Check, ChevronRight, PenLine } from 'lucide-react';
import { Kartu, Progres, Tombol } from './ui.jsx';

// Daftar materi satu subtes. Dipakai sebagai halaman di ponsel dan sebagai panel kiri di desktop.
// `aktifId` menandai materi yang sedang dibuka (hanya di panel desktop).
export default function DaftarMateri({ subtes, materi, aktifId, panel }) {
  const selesai = materi.filter((m) => m.selesai).length;
  const stok = materi.reduce((n, m) => n + m.jumlah_soal_latihan, 0);
  const Judul = panel ? 'h2' : 'h1';

  return (
    <div className="flex flex-col gap-5 lg:gap-3">
      <div className="flex flex-col gap-2.5 lg:rounded-card lg:bg-surface lg:p-4 lg:ring-1 lg:ring-line lg:ring-inset">
        <Judul className="text-title lg:text-heading">{subtes.nama}</Judul>
        {materi.length > 0 ? (
          <>
            <p className="text-body text-ink2 lg:text-caption">
              {selesai} dari {materi.length} materi selesai<span className="lg:hidden">. Urutan dari dasar ke lanjut, tapi kamu bebas memilih.</span>
            </p>
            <Progres nilai={(selesai / materi.length) * 100} />
          </>
        ) : (
          <p className="text-body text-ink2">Materi untuk subtes ini segera hadir.</p>
        )}
      </div>

      {materi.length > 0 && (
        <Kartu className="py-2 lg:p-2">
          <ul>
            {materi.map((m, i) => {
              const aktif = m.id === aktifId;
              return (
                <li key={m.id} className={i > 0 ? 'border-t border-line lg:border-t-0' : ''}>
                  <Link to={`/materi/${m.id}`} aria-current={aktif ? 'page' : undefined} className={`flex items-center gap-3 py-3 lg:rounded-field lg:px-3 lg:py-2.5 ${aktif ? 'lg:bg-primary-soft' : 'lg:hover:bg-bg'}`}>
                    <span className={`grid size-7 shrink-0 place-items-center rounded-full ${m.selesai ? 'bg-primary text-white' : 'bg-surface ring-1 ring-inset ring-line'}`} aria-label={m.selesai ? 'Selesai' : 'Belum selesai'}>
                      {m.selesai && <Check size={16} strokeWidth={2} />}
                    </span>
                    <span className="min-w-0 flex-1">
                      <span className={`block text-heading ${aktif ? 'lg:text-primary' : ''}`}>{m.nama}</span>
                      <span className="block text-caption text-ink2">
                        {[m.jumlah_submateri > 0 ? `${m.submateri_selesai}/${m.jumlah_submateri} sub materi` : null, m.jumlah_soal_latihan > 0 ? `${m.jumlah_soal_latihan} soal latihan` : 'Soal latihan segera hadir'].filter(Boolean).join(' · ')}
                      </span>
                    </span>
                    <ChevronRight size={20} strokeWidth={1.75} className="text-ink3 lg:hidden" />
                  </Link>
                </li>
              );
            })}
          </ul>
        </Kartu>
      )}

      {stok > 0 && (
        <Link to={`/latihan/subtes/${subtes.id}`}><Tombol jenis="soft" penuh ikon={PenLine} tabIndex={-1}>Latihan subtes ini</Tombol></Link>
      )}
    </div>
  );
}
