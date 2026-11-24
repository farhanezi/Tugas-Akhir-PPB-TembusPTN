import { useCallback, useEffect, useRef, useState } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { Check, ChevronLeft, ChevronRight, Clock, LayoutGrid, X } from 'lucide-react';
import { api } from '../lib/api.js';
import { bulat, menitDetik } from '../lib/format.js';
import { BarBawah, Dialog, IsiSoal, Kerangka, Opsi, Pesan, Tombol } from '../components/ui.jsx';

const PERINGATAN_DETIK = 300; // 5 menit terakhir: timer berubah merah

export default function TryOutKerja() {
  const { id, subtesId } = useParams();
  const nav = useNavigate();
  const [sesiId, setSesiId] = useState(null);
  const [data, setData] = useState(null);
  const [galat, setGalat] = useState(null);
  const [jawab, setJawab] = useState({}); // soal_id -> { opsi_id, ragu }
  const [indeks, setIndeks] = useState(0);
  const [sisa, setSisa] = useState(null);
  const [panel, setPanel] = useState(false);
  const [tanya, setTanya] = useState(false);
  const [simpan, setSimpan] = useState('tersimpan'); // tersimpan | menyimpan | gagal
  const [menutup, setMenutup] = useState(false);
  const antre = useRef(Promise.resolve());
  const tertunda = useRef(0);
  const gagalTerakhir = useRef(null);
  const sudahTutup = useRef(false);
  const atas = useRef(null);

  // 1) pastikan sesi try out ada, 2) mulai (atau lanjutkan) subtes: timer dihitung server.
  useEffect(() => {
    let batal = false;
    (async () => {
      try {
        const s = await api(`/try-out/${id}/sesi`, { method: 'POST' });
        const d = await api(`/try-out/sesi/${s.sesi_id}/subtes/${subtesId}/mulai`, { method: 'POST' });
        if (batal) return;
        const peta = {};
        for (const j of d.jawaban) peta[j.soal_id] = { opsi_id: j.opsi_id, ragu: j.ragu };
        // selisih jam perangkat dengan jam server, supaya hitung mundur tidak ikut jam perangkat yang salah
        d.selisih = Date.now() - new Date(d.waktu_server).getTime();
        setSesiId(s.sesi_id);
        setJawab(peta);
        setData(d);
        const kosong = d.soal.findIndex((x) => peta[x.id]?.opsi_id == null);
        setIndeks(kosong === -1 ? 0 : kosong);
      } catch (e) {
        if (!batal) setGalat(e);
      }
    })();
    return () => { batal = true; };
  }, [id, subtesId]);

  const tutup = useCallback(async (karenaWaktu) => {
    if (sudahTutup.current || !sesiId) return;
    sudahTutup.current = true;
    setMenutup(true);
    setPanel(false);
    setTanya(false);
    try {
      await antre.current.catch(() => {});
      const r = await api(`/try-out/sesi/${sesiId}/subtes/${subtesId}/selesai`, { method: 'POST' });
      if (r.sesi_selesai) return nav(`/hasil/${sesiId}`, { replace: true });
      const awal = karenaWaktu ? 'Waktu habis. ' : '';
      nav(`/try-out/${id}`, { replace: true, state: { pesan: `${awal}${data?.subtes.nama || 'Subtes'} selesai dengan skor estimasi ${bulat(r.skor_subtes) ?? '–'}.` } });
    } catch (e) {
      sudahTutup.current = false;
      setMenutup(false);
      setGalat(e);
    }
    return undefined;
  }, [sesiId, subtesId, id, nav, data]);

  // Hitung mundur dari batas_at milik server.
  useEffect(() => {
    if (!data) return undefined;
    const batas = new Date(data.batas_at).getTime();
    const hitung = () => {
      const d = Math.ceil((batas - (Date.now() - data.selisih)) / 1000);
      setSisa(Math.max(0, d));
      if (d <= 0) tutup(true);
    };
    hitung();
    const t = setInterval(hitung, 500);
    return () => clearInterval(t);
  }, [data, tutup]);

  useEffect(() => { atas.current?.scrollIntoView({ block: 'start' }); }, [indeks]);

  // Simpan otomatis, satu per satu sesuai urutan supaya jawaban terakhir yang menang.
  const kirim = useCallback((body) => {
    tertunda.current += 1;
    setSimpan('menyimpan');
    antre.current = antre.current.catch(() => {}).then(async () => {
      try {
        await api(`/try-out/sesi/${sesiId}/jawaban`, { method: 'PUT', body });
        gagalTerakhir.current = null;
      } catch (e) {
        if (e.kode === 'WAKTU_HABIS' || e.kode === 'SUBTES_TERKUNCI') { tutup(true); return; }
        gagalTerakhir.current = body;
      } finally {
        tertunda.current -= 1;
        if (tertunda.current === 0) setSimpan(gagalTerakhir.current ? 'gagal' : 'tersimpan');
      }
    });
  }, [sesiId, tutup]);

  function ubah(soalId, baru) {
    const kini = { opsi_id: null, ragu: false, ...jawab[soalId], ...baru };
    setJawab((j) => ({ ...j, [soalId]: kini }));
    kirim({ soal_id: soalId, opsi_id: kini.opsi_id, ragu: kini.ragu });
  }

  if (galat && !data) {
    return (
      <main className="flex flex-1 flex-col justify-center gap-4 px-5">
        <h1 className="text-title">Subtes tidak bisa dibuka</h1>
        <Pesan>{galat.message}</Pesan>
        <Link to={`/try-out/${id}`}><Tombol penuh tabIndex={-1}>Kembali ke try out</Tombol></Link>
      </main>
    );
  }
  if (!data) {
    return (
      <>
        <div className="h-[72px] bg-panel" />
        <div className="flex flex-col gap-3 p-5" role="status" aria-label="Memuat"><Kerangka className="h-24" /><Kerangka className="h-14" /><Kerangka className="h-14" /><Kerangka className="h-14" /></div>
      </>
    );
  }

  const total = data.soal.length;
  const soal = data.soal[indeks];
  const j = jawab[soal?.id] || {};
  const dijawab = data.soal.filter((s) => jawab[s.id]?.opsi_id != null).length;
  const ragu = data.soal.filter((s) => jawab[s.id]?.ragu).length;
  const kritis = sisa != null && sisa <= PERINGATAN_DETIK;

  const kisi = (
    <>
      <ul className="flex flex-wrap gap-x-4 gap-y-1.5 text-caption text-ink2">
        <li className="flex items-center gap-1.5"><span className="size-3.5 rounded bg-primary" /> Dijawab {dijawab}</li>
        <li className="flex items-center gap-1.5"><span className="size-3.5 rounded bg-warn-fill" /> Ragu {ragu}</li>
        <li className="flex items-center gap-1.5"><span className="size-3.5 rounded bg-surface ring-1 ring-inset ring-line" /> Kosong {total - dijawab}</li>
      </ul>
      <ol className="grid grid-cols-5 gap-2.5 md:grid-cols-8 lg:grid-cols-5 lg:gap-2">
        {data.soal.map((s, i) => {
          const x = jawab[s.id] || {};
          const kelas = i === indeks ? 'bg-primary-soft text-primary ring-2 ring-inset ring-primary'
            : x.ragu ? 'bg-warn-fill text-ink'
            : x.opsi_id != null ? 'bg-primary text-white'
            : 'bg-surface text-ink2 ring-1 ring-inset ring-line';
          const ket = x.ragu ? 'ragu-ragu' : x.opsi_id != null ? 'dijawab' : 'kosong';
          return (
            <li key={s.id}>
              <button type="button" onClick={() => { setIndeks(i); setPanel(false); }} aria-label={`Soal ${i + 1}, ${ket}`} aria-current={i === indeks ? 'true' : undefined} className={`h-13 w-full rounded-field text-[16px] font-bold lg:h-[46px] lg:rounded-xl lg:text-[15px] ${kelas}`}>{i + 1}</button>
            </li>
          );
        })}
      </ol>
    </>
  );
  const catatan = `${total - dijawab > 0 ? `${total - dijawab} soal belum dijawab. ` : 'Semua soal sudah dijawab. '}Subtes yang selesai tidak bisa dibuka lagi.`;

  return (
    <>
      <header className="sticky top-0 z-20 flex shrink-0 items-center gap-3 bg-panel px-5 pt-[max(env(safe-area-inset-top),12px)] pb-3.5 md:h-[72px] md:py-0 lg:px-10">
        <div className="min-w-0 flex-1">
          <p className="truncate text-[15px] leading-5 font-semibold text-white md:text-[16px] md:leading-[22px]">{data.subtes.nama}</p>
          <p className="text-caption text-panel-text">
            <span className={panel ? 'lg:hidden' : 'hidden'}>{dijawab} dari {total} dijawab</span>
            <span className={panel ? 'hidden lg:inline' : ''}>Soal {indeks + 1} dari {total}</span>
          </p>
        </div>
        <p role="timer" aria-label={`Sisa waktu ${menitDetik(sisa ?? 0)}`} className={`flex shrink-0 items-center gap-1.5 rounded-full py-1.5 pr-3 pl-2.5 text-[15px] leading-5 font-bold tabular-nums ${kritis ? 'bg-bad-soft text-bad' : 'bg-lime text-lime-ink'}`}>
          <Clock size={16} strokeWidth={2} /> {sisa == null ? '–' : menitDetik(sisa)}
        </p>
      </header>

      {total === 0 ? (
        <main className="mx-auto flex w-full max-w-[720px] flex-1 flex-col gap-4 px-5 pt-5 pb-6">
          <Pesan>Subtes ini belum berisi soal.</Pesan>
          <Tombol memuat={menutup} onClick={() => tutup(false)}>Selesai subtes</Tombol>
        </main>
      ) : (
        <>
          {/* Ponsel dan tablet: soal dan nomor soal bergantian (state `panel`). Desktop: berdampingan. */}
          <main className="mx-auto flex w-full max-w-[720px] flex-1 flex-col px-5 pt-4 pb-6 md:pt-8 lg:max-w-none lg:flex-row lg:items-start lg:justify-center lg:gap-10 lg:pt-12">
            <section ref={atas} className={`scroll-mt-20 flex-col gap-4 lg:flex lg:w-[700px] lg:gap-5 ${panel ? 'hidden' : 'flex'}`} aria-label="Soal">
              <IsiSoal soal={soal} besar />
              <div className="flex flex-col gap-2.5">
                {soal.opsi.map((o) => (
                  <Opsi key={o.id} label={o.label} isi={o.isi} keadaan={j.opsi_id === o.id ? 'pilih' : undefined} disabled={menutup} onClick={() => ubah(soal.id, { opsi_id: j.opsi_id === o.id ? null : o.id })} />
                ))}
              </div>
              <div className="flex items-center gap-2.5 pt-1">
                <label className="flex min-w-0 flex-1 cursor-pointer items-center gap-2.5 py-1.5">
                  <input type="checkbox" className="peer sr-only" checked={Boolean(j.ragu)} disabled={menutup} onChange={(e) => ubah(soal.id, { ragu: e.target.checked })} />
                  <span className={`grid size-[22px] shrink-0 place-items-center rounded-md peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-primary ${j.ragu ? 'bg-warn-fill text-ink' : 'bg-surface ring-[1.5px] ring-inset ring-line'}`}>
                    {j.ragu && <Check size={14} strokeWidth={2.5} />}
                  </span>
                  <span className="text-body font-semibold">Tandai ragu-ragu</span>
                </label>
                {simpan === 'gagal' ? (
                  <button type="button" onClick={() => gagalTerakhir.current && kirim(gagalTerakhir.current)} className="shrink-0 rounded-full px-2 py-1.5 text-caption font-bold text-bad">Gagal menyimpan. Coba lagi</button>
                ) : (
                  <p className="shrink-0 text-caption text-ink3" aria-live="polite">{simpan === 'menyimpan' ? 'Menyimpan...' : 'Tersimpan otomatis'}</p>
                )}
              </div>
              {menutup && <Pesan jenis="ok">Menutup subtes dan menghitung skor...</Pesan>}
              {galat && <Pesan>{galat.message}</Pesan>}
              <div className="hidden justify-between pt-2 lg:flex">
                <Tombol jenis="secondary" ikon={ChevronLeft} disabled={indeks === 0} onClick={() => setIndeks(indeks - 1)}>Sebelumnya</Tombol>
                <Tombol ikonKanan={ChevronRight} disabled={indeks === total - 1} onClick={() => setIndeks(indeks + 1)}>Berikutnya</Tombol>
              </div>
            </section>

            <section className={`flex-col gap-4 lg:flex lg:w-[340px] lg:shrink-0 lg:rounded-card lg:bg-surface lg:p-5 lg:ring-1 lg:ring-line lg:ring-inset ${panel ? 'flex' : 'hidden'}`} aria-label="Nomor soal">
              <div className="flex items-center">
                <h1 className="flex-1 text-title lg:text-heading">Nomor soal</h1>
                <button type="button" onClick={() => setPanel(false)} aria-label="Tutup nomor soal" className="-mr-2 grid size-10 place-items-center rounded-full hover:bg-sunken lg:hidden"><X size={22} strokeWidth={1.75} /></button>
              </div>
              {kisi}
              {panel && galat && <Pesan>{galat.message}</Pesan>}
              <div className="hidden flex-col gap-3 border-t border-line pt-4 lg:flex">
                <p className="text-caption text-ink2">{catatan}</p>
                <Tombol jenis="secondary" penuh memuat={menutup} onClick={() => setTanya(true)}>Selesai subtes</Tombol>
              </div>
            </section>
          </main>

          <BarBawah className="lg:hidden">
            {panel ? (
              <div className="mx-auto flex w-full max-w-[680px] flex-col gap-2">
                <p className="text-caption text-ink2">{catatan}</p>
                <Tombol penuh memuat={menutup} onClick={() => setTanya(true)}>Selesai subtes</Tombol>
              </div>
            ) : (
              <div className="mx-auto flex w-full max-w-[680px] items-center gap-2.5">
                <button type="button" disabled={indeks === 0} onClick={() => setIndeks(indeks - 1)} aria-label="Soal sebelumnya" className="grid size-13 shrink-0 place-items-center rounded-full bg-surface ring-1 ring-inset ring-line disabled:text-ink3 disabled:opacity-60">
                  <ChevronLeft size={22} strokeWidth={1.75} />
                </button>
                <Tombol jenis="secondary" className="min-w-0 flex-1" ikon={LayoutGrid} onClick={() => setPanel(true)}>{total} soal</Tombol>
                <button type="button" onClick={() => (indeks === total - 1 ? setPanel(true) : setIndeks(indeks + 1))} aria-label={indeks === total - 1 ? 'Buka nomor soal' : 'Soal berikutnya'} className="grid size-13 shrink-0 place-items-center rounded-full bg-primary text-white hover:bg-primary-dark">
                  <ChevronRight size={22} strokeWidth={1.75} />
                </button>
              </div>
            )}
          </BarBawah>
        </>
      )}

      <Dialog
        buka={tanya}
        judul="Selesaikan subtes ini?"
        onTutup={() => setTanya(false)}
        aksi={(
          <>
            <Tombol penuh memuat={menutup} onClick={() => tutup(false)}>Ya, selesai</Tombol>
            <Tombol penuh jenis="secondary" disabled={menutup} onClick={() => setTanya(false)}>Periksa lagi</Tombol>
          </>
        )}
      >
        {total - dijawab > 0 ? `Masih ada ${total - dijawab} soal yang belum dijawab. ` : ''}Setelah selesai, subtes ini tidak bisa dibuka lagi dan sisa waktunya hangus.
      </Dialog>
    </>
  );
}
