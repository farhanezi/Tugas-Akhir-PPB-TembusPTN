import { useMemo, useState } from 'react';
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom';
import { BookOpen, ChevronDown, Lightbulb, PenLine, RotateCcw } from 'lucide-react';
import { useApi } from '../lib/useApi.js';
import { mulaiLatihan } from '../lib/sesiLatihan.js';
import { bulat, menitDetik } from '../lib/format.js';
import { BarAtas, Chip, GalatMuat, IsiSoal, JarakTarget, JudulBagian, Kartu, MemuatDaftar, Opsi, Pesan, Progres, Stat, Tombol } from '../components/ui.jsx';

const BATAS_AWAL = 20;

// Satu baris soal di daftar pembahasan; diketuk untuk membuka soal, kunci, dan pembahasan.
function BarisSoal({ soal }) {
  const [buka, setBuka] = useState(false);
  const kunci = soal.opsi.find((o) => o.is_benar);
  const jawab = soal.opsi.find((o) => o.id === soal.jawaban_opsi_id);
  const kosong = soal.benar == null;
  const warna = kosong ? 'bg-sunken text-ink2' : soal.benar ? 'bg-ok-soft text-ok' : 'bg-bad-soft text-bad';
  const status = kosong
    ? `Tidak dijawab${kunci ? ` · kunci ${kunci.label}` : ''}`
    : soal.benar ? 'Benar' : `Salah · jawabanmu ${jawab?.label ?? '-'}${kunci ? `, kunci ${kunci.label}` : ''}`;
  return (
    <li className="border-t border-line first:border-t-0">
      <button type="button" onClick={() => setBuka((v) => !v)} aria-expanded={buka} className="flex w-full items-center gap-3 py-3 text-left">
        <span className={`grid size-8 shrink-0 place-items-center rounded-[10px] text-[13px] font-bold ${warna}`}>{soal.nomor}</span>
        <span className="min-w-0 flex-1">
          <span className="line-clamp-2 text-[14px] leading-5 font-medium break-words">{soal.pertanyaan}</span>
          <span className={`block text-caption ${kosong ? 'text-ink3' : soal.benar ? 'text-ok' : 'text-bad'}`}>
            {status}{soal.ragu && <span className="text-warn"> · ragu</span>}
          </span>
        </span>
        <ChevronDown size={18} strokeWidth={1.75} className={`shrink-0 text-ink3 transition-transform duration-150 ${buka ? 'rotate-180' : ''}`} />
      </button>
      {buka && (
        <div className="flex flex-col gap-3 pb-4">
          <IsiSoal soal={soal} />
          <div className="flex flex-col gap-2">
            {soal.opsi.map((o) => (
              <Opsi key={o.id} label={o.label} isi={o.isi} keadaan={o.is_benar ? 'benar' : o.id === soal.jawaban_opsi_id ? 'salah' : undefined} />
            ))}
          </div>
          <div className="flex flex-col gap-2 rounded-2xl bg-sunken p-4">
            <p className="flex items-center gap-2 text-heading"><Lightbulb size={18} strokeWidth={1.75} /> Pembahasan</p>
            <p className="text-body break-words whitespace-pre-line">{soal.pembahasan || 'Pembahasan untuk soal ini belum tersedia.'}</p>
          </div>
        </div>
      )}
    </li>
  );
}

function DaftarSoal({ soal }) {
  const [semua, setSemua] = useState(false);
  const tampil = semua ? soal : soal.slice(0, BATAS_AWAL);
  if (soal.length === 0) return <Kartu><p className="text-body text-ink2">Tidak ada soal di saringan ini.</p></Kartu>;
  return (
    <>
      <Kartu className="py-1"><ul>{tampil.map((s) => <BarisSoal key={s.id} soal={s} />)}</ul></Kartu>
      {soal.length > tampil.length && <Tombol jenis="secondary" onClick={() => setSemua(true)}>Tampilkan {soal.length - tampil.length} soal lainnya</Tombol>}
    </>
  );
}

