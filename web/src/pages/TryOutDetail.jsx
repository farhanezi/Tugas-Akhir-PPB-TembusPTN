import { useState } from 'react';
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom';
import { ArrowRight, Check, Clock, ListOrdered, Lock, Play } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { bulat, durasiSingkat, menit } from '../lib/format.js';
import { BarAtas, BarBawah, Chip, Dialog, GalatMuat, Kartu, MemuatDaftar, Pesan, Stat, Tombol } from '../components/ui.jsx';

const KELOMPOK = ['Tes Potensi Skolastik', 'Tes Literasi'];
const STATUS = { selesai: ['Selesai', 'ok'], berjalan: ['Sedang berjalan', 'warn'], belum: ['Belum dikerjakan', 'netral'] };

function BarisSubtes({ s }) {
  const kunci = s.status === 'terkunci';
  let ikon; let kanan = null;
  if (s.status === 'selesai') {
    ikon = <span className="grid size-7 shrink-0 place-items-center rounded-full bg-primary text-white"><Check size={16} strokeWidth={2} /></span>;
    kanan = <span className="shrink-0 text-right"><span className="block text-heading font-bold">{bulat(s.skor) ?? '–'}</span><span className="block text-caption text-ok">Selesai</span></span>;
  } else if (!kunci) {
    ikon = <span className="grid size-7 shrink-0 place-items-center rounded-full bg-lime text-lime-ink"><Play size={13} strokeWidth={2} /></span>;
    kanan = <Chip jenis="lime">{s.status === 'berjalan' ? 'Berjalan' : 'Berikutnya'}</Chip>;
  } else {
    ikon = <span className="grid size-7 shrink-0 place-items-center rounded-full bg-sunken text-ink3"><Lock size={14} strokeWidth={1.75} /></span>;
  }
  return (
    <li className="flex items-center gap-3 border-t border-line py-3 first:border-t-0">
      {ikon}
      <div className="min-w-0 flex-1">
        <p className={`text-[15px] leading-5 font-semibold ${kunci ? 'text-ink3' : ''}`}>{s.nama}</p>
        <p className={`text-caption ${kunci ? 'text-ink3' : 'text-ink2'}`}>{s.jumlah_soal} soal · {menit(s.durasi_menit)} menit</p>
      </div>
      {kanan}
    </li>
  );
}

export default function TryOutDetail() {
  const { id } = useParams();
  const nav = useNavigate();
  const lokasi = useLocation();
  const { data, galat, memuat, ulang } = useApi(`/try-out/${id}`);
  const [tanya, setTanya] = useState(false);

  const kini = data?.subtes.find((s) => s.status === 'berjalan' || s.status === 'aktif');
  const [label, jenis] = STATUS[data?.status] || STATUS.belum;

  // Tombol utama: penuh di bar bawah (ponsel), sebesar isinya di desktop.
  const aksi = data && (data.status === 'selesai' || kini) && ((penuh) => {
    const p = { penuh, className: penuh ? 'px-4' : undefined, ikonKanan: penuh ? undefined : ArrowRight };
    if (data.status === 'selesai') return <Link to={`/hasil/${data.sesi_id}`}><Tombol {...p} tabIndex={-1}>Lihat hasil · skor {bulat(data.skor) ?? '–'}</Tombol></Link>;
    return kini.status === 'berjalan'
      ? <Tombol {...p} onClick={() => nav(`/try-out/${id}/subtes/${kini.id}`)}><span className="min-w-0 truncate">Lanjutkan: {kini.nama}</span></Tombol>
      : <Tombol {...p} onClick={() => setTanya(true)}><span className="min-w-0 truncate">Mulai: {kini.nama}</span></Tombol>;
  });

  return (
    <>
      <BarAtas judul="Try Out" ke="/try-out" />
      <main className="flex flex-1 flex-col gap-5 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {memuat && <MemuatDaftar tinggi={['h-28', 'h-20', 'h-64']} />}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}

        {data && (
          <div className="flex flex-col gap-5 lg:flex-row lg:items-start lg:gap-6">
            <div className="flex min-w-0 flex-1 flex-col gap-5">
            {lokasi.state?.pesan && <Pesan jenis="ok">{lokasi.state.pesan}</Pesan>}
            <div className="flex flex-col items-start gap-2">
              <Chip jenis={jenis}>{label}</Chip>
              <h1 className="text-display lg:text-[34px] lg:leading-10">{data.judul}</h1>
              <p className="text-body text-ink2">{data.deskripsi || 'Simulasi penuh UTBK-SNBT.'} Subtes dikerjakan berurutan dan waktunya tidak bisa dijeda.</p>
            </div>

            <div className="flex gap-2.5">
              <Stat nilai={data.subtes.length} label="Subtes" />
              <Stat nilai={data.total_soal} label="Soal" />
              <Stat nilai={durasiSingkat(data.total_menit)} label="Durasi" />
            </div>

            {/* Tablet dan desktop: aturan dan tombol tampil di halaman (di ponsel ada di bar bawah dan dialog). */}
            <Kartu className="hidden flex-col gap-3.5 p-5 md:flex">
              <h2 className="text-heading">Sebelum mulai</h2>
              {[[Clock, 'Waktu subtes langsung berjalan dan tidak bisa dijeda, termasuk saat aplikasi ditutup.'], [ListOrdered, 'Subtes dikerjakan berurutan sesuai susunan UTBK-SNBT.'], [Lock, 'Subtes yang sudah selesai tidak bisa dibuka lagi.']].map(([Ikon, teks]) => (
                <p key={teks} className="flex items-center gap-3 text-body">
                  <span className="grid size-9 shrink-0 place-items-center rounded-xl bg-bg text-ink2"><Ikon size={18} strokeWidth={1.75} /></span>{teks}
                </p>
              ))}
            </Kartu>
            {aksi && <div className="hidden lg:block">{aksi(false)}</div>}
            </div>

            <div className="flex flex-col gap-5 lg:w-[460px] lg:shrink-0 lg:gap-4">

            {KELOMPOK.map((k) => {
              const isi = data.subtes.filter((s) => s.kelompok === k);
              if (isi.length === 0) return null;
              return (
                <section key={k} className="flex flex-col gap-2.5" aria-label={k}>
                  <h2 className="text-caption text-ink2">{k}</h2>
                  <Kartu className="py-1"><ul>{isi.map((s) => <BarisSubtes key={s.id} s={s} />)}</ul></Kartu>
                </section>
              );
            })}
            </div>
          </div>
        )}
      </main>

      {aksi && <BarBawah className="lg:hidden">{aksi(true)}</BarBawah>}

      {kini && (
        <Dialog
          buka={tanya}
          judul={`Mulai ${kini.nama}?`}
          onTutup={() => setTanya(false)}
          aksi={(
            <>
              <Tombol penuh onClick={() => nav(`/try-out/${id}/subtes/${kini.id}`)}>Mulai sekarang</Tombol>
              <Tombol penuh jenis="secondary" onClick={() => setTanya(false)}>Nanti dulu</Tombol>
            </>
          )}
        >
          {kini.jumlah_soal} soal dalam {menit(kini.durasi_menit)} menit. Waktu langsung berjalan dan tidak bisa dijeda, termasuk saat aplikasi ditutup. Subtes yang sudah selesai tidak bisa dibuka lagi.
        </Dialog>
      )}
    </>
  );
}
