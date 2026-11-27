import { Navigate, Outlet, Route, Routes } from 'react-router-dom';
import { useAuth } from './auth/AuthProvider.jsx';
import { terkonfigurasi } from './lib/supabase.js';
import { Layar, Logo, Pesan, Tombol } from './components/ui.jsx';
import BottomNav, { SideNav } from './components/BottomNav.jsx';
import Masuk, { PerluKonfigurasi } from './pages/Masuk.jsx';
import Daftar from './pages/Daftar.jsx';
import PilihTarget from './pages/PilihTarget.jsx';
import Materi from './pages/Materi.jsx';
import MateriSubtes from './pages/MateriSubtes.jsx';
import MateriDetail from './pages/MateriDetail.jsx';
import SubmateriDetail from './pages/SubmateriDetail.jsx';
import Profil from './pages/Profil.jsx';
import Dashboard from './pages/Dashboard.jsx';
import Latihan from './pages/Latihan.jsx';
import LatihanAtur from './pages/LatihanAtur.jsx';
import LatihanKerja from './pages/LatihanKerja.jsx';
import Hasil from './pages/Hasil.jsx';
import TryOut from './pages/TryOut.jsx';
import TryOutDetail from './pages/TryOutDetail.jsx';
import TryOutKerja from './pages/TryOutKerja.jsx';
import Riwayat from './pages/Riwayat.jsx';
import Tersimpan from './pages/Tersimpan.jsx';

function Memuat() {
  return <Layar className="items-center justify-center gap-4"><Logo /><p className="text-body text-ink2" role="status">Memuat...</p></Layar>;
}

// Halaman Masuk/Daftar: pengguna yang sudah login dipindahkan ke aplikasi.
function HanyaTamu() {
  const { sesi } = useAuth();
  if (sesi === undefined) return <Memuat />;
  return sesi ? <Navigate to="/" replace /> : <Outlet />;
}

// Semua halaman aplikasi: wajib login dan profil sudah dimuat.
function WajibLogin() {
  const { sesi, profil, galatProfil, muatProfil, keluar } = useAuth();
  if (sesi === undefined) return <Memuat />;
  if (!sesi) return <Navigate to="/masuk" replace />;
  if (galatProfil) {
    return (
      <Layar className="justify-center gap-4 px-5">
        <Logo />
        <Pesan>{galatProfil.message}</Pesan>
        <Tombol onClick={muatProfil}>Coba lagi</Tombol>
        <Tombol jenis="secondary" onClick={keluar}>Keluar</Tombol>
      </Layar>
    );
  }
  if (!profil) return <Memuat />;
  return <Outlet />;
}

// Kerangka aplikasi: menu bawah di ponsel, rel ikon di tablet, sidebar di desktop.
// Pengguna tanpa target diarahkan ke Pilih Target sekali, kecuali sudah menekan Lewati.
function Kerangka({ menuBawah = true }) {
  const { profil, targetDilewati } = useAuth();
  if (menuBawah && !profil.target && !targetDilewati) return <Navigate to="/target" replace />;
  return (
    <div className="flex min-h-dvh bg-bg">
      <SideNav />
      <div className="flex min-h-dvh min-w-0 flex-1 flex-col">
        <div className="mx-auto flex w-full max-w-[560px] flex-1 flex-col md:max-w-[752px] lg:max-w-[1192px]">
          <Outlet />
        </div>
        {menuBawah && <BottomNav />}
      </div>
    </div>
  );
}

// Layar mengerjakan soal: tanpa menu sama sekali supaya fokus.
const Fokus = () => <div className="flex min-h-dvh flex-col bg-bg"><Outlet /></div>;

export default function App() {
  if (!terkonfigurasi) return <PerluKonfigurasi />;
  return (
    <Routes>
      <Route element={<HanyaTamu />}>
        <Route path="/masuk" element={<Masuk />} />
        <Route path="/daftar" element={<Daftar />} />
      </Route>
      <Route element={<WajibLogin />}>
        <Route path="/target" element={<PilihTarget />} />
        <Route element={<Kerangka />}>
          <Route index element={<Dashboard />} />
          <Route path="/materi" element={<Materi />} />
          <Route path="/materi/subtes/:id" element={<MateriSubtes />} />
          <Route path="/materi/:id" element={<MateriDetail />} />
          <Route path="/submateri/:id" element={<SubmateriDetail />} />
          <Route path="/latihan" element={<Latihan />} />
          <Route path="/try-out" element={<TryOut />} />
          <Route path="/profil" element={<Profil />} />
          <Route path="/profil/riwayat" element={<Riwayat />} />
          <Route path="/profil/tersimpan" element={<Tersimpan />} />
        </Route>
        {/* Di ponsel halaman ini tanpa menu bawah; di tablet dan desktop tetap memakai menu samping. */}
        <Route element={<Kerangka menuBawah={false} />}>
          <Route path="/latihan/subtes/:id" element={<LatihanAtur />} />
          <Route path="/try-out/:id" element={<TryOutDetail />} />
          <Route path="/hasil/:id" element={<Hasil />} />
        </Route>
        <Route element={<Fokus />}>
          <Route path="/latihan/sesi/:id" element={<LatihanKerja />} />
          <Route path="/try-out/:id/subtes/:subtesId" element={<TryOutKerja />} />
        </Route>
      </Route>
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}
