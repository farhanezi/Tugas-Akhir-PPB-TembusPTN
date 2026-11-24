import { useEffect, useMemo, useState } from 'react';
import { useNavigate, useParams, useSearchParams } from 'react-router-dom';
import { ArrowRight, Check } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { mulaiLatihan } from '../lib/sesiLatihan.js';
import { menit } from '../lib/format.js';
import { BarAtas, BarBawah, GalatMuat, Kartu, MemuatDaftar, Pesan, Tombol } from '../components/ui.jsx';

const PILIHAN = [5, 10, 20, 30];
const MAKS = 50; // batas API

function Segmen({ aktif, mati, onClick, children }) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={mati}
      aria-pressed={aktif}
      className={`h-11 min-w-0 flex-1 rounded-xl text-[15px] font-semibold transition-colors duration-150 ${
        aktif ? 'bg-primary text-white' : mati ? 'cursor-not-allowed bg-sunken text-ink3' : 'bg-surface text-ink ring-1 ring-inset ring-line hover:bg-bg'
      }`}
    >
      {children}
    </button>
  );
}

export default function LatihanAtur() {
  const { id } = useParams();
  const [params] = useSearchParams();
  const nav = useNavigate();
  const subtes = useApi('/subtes');
  const materi = useApi(`/subtes/${id}/materi`);

  const [pilih, setPilih] = useState(null); // Set id materi
  const [jumlah, setJumlah] = useState(10);
  const [umpan, setUmpan] = useState('langsung');
  const [sibuk, setSibuk] = useState(false);
  const [galat, setGalat] = useState('');

  const adaSoal = useMemo(() => (materi.data?.materi || []).filter((m) => m.jumlah_soal_latihan > 0), [materi.data]);

  // Pilihan awal: materi dari tautan (?materi=) bila ada, selain itu semua materi yang punya soal.
  useEffect(() => {
    if (!materi.data || pilih) return;
    const diminta = Number(params.get('materi'));
    const awal = adaSoal.some((m) => m.id === diminta) ? [diminta] : adaSoal.map((m) => m.id);
    setPilih(new Set(awal));
  }, [materi.data, adaSoal, params, pilih]);

  const stok = adaSoal.filter((m) => pilih?.has(m.id)).reduce((n, m) => n + m.jumlah_soal_latihan, 0);
  const batas = Math.min(stok, MAKS);
  const pilihan = batas > 0 && batas < PILIHAN[0] ? [batas] : PILIHAN;

  // Jumlah mengikuti stok: turun ke pilihan terbesar yang masih cukup.
  useEffect(() => {
    if (!pilih || batas === 0 || jumlah <= batas) return;
    setJumlah([...pilihan].reverse().find((n) => n <= batas) || batas);
  }, [pilih, batas, jumlah, pilihan]);

  const info = subtes.data?.find((s) => String(s.id) === String(id));
  const perSoal = info && info.jumlah_soal_resmi ? info.durasi_menit / info.jumlah_soal_resmi : null;
  const semua = pilih && adaSoal.length > 0 && adaSoal.every((m) => pilih.has(m.id));
  const bisa = pilih && pilih.size > 0 && jumlah <= batas && batas > 0;

  function ubah(mid) {
    const baru = new Set(pilih);
    baru.has(mid) ? baru.delete(mid) : baru.add(mid);
    setPilih(baru);
  }

  async function mulai() {
    setSibuk(true);
    setGalat('');
    try {
      const sesiId = await mulaiLatihan({ materi_ids: [...pilih], jumlah, umpan_balik: umpan });
      nav(`/latihan/sesi/${sesiId}`, { replace: true });
    } catch (e) {
      setGalat(e.message);
      setSibuk(false);
      if (e.kode === 'STOK_KURANG') materi.ulang();
    }
  }

  return (
    <>
      <BarAtas judul="Latihan Soal" ke="/latihan" />
      <main className="flex flex-1 flex-col gap-4 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {materi.memuat && <MemuatDaftar tinggi={['h-14', 'h-52', 'h-28']} />}
        {materi.galat && <GalatMuat galat={materi.galat} onUlang={materi.ulang} />}

        {materi.data && pilih && (
          <>
            <div className="flex flex-col gap-1">
              <h1 className="text-title md:text-display">{materi.data.subtes.nama}</h1>
              <p className="text-body text-ink2">{adaSoal.length > 0 ? 'Atur sesi latihanmu.' : 'Soal latihan untuk subtes ini segera hadir.'}</p>
            </div>

            {adaSoal.length > 0 && (
              <div className="flex flex-col gap-4 lg:flex-row lg:items-start lg:gap-6">
                <div className="flex min-w-0 flex-1 flex-col gap-4">
                <Kartu className="flex flex-col gap-1 md:p-5">
                  <div className="flex items-center">
                    <h2 className="flex-1 text-heading">Materi</h2>
                    <button type="button" onClick={() => setPilih(new Set(semua ? [] : adaSoal.map((m) => m.id)))} className="-mr-2 rounded-full px-2 py-1.5 text-[13px] font-semibold text-primary">
                      {semua ? 'Kosongkan' : 'Pilih semua'}
                    </button>
                  </div>
                  <ul>
                    {materi.data.materi.map((m) => {
                      const kosong = m.jumlah_soal_latihan === 0;
                      const on = pilih.has(m.id);
                      return (
                        <li key={m.id}>
                          <label className={`flex items-center gap-3 py-2.5 ${kosong ? 'text-ink3' : 'cursor-pointer'}`}>
                            <input type="checkbox" className="peer sr-only" checked={on} disabled={kosong} onChange={() => ubah(m.id)} />
                            <span className={`grid size-[22px] shrink-0 place-items-center rounded-md peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-primary ${on ? 'bg-primary text-white' : 'bg-surface ring-[1.5px] ring-inset ring-line'}`}>
                              {on && <Check size={14} strokeWidth={2.5} />}
                            </span>
                            <span className={`min-w-0 flex-1 text-[15px] leading-5 ${on ? 'font-semibold' : ''}`}>{m.nama}</span>
                            <span className="shrink-0 text-caption text-ink3">{kosong ? 'segera hadir' : `${m.jumlah_soal_latihan} soal`}</span>
                          </label>
                        </li>
                      );
                    })}
                  </ul>
                </Kartu>

                <div className="grid gap-4 md:grid-cols-2">
                <Kartu className="flex flex-col gap-2.5 md:p-5">
                  <h2 className="text-heading">Jumlah soal</h2>
                  <div className="flex gap-2">
                    {pilihan.map((n) => <Segmen key={n} aktif={jumlah === n} mati={n > batas} onClick={() => setJumlah(n)}>{n}</Segmen>)}
                  </div>
                  <p className="text-caption text-ink2">{pilih.size === 0 ? 'Pilih minimal satu materi.' : `${stok} soal tersedia dari materi yang dipilih.`}</p>
                </Kartu>

                <Kartu className="flex flex-col gap-2.5 md:p-5">
                  <h2 className="text-heading">Pembahasan</h2>
                  <div className="flex gap-2">
                    <Segmen aktif={umpan === 'langsung'} onClick={() => setUmpan('langsung')}>Langsung</Segmen>
                    <Segmen aktif={umpan === 'akhir'} onClick={() => setUmpan('akhir')}>Di akhir</Segmen>
                  </div>
                  <p className="text-caption text-ink2">
                    {umpan === 'langsung' ? 'Setiap jawaban langsung diperiksa dan dibahas.' : 'Jawaban dan pembahasan baru terlihat setelah sesi selesai.'}
                  </p>
                </Kartu>
                </div>

                {galat && <Pesan>{galat}</Pesan>}
                </div>

                {/* Desktop: ringkasan sesi dan tombol mulai di kolom kanan (pengganti bar bawah). */}
                <aside className="hidden w-[360px] shrink-0 flex-col gap-4 rounded-panel bg-panel p-6 lg:flex" aria-label="Ringkasan sesi">
                  <p className="text-[13px] leading-[18px] font-semibold text-panel-text">Ringkasan sesi</p>
                  <div className="flex flex-col gap-0.5">
                    <p className="text-[34px] leading-10 font-bold tracking-[-0.02em] text-white">{bisa ? `${jumlah} soal` : 'Belum bisa mulai'}</p>
                    <p className="text-body text-panel-text">
                      {bisa
                        ? `${perSoal ? `sekitar ${menit(Math.max(1, Math.round(jumlah * perSoal)))} menit · ` : ''}${pilih.size} materi · pembahasan ${umpan === 'langsung' ? 'langsung' : 'di akhir'}`
                        : 'Pilih minimal satu materi yang punya soal.'}
                    </p>
                  </div>
                  <Tombol jenis="lime" penuh ikonKanan={ArrowRight} disabled={!bisa} memuat={sibuk} onClick={mulai}>Mulai latihan</Tombol>
                </aside>
              </div>
            )}
          </>
        )}
      </main>

      {materi.data && pilih && adaSoal.length > 0 && (
        <BarBawah className="flex items-center gap-4 lg:hidden">
          <div className="min-w-0 flex-1">
            <p className="text-heading font-bold">{bisa ? `${jumlah} soal` : 'Belum bisa mulai'}</p>
            <p className="text-caption text-ink2">{bisa && perSoal ? `sekitar ${menit(Math.max(1, Math.round(jumlah * perSoal)))} menit` : ' '}</p>
          </div>
          <Tombol ikonKanan={ArrowRight} disabled={!bisa} memuat={sibuk} onClick={mulai}>Mulai latihan</Tombol>
        </BarBawah>
      )}
    </>
  );
}
