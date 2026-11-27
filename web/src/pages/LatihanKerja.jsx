import { useEffect, useRef, useState } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { ArrowRight, Bookmark, Lightbulb, X } from 'lucide-react';
import { api } from '../lib/api.js';
import { useTersimpan } from '../lib/tersimpan.js';
import { bacaSesi, hapusSesi, simpanSesi } from '../lib/sesiLatihan.js';
import { BarBawah, Dialog, IsiSoal, Opsi, Pesan, Progres, Tombol } from '../components/ui.jsx';

export default function LatihanKerja() {
  const { id } = useParams();
  const nav = useNavigate();
  const [sesi, setSesi] = useState(() => bacaSesi(id));
  const [pilih, setPilih] = useState(null);
  const [sibuk, setSibuk] = useState(false);
  const [galat, setGalat] = useState('');
  const [tanyaKeluar, setTanyaKeluar] = useState(false);
  const [pesanSimpan, setPesanSimpan] = useState('');
  const { ids: tersimpan, ubah } = useTersimpan();
  const atas = useRef(null);

  useEffect(() => { if (sesi) simpanSesi(sesi); }, [sesi]);
  const indeks = sesi?.indeks ?? 0;
  useEffect(() => { atas.current?.scrollIntoView({ block: 'start' }); }, [indeks]);

  if (!sesi) {
    return (
      <main className="flex flex-1 flex-col justify-center gap-4 px-5">
        <h1 className="text-title">Sesi ini tidak bisa dilanjutkan</h1>
        <p className="text-body text-ink2">Soal sesi latihan hanya tersimpan di perangkat tempat sesi dimulai. Mulai sesi baru untuk berlatih lagi.</p>
        <Link to="/latihan"><Tombol penuh tabIndex={-1}>Ke Latihan Soal</Tombol></Link>
      </main>
    );
  }

  const total = sesi.soal.length;
  const soal = sesi.soal[indeks];
  const hasil = sesi.jawab[soal.id]; // terisi setelah diperiksa / disimpan
  const langsung = sesi.umpan_balik === 'langsung';
  const terakhir = indeks === total - 1;
  const opsiBenar = hasil && soal.opsi.find((o) => o.id === hasil.opsi_benar_id);
  const disimpan = tersimpan.has(soal.id);

  async function tutupSesi() {
    setSibuk(true);
    setGalat('');
    try {
      await api(`/latihan/sesi/${id}/selesai`, { method: 'POST' });
      hapusSesi(id);
      nav(`/hasil/${id}`, { replace: true });
    } catch (e) {
      setGalat(e.message);
      setSibuk(false);
    }
  }

  function maju() {
    setGalat('');
    setPilih(null);
    if (terakhir) return tutupSesi();
    setSesi((s) => ({ ...s, indeks: s.indeks + 1 }));
    return undefined;
  }

  async function periksa() {
    setSibuk(true);
    setGalat('');
    try {
      const r = await api(`/latihan/sesi/${id}/jawaban`, { method: 'POST', body: { soal_id: soal.id, opsi_id: pilih } });
      const catat = { opsi_id: pilih, benar: r.benar, opsi_benar_id: r.opsi_benar_id, pembahasan: r.pembahasan };
      setSesi((s) => ({ ...s, jawab: { ...s.jawab, [soal.id]: catat } }));
      setSibuk(false);
      if (!langsung) maju();
    } catch (e) {
      setSibuk(false);
      // Sudah pernah diperiksa (mis. halaman dimuat ulang saat mengirim): jawaban terkunci, lanjut saja.
      if (e.kode === 'SUDAH_DIJAWAB') {
        setSesi((s) => ({ ...s, jawab: { ...s.jawab, [soal.id]: { opsi_id: pilih } } }));
        if (!langsung) maju();
      } else if (e.kode === 'SESI_SELESAI') {
        hapusSesi(id);
        nav(`/hasil/${id}`, { replace: true });
      } else {
        setGalat(e.message);
      }
    }
  }

  const keadaan = (o) => {
    if (!hasil) return pilih === o.id ? 'pilih' : undefined;
    if (!langsung || hasil.benar === undefined) return hasil.opsi_id === o.id ? 'pilih' : undefined;
    if (o.id === hasil.opsi_benar_id) return 'benar';
    if (o.id === hasil.opsi_id) return 'salah';
    return undefined;
  };

  const aksi = hasil ? (
    <Tombol penuh ikonKanan={ArrowRight} memuat={sibuk} onClick={maju}>{terakhir ? 'Lihat hasil' : 'Lanjut'}</Tombol>
  ) : (
    <>
      <Tombol jenis="secondary" disabled={sibuk} onClick={maju}>{terakhir ? 'Lewati dan selesai' : 'Lewati'}</Tombol>
      <Tombol className="min-w-0 flex-1" disabled={pilih == null} memuat={sibuk} onClick={periksa}>
        {langsung ? 'Periksa' : terakhir ? 'Simpan dan selesai' : 'Simpan dan lanjut'}
      </Tombol>
    </>
  );

  return (
    <>
      <header className="sticky top-0 z-10 flex h-14 shrink-0 items-center gap-1 border-line bg-bg px-3 md:h-[72px] md:gap-3 md:border-b md:px-6 lg:px-8">
        <button type="button" onClick={() => setTanyaKeluar(true)} aria-label="Keluar dari latihan" className="grid size-10 place-items-center rounded-full hover:bg-sunken">
          <X size={22} strokeWidth={1.75} />
        </button>
        <div className="flex min-w-0 flex-1 flex-col gap-1.5 md:max-w-[420px]">
          <p className="text-caption text-ink2">Soal {indeks + 1} dari {total}</p>
          <Progres nilai={((indeks + (hasil ? 1 : 0)) / total) * 100} />
        </div>
        <button
          type="button"
          onClick={async () => { setPesanSimpan(''); if (!(await ubah(soal.id, Number(id)))) setPesanSimpan('Simpanan soal gagal diperbarui. Periksa koneksimu lalu coba lagi.'); }}
          aria-pressed={disimpan}
          aria-label={disimpan ? 'Hapus dari simpanan' : 'Simpan soal'}
          title={disimpan ? 'Hapus dari simpanan' : 'Simpan soal'}
          className={`grid size-10 shrink-0 place-items-center rounded-full hover:bg-sunken md:ml-auto ${disimpan ? 'text-primary' : 'text-ink2'}`}
        >
          <Bookmark size={22} strokeWidth={1.75} fill={disimpan ? 'currentColor' : 'none'} />
        </button>
      </header>

      {/* Ponsel dan tablet: satu kolom dengan bar bawah. Desktop: soal di kiri, pembahasan dan aksi di kanan. */}
      <main ref={atas} className="mx-auto flex w-full max-w-[720px] flex-1 scroll-mt-14 flex-col gap-4 px-5 pt-3 pb-6 md:scroll-mt-[72px] md:pt-8 lg:max-w-none lg:flex-row lg:items-start lg:justify-center lg:gap-10 lg:pt-12">
        <div className="flex flex-col gap-4 lg:w-[680px] lg:gap-5">
          <IsiSoal soal={soal} besar />
          <div className="flex flex-col gap-2.5">
            {soal.opsi.map((o) => (
              <Opsi key={o.id} label={o.label} isi={o.isi} keadaan={keadaan(o)} disabled={Boolean(hasil) || sibuk} onClick={() => setPilih(o.id)} />
            ))}
          </div>
        </div>

        <div className="flex flex-col gap-4 lg:w-[400px] lg:shrink-0">
          {hasil && langsung && hasil.benar !== undefined && (
            <section className={`flex flex-col gap-2.5 rounded-2xl p-4 lg:rounded-card lg:p-5 ${hasil.benar ? 'bg-ok-soft' : 'bg-bad-soft'}`} aria-live="polite">
              <h2 className={`text-heading ${hasil.benar ? 'text-ok' : 'text-bad'}`}>
                {hasil.benar ? 'Tepat!' : `Belum tepat.${opsiBenar ? ` Jawaban benar: ${opsiBenar.label}` : ''}`}
              </h2>
              {hasil.pembahasan && (
                <>
                  <div className={`border-t ${hasil.benar ? 'border-ok/20' : 'border-bad/20'}`} />
                  <p className="flex items-center gap-2 text-heading"><Lightbulb size={18} strokeWidth={1.75} /> Pembahasan</p>
                  <p className="text-body break-words whitespace-pre-line">{hasil.pembahasan}</p>
                </>
              )}
            </section>
          )}
          {hasil && langsung && hasil.benar === undefined && <Pesan jenis="ok">Jawaban soal ini sudah tersimpan. Pembahasannya ada di halaman hasil.</Pesan>}
          {galat && <Pesan>{galat}</Pesan>}
          {pesanSimpan && <Pesan>{pesanSimpan}</Pesan>}
          <div className="hidden gap-2.5 lg:flex">{aksi}</div>
          {!hasil && <p className="hidden text-caption text-ink3 lg:block">{langsung ? 'Pembahasan muncul di sini setelah kamu menekan Periksa.' : 'Pembahasan baru terlihat setelah sesi selesai.'}</p>}
        </div>
      </main>

      <BarBawah className="flex gap-2.5 lg:hidden">
        <div className="mx-auto flex w-full max-w-[680px] gap-2.5">{aksi}</div>
      </BarBawah>

      <Dialog
        buka={tanyaKeluar}
        judul="Keluar dari latihan?"
        onTutup={() => setTanyaKeluar(false)}
        aksi={(
          <>
            <Tombol penuh onClick={() => setTanyaKeluar(false)}>Lanjut mengerjakan</Tombol>
            <Tombol penuh jenis="secondary" onClick={() => { hapusSesi(id); nav('/latihan', { replace: true }); }}>Keluar</Tombol>
          </>
        )}
      >
        Sesi yang belum selesai tidak masuk Riwayat, dan soal yang tersisa tidak bisa dilanjutkan.
      </Dialog>
    </>
  );
}