// `mendatar`: di tablet dan desktop tombol sejajar dengan nama (dipakai di kolom yang lebar).
function BarisLemah({ nama, keterangan, akurasi, jawaban, materiId, subtesId, mendatar }) {
  return (
    <div className={`flex flex-col gap-2.5 ${mendatar ? 'md:flex-row md:items-center md:gap-4' : ''}`}>
      <div className="flex min-w-0 flex-1 items-center gap-3">
        <div className="min-w-0 flex-1">
          <p className="text-heading">{nama}</p>
          <p className="text-caption text-ink2">{keterangan}</p>
        </div>
        {akurasi != null && (
          <div className="shrink-0 text-right">
            <p className="text-heading font-bold text-bad">{akurasi}%</p>
            {jawaban != null && <p className="text-caption text-ink3">{jawaban} jawaban</p>}
          </div>
        )}
      </div>
      <div className={`flex gap-2 ${mendatar ? 'md:shrink-0' : ''}`}>
        <Link to={`/materi/${materiId}`} className={`min-w-0 flex-1 ${mendatar ? 'md:flex-none' : ''}`}><Tombol kecil penuh jenis="secondary" ikon={BookOpen} tabIndex={-1}>Pelajari</Tombol></Link>
        {subtesId && <Link to={`/latihan/subtes/${subtesId}?materi=${materiId}`} className={`min-w-0 flex-1 ${mendatar ? 'md:flex-none' : ''}`}><Tombol kecil penuh jenis="soft" ikon={PenLine} tabIndex={-1}>Latihan</Tombol></Link>}
      </div>
    </div>
  );
}
export { BarisLemah };

function HasilLatihan({ d }) {
  const nav = useNavigate();
  const [hanyaSalah, setHanyaSalah] = useState(false);
  const [sibuk, setSibuk] = useState(false);
  const [galat, setGalat] = useState('');
  const total = d.soal.length;
  const soal = hanyaSalah ? d.soal.filter((s) => s.benar === false) : d.soal;

  async function lagi() {
    setSibuk(true);
    setGalat('');
    try {
      const sesiId = await mulaiLatihan(d.pengaturan);
      nav(`/latihan/sesi/${sesiId}`, { replace: true });
    } catch (e) {
      setGalat(e.message);
      setSibuk(false);
    }
  }

  const lemah = d.materi_lemah.length > 0 && (
        <section className="flex flex-col gap-3">
          <JudulBagian>Paling banyak salah</JudulBagian>
          <Kartu className="flex flex-col gap-4">
            {d.materi_lemah.slice(0, 3).map((m, i) => (
              <div key={m.materi_id} className={`flex items-center gap-3 ${i ? 'border-t border-line pt-4' : ''}`}>
                <div className="min-w-0 flex-1">
                  <p className="text-heading">{m.nama}</p>
                  <p className="text-caption text-ink2">{m.benar} dari {m.benar + m.salah} benar di sesi ini</p>
                </div>
                <Link to={`/materi/${m.materi_id}`}><Tombol kecil jenis="soft" ikon={BookOpen} tabIndex={-1}>Pelajari</Tombol></Link>
              </div>
            ))}
          </Kartu>
        </section>
      );

  return (
    <div className="flex flex-col gap-5 lg:flex-row lg:items-start lg:gap-6">
      <div className="flex min-w-0 flex-1 flex-col gap-5">
      <section className="flex flex-col gap-1.5 rounded-panel bg-panel p-5 md:p-6">
        <h1 className="text-[30px] leading-9 font-bold tracking-[-0.02em] text-white">{d.benar} dari {total} benar</h1>
        <p className="text-body text-panel-text">
          {d.akurasi != null ? `Akurasi ${d.akurasi}% dari soal yang dijawab.` : 'Belum ada soal yang dijawab di sesi ini.'}
          {d.belum_dijawab > 0 && ` ${d.belum_dijawab} soal tidak dijawab.`}
        </p>
      </section>

      <div className="flex gap-2.5">
        <Stat nilai={d.benar} label="Benar" warna="text-ok" />
        <Stat nilai={d.salah} label="Salah" warna="text-bad" />
        <Stat nilai={menitDetik(d.durasi_detik)} label="Menit" />
      </div>

      <div className="contents lg:hidden">{lemah}</div>

      <section className="flex flex-col gap-3">
        <JudulBagian
          kanan={d.salah > 0 && (
            <button type="button" onClick={() => setHanyaSalah((v) => !v)} aria-pressed={hanyaSalah} className="-mr-2 rounded-full px-2 py-1.5 text-[13px] font-semibold text-primary">
              {hanyaSalah ? 'Tampilkan semua' : 'Hanya yang salah'}
            </button>
          )}
        >
          Pembahasan soal
        </JudulBagian>
        <DaftarSoal key={String(hanyaSalah)} soal={soal} />
      </section>
      </div>

      <div className="flex flex-col gap-5 lg:w-[360px] lg:shrink-0">
        <div className="hidden lg:contents">{lemah}</div>
        {galat && <Pesan>{galat}</Pesan>}
        <div className="flex flex-col gap-2.5">
          <Tombol penuh ikon={RotateCcw} memuat={sibuk} onClick={lagi}>Latihan lagi</Tombol>
          <Link to="/latihan"><Tombol penuh jenis="secondary" tabIndex={-1}>Selesai</Tombol></Link>
        </div>
      </div>
    </div>
  );
}

