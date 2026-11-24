import { useEffect, useRef, useState } from 'react';
import { Link } from 'react-router-dom';
import { PenLine, Timer } from 'lucide-react';
import { api } from '../lib/api.js';
import { bulat, tanggalPendek } from '../lib/format.js';
import { BarAtas, Chip, GalatMuat, Kartu, MemuatDaftar, Tombol } from '../components/ui.jsx';

const SARING = [['', 'Semua'], ['try_out', 'Try out'], ['latihan', 'Latihan']];

// Saringan, daftar, dan tombol muat. `dari` = halaman tujuan tombol tutup di layar hasil.
export function IsiRiwayat({ dari }) {
  const [jenis, setJenis] = useState('');
  const [item, setItem] = useState(null);
  const [info, setInfo] = useState({ halaman: 0, jumlah_halaman: 1 });
  const [memuat, setMemuat] = useState(false);
  const [galat, setGalat] = useState(null);

  const tiket = useRef(0);

  async function muat(halaman, j = jenis) {
    const t = ++tiket.current; // balasan dari saringan lama diabaikan
    setMemuat(true);
    setGalat(null);
    try {
      const d = await api(`/riwayat?halaman=${halaman}${j ? `&jenis=${j}` : ''}`);
      if (t !== tiket.current) return;
      setItem((lama) => (halaman === 1 ? d.item : [...(lama || []), ...d.item]));
      setInfo({ halaman: d.halaman, jumlah_halaman: d.jumlah_halaman });
    } catch (e) {
      if (t === tiket.current) setGalat(e);
    } finally {
      if (t === tiket.current) setMemuat(false);
    }
  }

  useEffect(() => {
    setItem(null);
    muat(1, jenis);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [jenis]);

  return (
    <>
        <div className="flex gap-2">
          {SARING.map(([nilai, label]) => (
            <Chip key={nilai} jenis={jenis === nilai ? 'primary' : 'netral'} aktif={jenis === nilai} onClick={() => setJenis(nilai)}>{label}</Chip>
          ))}
        </div>

        {!item && memuat && <MemuatDaftar tinggi={['h-16', 'h-16', 'h-16']} />}
        {galat && <GalatMuat galat={galat} onUlang={() => muat(item ? info.halaman + 1 : 1)} />}

        {item && item.length === 0 && (
          <Kartu className="flex flex-col gap-1">
            <p className="text-heading">Belum ada riwayat</p>
            <p className="text-body text-ink2">Sesi latihan dan try out yang sudah selesai akan muncul di sini.</p>
          </Kartu>
        )}

        {item && item.length > 0 && (
          <Kartu className="py-1">
            <ul>
              {item.map((s) => {
                const to = s.jenis === 'try_out';
                const Ikon = to ? Timer : PenLine;
                return (
                  <li key={s.sesi_id} className="border-t border-line first:border-t-0">
                    <Link to={`/hasil/${s.sesi_id}`} state={{ dari }} className="flex items-center gap-3 py-3">
                      <span className={`grid size-10 shrink-0 place-items-center rounded-xl ${to ? 'bg-lime text-lime-ink' : 'bg-primary-soft text-primary'}`}><Ikon size={20} strokeWidth={1.75} /></span>
                      <span className="min-w-0 flex-1">
                        <span className="line-clamp-2 text-[15px] leading-5 font-semibold">{s.judul}</span>
                        <span className="block text-caption text-ink2">{tanggalPendek(s.selesai_at)}{to ? ' · try out' : ` · ${s.jumlah_soal} soal`}</span>
                      </span>
                      <span className="shrink-0 text-right">
                        <span className="block text-heading font-bold">{to ? (bulat(s.skor) ?? '–') : s.akurasi != null ? `${s.akurasi}%` : '–'}</span>
                        <span className="block text-caption text-ink3">{to ? 'skor' : 'akurasi'}</span>
                      </span>
                    </Link>
                  </li>
                );
              })}
            </ul>
          </Kartu>
        )}

        {item && info.halaman < info.jumlah_halaman && !galat && (
          <Tombol jenis="secondary" memuat={memuat} onClick={() => muat(info.halaman + 1)}>Muat lebih banyak</Tombol>
        )}
        {item && item.length > 0 && <p className="text-caption text-ink3">Hanya sesi yang selesai yang tampil di sini.</p>}
    </>
  );
}

export default function Riwayat() {
  return (
    <>
      <BarAtas judul="Profil" ke="/profil" />
      <main className="flex flex-1 flex-col gap-4 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        <h1 className="text-title">Riwayat</h1>
        <IsiRiwayat dari="/profil/riwayat" />
      </main>
    </>
  );
}
