import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Bookmark, Check, ChevronRight, History, LogOut, Target, X } from 'lucide-react';
import { api } from '../lib/api.js';
import { useTersimpan } from '../lib/tersimpan.js';
import { DESKTOP, useMedia } from '../lib/useApi.js';
import { useAuth } from '../auth/AuthProvider.jsx';
import { IsiRiwayat } from './Riwayat.jsx';
import { Isian, Kartu, Stat, Tombol } from '../components/ui.jsx';

function CatatanSkor({ target }) {
  const skor = Number(target.skor_target);
  if (target.sumber === 'CONTOH') return `Skor target ${skor} hanya angka contoh, bukan data asli.`;
  return `Skor target ${skor}${target.tahun ? `, estimasi dari data tahun ${target.tahun}` : ', estimasi'}.`;
}

function UbahNama({ awal, onSelesai }) {
  const { setProfil, profil } = useAuth();
  const [nama, setNama] = useState(awal || '');
  const [sibuk, setSibuk] = useState(false);
  const [galat, setGalat] = useState('');

  async function simpan(e) {
    e.preventDefault();
    const bersih = nama.trim();
    if (!bersih) return setGalat('Nama tidak boleh kosong.');
    if (bersih.length > 60) return setGalat('Nama paling banyak 60 karakter.');
    setSibuk(true);
    setGalat('');
    try {
      const hasil = await api('/profil', { method: 'PUT', body: { nama: bersih } });
      setProfil({ ...profil, nama: hasil.nama, target: hasil.target });
      onSelesai();
    } catch (err) {
      setGalat(err.message);
    } finally {
      setSibuk(false);
    }
  }

  return (
    <form onSubmit={simpan} className="flex flex-col gap-3" noValidate>
      <Isian label="Nama" value={nama} onChange={(e) => setNama(e.target.value)} galat={galat} autoFocus maxLength={80} autoComplete="name" />
      <div className="flex gap-2">
        <Tombol type="submit" kecil memuat={sibuk} ikon={Check}>Simpan</Tombol>
        <Tombol type="button" kecil jenis="secondary" ikon={X} disabled={sibuk} onClick={onSelesai}>Batal</Tombol>
      </div>
    </form>
  );
}

export default function Profil() {
  const { profil, sesi, muatProfil, keluar } = useAuth();
  const [mengubah, setMengubah] = useState(false);
  const [keluarSibuk, setKeluarSibuk] = useState(false);
  const desktop = useMedia(DESKTOP); // di desktop Riwayat tampil di kolom kanan
  const tersimpan = useTersimpan(); // hanya untuk jumlah di menu

  // Angka ringkasan bisa berubah sejak profil terakhir dimuat (materi ditandai, try out selesai).
  useEffect(() => { muatProfil(); }, [muatProfil]);

  const nama = profil.nama || '';
  const huruf = (nama || sesi.user.email)[0].toUpperCase();
  const r = profil.ringkasan || {};

  return (
    <main className="flex flex-1 flex-col gap-4 px-5 pt-2 pb-6 md:px-4 md:pt-8 lg:px-12">
      <h1 className="text-title md:text-display">Profil</h1>
      <div className="flex flex-col gap-4 lg:flex-row lg:items-start lg:gap-6">
      <div className="flex flex-col gap-4 lg:w-[400px] lg:shrink-0">

      <Kartu>
        {mengubah ? (
          <UbahNama awal={nama} onSelesai={() => setMengubah(false)} />
        ) : (
          <div className="flex items-center gap-3">
            <span className="grid size-13 shrink-0 place-items-center rounded-full bg-lime text-[20px] font-bold text-lime-ink" aria-hidden="true">{huruf}</span>
            <div className="min-w-0 flex-1">
              <p className="truncate text-[18px] leading-6 font-bold">{nama || 'Tanpa nama'}</p>
              <p className="truncate text-caption text-ink2">{sesi.user.email}</p>
            </div>
            <button type="button" onClick={() => setMengubah(true)} className="rounded-full px-2 py-2 text-body font-bold text-primary">Ubah</button>
          </div>
        )}
      </Kartu>

      <Kartu className="flex flex-col gap-3">
        <div className="flex items-center gap-3">
          <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-lime text-lime-ink"><Target size={20} strokeWidth={1.75} /></span>
          <div className="min-w-0 flex-1">
            <p className="text-caption text-ink2">Target</p>
            <p className="truncate text-heading">{profil.target ? `${profil.target.prodi} · ${profil.target.ptn}` : 'Belum dipilih'}</p>
          </div>
          <Link to="/target" className="rounded-full px-2 py-2 text-body font-bold text-primary">{profil.target ? 'Ganti' : 'Pilih'}</Link>
        </div>
        <p className="text-caption text-ink2">
          {profil.target ? <CatatanSkor target={profil.target} /> : 'Pilih target supaya jarak skormu bisa dihitung.'}
        </p>
      </Kartu>

      <div className="flex gap-2.5">
        <Stat nilai={r.try_out_selesai ?? 0} label="Try out selesai" />
        <Stat nilai={r.skor_tertinggi != null ? Math.round(r.skor_tertinggi) : null} label="Skor tertinggi" />
        <Stat nilai={r.materi_selesai ?? 0} label="Materi selesai" />
      </div>

      <Kartu className="flex flex-col py-1">
        <Link to="/profil/tersimpan" className="flex items-center gap-3 py-3">
          <Bookmark size={20} strokeWidth={1.75} />
          <span className="flex-1 text-[15px] font-semibold">Soal tersimpan</span>
          {tersimpan.siap && <span className="text-caption text-ink2">{tersimpan.ids.size}</span>}
          <ChevronRight size={20} strokeWidth={1.75} className="text-ink3" />
        </Link>
        <div className="border-t border-line" />
        <Link to="/profil/riwayat" className="flex items-center gap-3 py-3 lg:hidden">
          <History size={20} strokeWidth={1.75} />
          <span className="flex-1 text-[15px] font-semibold">Riwayat</span>
          <ChevronRight size={20} strokeWidth={1.75} className="text-ink3" />
        </Link>
        <div className="border-t border-line lg:hidden" />
        <button
          type="button"
          disabled={keluarSibuk}
          onClick={() => { setKeluarSibuk(true); keluar(); }}
          className="flex items-center gap-3 py-3 text-left text-[15px] font-semibold text-bad"
        >
          <LogOut size={20} strokeWidth={1.75} /> Keluar
        </button>
      </Kartu>
      </div>
      {desktop && (
        <section className="flex min-w-0 flex-1 flex-col gap-3.5" aria-label="Riwayat">
          <h2 className="text-title">Riwayat</h2>
          <IsiRiwayat dari="/profil" />
        </section>
      )}
      </div>
    </main>
  );
}