function HasilTryOut({ d }) {
  const [saring, setSaring] = useState('semua');
  const semua = useMemo(() => d.soal.flatMap((g) => g.soal), [d.soal]);
  const jumlah = {
    semua: semua.length,
    salah: semua.filter((s) => s.benar === false).length,
    ragu: semua.filter((s) => s.ragu).length,
    kosong: semua.filter((s) => s.benar == null).length,
  };
  const lolos = (s) => saring === 'semua' || (saring === 'salah' && s.benar === false) || (saring === 'ragu' && s.ragu) || (saring === 'kosong' && s.benar == null);
  const skor = bulat(d.skor_total);
  const t = d.target;
  const selisih = t ? Math.ceil(t.selisih) : null;

  const lemah = d.materi_lemah.length > 0 && (
        <section className="flex flex-col gap-3">
          <JudulBagian>Materi terlemah</JudulBagian>
          <Kartu className="flex flex-col gap-4">
            {d.materi_lemah.slice(0, 3).map((m, i) => (
              <div key={`${m.subtes_id}:${m.materi_id}`} className={i ? 'border-t border-line pt-4' : ''}>
                <BarisLemah nama={m.nama} keterangan={m.subtes_nama} akurasi={m.akurasi} jawaban={m.benar + m.salah} materiId={m.materi_id} subtesId={m.subtes_id} />
              </div>
            ))}
          </Kartu>
        </section>
      );

  return (
    <div className="flex flex-col gap-5 lg:flex-row lg:items-start lg:gap-6">
      <div className="flex min-w-0 flex-1 flex-col gap-5 lg:gap-6">
      <section className="flex flex-col gap-4 rounded-panel bg-panel p-5 md:p-6 lg:flex-row lg:items-center lg:gap-8 lg:p-7">
        <div className="flex min-w-0 flex-1 flex-col gap-0.5">
          <h1 className="flex items-end gap-2.5">
            <span className="text-[48px] leading-[52px] font-bold tracking-[-0.03em] text-white">{skor ?? '–'}</span>
            <span className="pb-2 text-[13px] font-medium text-panel-text">skor {d.skor_label || 'estimasi'}</span>
          </h1>
          <p className="text-body text-panel-text">
            {!t ? 'Pasang target di Profil untuk melihat jarak skormu.'
              : selisih > 0 ? `${selisih} poin lagi menuju target ${t.prodi} ${t.ptn}.`
              : `Skormu sudah mencapai target ${t.prodi} ${t.ptn}.`}
          </p>
        </div>
        {t && skor != null && <div className="lg:w-[300px] lg:shrink-0"><JarakTarget skor={skor} target={bulat(t.skor_target)} /></div>}
      </section>

      <section className="flex flex-col gap-3">
        <JudulBagian>Skor per subtes</JudulBagian>
        <Kartu className="flex flex-col gap-3">
          {d.subtes.map((s, i) => {
            const sk = bulat(s.skor);
            return (
              <div key={s.id} className={`flex flex-col gap-2 md:flex-row md:items-center md:gap-4 ${i ? 'border-t border-line pt-3' : ''}`}>
                <div className="flex items-center gap-3 md:contents">
                  <div className="min-w-0 flex-1 md:w-[260px] md:flex-none">
                    <p className="text-[14px] leading-5 font-semibold">{s.nama}</p>
                    <p className="text-caption text-ink2">{s.benar} dari {s.total} benar{s.durasi_detik != null ? ` · ${Math.max(1, Math.round(s.durasi_detik / 60))} mnt` : ''}</p>
                  </div>
                  <p className="shrink-0 text-[18px] leading-6 font-bold md:order-last md:w-14 md:text-right">{sk ?? '–'}</p>
                </div>
                <Progres className="md:flex-1" nilai={sk != null ? (sk - 200) / 6 : 0} warna={sk != null && sk < 600 ? 'bg-warn-fill' : 'bg-primary'} />
              </div>
            );
          })}
        </Kartu>
      </section>
      <div className="contents lg:hidden">{lemah}</div>

      <section className="flex flex-col gap-3">
        <JudulBagian>Pembahasan</JudulBagian>
        <div className="-mx-5 flex gap-2 overflow-x-auto px-5 py-1 md:mx-0 md:flex-wrap md:px-0">
          {[['semua', 'Semua'], ['salah', 'Salah'], ['ragu', 'Ragu'], ['kosong', 'Kosong']].map(([k, label]) => (
            <Chip key={k} jenis={saring === k ? 'primary' : 'netral'} aktif={saring === k} onClick={() => setSaring(k)}>{label} {jumlah[k]}</Chip>
          ))}
        </div>
        {jumlah[saring] === 0 && <Kartu><p className="text-body text-ink2">Tidak ada soal di saringan ini.</p></Kartu>}
        {d.soal.map((g) => {
          const isi = g.soal.filter(lolos);
          if (isi.length === 0) return null;
          return (
            <div key={g.subtes_id} className="flex flex-col gap-2.5">
              <h3 className="text-caption text-ink2">{g.subtes_nama} · {isi.length} soal</h3>
              <DaftarSoal key={saring} soal={isi} />
            </div>
          );
        })}
      </section>
      </div>

      <div className="flex min-w-0 flex-col gap-5 lg:w-[360px] lg:shrink-0">
        <div className="hidden lg:contents">{lemah}</div>
      <Link to="/try-out"><Tombol penuh jenis="secondary" tabIndex={-1}>Selesai</Tombol></Link>
      </div>
    </div>
  );
}

export default function Hasil() {
  const { id } = useParams();
  const lokasi = useLocation();
  const { data, galat, memuat, ulang } = useApi(`/sesi/${id}/hasil`);
  const tryOut = data?.jenis === 'try_out';
  // Dibuka dari Riwayat: tombol tutup kembali ke Riwayat.
  const ke = lokasi.state?.dari || (tryOut ? '/try-out' : '/latihan');

  return (
    <>
      <BarAtas tutup ke={ke} judul={!data ? 'Hasil' : tryOut ? `Hasil ${data.try_out.judul}` : 'Hasil latihan'} />
      <main className="flex flex-1 flex-col gap-5 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {memuat && <MemuatDaftar tinggi={['h-32', 'h-20', 'h-52']} />}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}
        {data && (tryOut ? <HasilTryOut d={data} /> : <HasilLatihan d={data} />)}
      </main>
    </>
  );
}
