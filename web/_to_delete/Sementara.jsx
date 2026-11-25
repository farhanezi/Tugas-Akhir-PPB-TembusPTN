import { Link } from 'react-router-dom';
import { Target } from 'lucide-react';
import { useAuth } from '../auth/AuthProvider.jsx';
import { Tombol } from '../components/ui.jsx';

// Halaman sementara tahap 1. Diganti bertahap: Materi, Latihan, Try Out, lalu Dashboard.
export function Beranda() {
  const { profil } = useAuth();
  return (
    <main className="flex flex-1 flex-col gap-5 px-5 pt-4 pb-6">
      <div>
        <h1 className="text-title">Halo{profil?.nama ? `, ${profil.nama.split(' ')[0]}` : ''}</h1>
        <p className="text-caption text-ink2">{profil?.target ? `Target: ${profil.target.prodi} ${profil.target.ptn}` : 'Belum ada target'}</p>
      </div>
      <section className="flex flex-col gap-3 rounded-panel bg-panel p-5">
        <h2 className="text-[28px] leading-[34px] font-bold tracking-[-0.02em] text-white">{profil?.target ? 'Belum ada skor' : 'Pasang targetmu'}</h2>
        <p className="text-body text-panel-text">{profil?.target ? `Try out belum tersedia di versi ini. Skor targetmu ${Number(profil.target.skor_target)} (estimasi).` : 'Pilih PTN dan prodi tujuan supaya jarak skormu bisa dihitung.'}</p>
        {!profil?.target && <Link to="/target"><Tombol jenis="lime" penuh ikon={Target}>Pilih target</Tombol></Link>}
      </section>
      <p className="text-body text-ink2">Login dan profil sudah tersambung ke API. Dashboard lengkap dikerjakan setelah Materi, Latihan, dan Try Out.</p>
    </main>
  );
}

export function SegeraDibuat({ judul }) {
  return (
    <main className="flex flex-1 flex-col gap-2 px-5 pt-4 pb-6">
      <h1 className="text-title">{judul}</h1>
      <p className="text-body text-ink2">Halaman ini dikerjakan di tahap berikutnya.</p>
    </main>
  );
}
