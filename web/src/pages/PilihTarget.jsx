import { useEffect, useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Check, Search } from 'lucide-react';
import { api } from '../lib/api.js';
import { useAuth } from '../auth/AuthProvider.jsx';
import { Isian, Layar, Logo, Pesan, Tombol } from '../components/ui.jsx';

const BATAS_HASIL = 8;

export default function PilihTarget() {
  const { profil, setProfil, lewatiTarget } = useAuth();
  const pindah = useNavigate();
  const [daftar, setDaftar] = useState(null); // null = memuat
  const [galatMuat, setGalatMuat] = useState(null);
  const [cari, setCari] = useState('');
  const [pilih, setPilih] = useState(profil?.target?.id ?? null);
  const [menyimpan, setMenyimpan] = useState(false);
  const [galat, setGalat] = useState('');

  async function muat() {
    setGalatMuat(null);
    setDaftar(null);
    try { setDaftar(await api('/target-prodi')); } catch (e) { setGalatMuat(e); setDaftar([]); }
  }
  useEffect(() => { muat(); }, []);

  // Hasil hanya muncul setelah mengetik: semua kata harus ada di "PTN prodi",
  // urut dari yang paling cocok (awal nama prodi, awal kata, lalu sisanya).
  const hasil = useMemo(() => {
    const kata = cari.trim().toLowerCase().split(/\s+/).filter(Boolean);
    if (kata.length === 0) return [];
    const nilai = (t) => {
      const prodi = t.prodi.toLowerCase();
      const gabung = `${t.ptn} ${t.prodi}`.toLowerCase();
      if (!kata.every((k) => gabung.includes(k))) return null;
      if (prodi.startsWith(kata.join(' '))) return 0;
      if (kata.every((k) => gabung.split(/[\s-]+/).some((w) => w.startsWith(k)))) return 1;
      return 2;
    };
    return (daftar || [])
      .map((t) => [t, nilai(t)])
      .filter(([, n]) => n !== null)
      .sort((x, y) => x[1] - y[1] || x[0].ptn.localeCompare(y[0].ptn) || x[0].prodi.localeCompare(y[0].prodi))
      .map(([t]) => t);
  }, [daftar, cari]);
  const tampil = hasil.slice(0, BATAS_HASIL);
  const terpilih = useMemo(() => (daftar || []).find((t) => t.id === pilih) ?? (pilih === profil?.target?.id ? profil.target : null), [daftar, pilih, profil]);
  const mengetik = cari.trim().length > 0;

  function ganti() { setPilih(null); setCari(''); }

  async function simpan() {
    setGalat('');
    setMenyimpan(true);
    try {
      const hasil = await api('/profil', { method: 'PUT', body: { target_prodi_id: pilih } });
      setProfil((p) => ({ ...p, perlu_onboarding: false, nama: hasil.nama, target: hasil.target }));
      pindah('/', { replace: true });
    } catch (e) {
      setGalat(e.message);
      setMenyimpan(false);
    }
  }
  function lewati() { lewatiTarget(); pindah('/', { replace: true }); }
  const kosong = daftar !== null && !galatMuat && daftar.length === 0;

  return (
    <Layar lebar>
      <header className="flex h-14 items-center justify-between px-5 md:h-[72px] lg:px-12">
        <Logo />
        <button onClick={lewati} className="-mr-2 rounded-full px-2 py-2 text-body font-semibold text-ink2 hover:text-ink">Lewati</button>
      </header>
      <main className="mx-auto flex w-full max-w-[560px] flex-1 flex-col gap-5 px-5 pt-2 pb-6 md:max-w-[800px] md:pt-6">
        <div className="flex flex-col gap-2">
          <h1 className="text-display">Mau tembus ke mana?</h1>
          <p className="text-body text-ink2">Target dipakai untuk menghitung jarak skormu. Bisa diubah kapan saja di Profil.</p>
        </div>
        {!kosong && !terpilih && <Isian label="Cari PTN atau prodi" ikon={Search} type="search" autoFocus value={cari} onChange={(e) => setCari(e.target.value)} placeholder="Misalnya ITB atau Informatika" />}

        {terpilih && (
          <div className="flex flex-col gap-2">
            <p className="text-caption text-ink2">Target terpilih</p>
            <div className="flex items-center gap-3 rounded-field bg-primary-soft px-3.5 py-3 ring-2 ring-inset ring-primary">
              <span className="grid size-[22px] shrink-0 place-items-center rounded-full bg-primary text-white"><Check size={14} strokeWidth={2.5} /></span>
              <span className="flex min-w-0 flex-1 flex-col gap-0.5">
                <span className="text-heading">{terpilih.prodi}</span>
                <span className="text-caption text-ink2">{terpilih.ptn}{terpilih.skor_target != null && <> · Skor target {Number(terpilih.skor_target)} (estimasi)</>}</span>
              </span>
              <button type="button" onClick={ganti} className="-mr-1 rounded-full px-3 py-2 text-body font-semibold text-primary hover:underline">Ganti</button>
            </div>
          </div>
        )}

        {daftar === null && <div className="flex flex-col gap-2.5" aria-busy="true" aria-label="Memuat daftar target">{[0, 1, 2].map((i) => <div key={i} className="kerangka h-[62px]" />)}</div>}

        {galatMuat && (
          <div className="flex flex-col items-start gap-3">
            <Pesan>{galatMuat.message}</Pesan>
            <Tombol jenis="secondary" kecil onClick={muat}>Coba lagi</Tombol>
          </div>
        )}

        {daftar && !galatMuat && daftar.length === 0 && (
          <p className="rounded-card bg-surface p-4 text-body text-ink2 ring-1 ring-inset ring-line">Daftar target prodi belum tersedia. Kamu bisa lanjut dulu dan memilih target nanti di Profil.</p>
        )}
        {daftar && daftar.length > 0 && !terpilih && !mengetik && (
          <p className="text-body text-ink3">Ketik nama PTN atau prodi, lalu pilih dari hasilnya.</p>
        )}
        {daftar && daftar.length > 0 && !terpilih && mengetik && hasil.length === 0 && (
          <p className="text-body text-ink2">Tidak ada prodi yang cocok dengan "{cari.trim()}".</p>
        )}

        {!terpilih && tampil.length > 0 && (
          <fieldset className="flex min-w-0 flex-col gap-2.5">
            <legend className="sr-only">Hasil pencarian</legend>
            {tampil.map((t) => (
              <label key={t.id} className="flex cursor-pointer items-center gap-3 rounded-field bg-surface px-3.5 py-3 ring-1 ring-inset ring-line transition-shadow duration-150 hover:ring-ink3 has-focus-visible:outline-2 has-focus-visible:outline-offset-2 has-focus-visible:outline-primary">
                <input type="radio" name="target" className="sr-only" checked={false} onChange={() => { setPilih(t.id); setCari(''); }} />
                <span className="flex min-w-0 flex-1 flex-col gap-0.5">
                  <span className="text-heading">{t.prodi}</span>
                  <span className="text-caption text-ink2">{t.ptn} · Skor target {Number(t.skor_target)} (estimasi)</span>
                </span>
                <span className="grid size-[22px] shrink-0 place-items-center rounded-full bg-surface ring-1 ring-inset ring-line" />
              </label>
            ))}
            {hasil.length > tampil.length && <p className="text-caption text-ink3">Menampilkan {tampil.length} dari {hasil.length} hasil. Ketik lebih spesifik untuk mempersempit.</p>}
          </fieldset>
        )}

        {daftar && daftar.length > 0 && <p className="text-caption text-ink3">Skor target adalah estimasi dari data komunitas tahun lalu, bukan angka resmi.</p>}
        <div className="sticky bottom-0 -mx-5 mt-auto flex flex-col gap-3 bg-bg px-5 pt-3 pb-[max(env(safe-area-inset-bottom),8px)] md:static md:mt-2 md:items-end">
          <Pesan>{galat}</Pesan>
          {kosong
            ? <Tombol className="w-full md:w-60" onClick={lewati}>Lanjut tanpa target</Tombol>
            : <Tombol className="w-full md:w-60" disabled={pilih == null} memuat={menyimpan} onClick={simpan}>Simpan target</Tombol>}
        </div>
      </main>
    </Layar>
  );
}
