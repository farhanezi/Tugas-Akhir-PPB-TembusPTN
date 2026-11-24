import { Link } from 'react-router-dom';
import { useApi } from '../lib/useApi.js';
import { bulat, durasiTeks } from '../lib/format.js';
import { Chip, GalatMuat, Kartu, MemuatDaftar, Tombol } from '../components/ui.jsx';

const STATUS = {
  selesai: ['Selesai', 'ok'],
  berjalan: ['Sedang berjalan', 'warn'],
  belum: ['Belum dikerjakan', 'netral'],
};

export function ringkasTryOut(t) {
  return `${t.jumlah_subtes} subtes · ${t.total_soal} soal · ${durasiTeks(t.total_menit)}`;
}

export default function TryOut() {
  const { data, galat, memuat, ulang } = useApi('/try-out');

  return (
    <main className="flex flex-1 flex-col gap-5 px-5 pt-2 pb-6 md:px-4 md:pt-8 lg:px-12">
      <div className="flex flex-col gap-1">
        <h1 className="text-title md:text-display">Try Out</h1>
        <p className="text-body text-ink2">Simulasi penuh mengikuti susunan UTBK-SNBT. Setiap try out hanya bisa dikerjakan sekali.</p>
      </div>

      {memuat && <MemuatDaftar tinggi={['h-40', 'h-40']} />}
      {galat && <GalatMuat galat={galat} onUlang={ulang} />}
      {data && data.length === 0 && (
        <Kartu className="flex flex-col gap-1">
          <p className="text-heading">Belum ada try out</p>
          <p className="text-body text-ink2">Try out akan muncul di sini begitu diterbitkan. Sambil menunggu, kamu bisa berlatih soal per materi.</p>
        </Kartu>
      )}

      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
      {data?.map((t) => {
        const [label, jenis] = STATUS[t.status] || STATUS.belum;
        return (
          <Kartu key={t.id} className="flex flex-col gap-3.5 md:p-5">
            <div className="flex flex-col gap-1">
              <div className="flex items-center gap-3">
                <h2 className="min-w-0 flex-1 text-[18px] leading-6 font-bold tracking-[-0.01em]">{t.judul}</h2>
                <Chip jenis={jenis}>{label}</Chip>
              </div>
              <p className="text-caption text-ink2">{ringkasTryOut(t)}</p>
            </div>
            {t.status === 'selesai' && (
              <p className="flex items-end gap-2">
                <span className="text-[32px] leading-9 font-bold tracking-[-0.02em]">{bulat(t.skor) ?? '–'}</span>
                <span className="pb-1 text-caption text-ink2">skor estimasi</span>
              </p>
            )}
            {t.status === 'berjalan' && <p className="text-caption text-ink2">Waktu subtes yang sudah dimulai tetap berjalan. Lanjutkan sebelum waktunya habis.</p>}
            <div className="mt-auto">
            {t.status === 'selesai'
              ? <Link to={`/hasil/${t.sesi_id}`}><Tombol penuh jenis="secondary" tabIndex={-1}>Lihat hasil</Tombol></Link>
              : <Link to={`/try-out/${t.id}`}><Tombol penuh jenis={t.status === 'berjalan' ? 'primary' : 'secondary'} tabIndex={-1}>{t.status === 'berjalan' ? 'Lanjutkan' : 'Lihat detail'}</Tombol></Link>}
            </div>
          </Kartu>
        );
      })}
      </div>
    </main>
  );
}
