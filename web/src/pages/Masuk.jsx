import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Lock, Mail } from 'lucide-react';
import { supabase } from '../lib/supabase.js';
import { GambarPlaceholder, Isian, Layar, LayarAuth, Logo, Pesan, Tombol } from '../components/ui.jsx';

export function pesanAuth(error) {
  const m = (error?.message || '').toLowerCase();
  if (m.includes('invalid login')) return 'Email atau kata sandi salah.';
  if (m.includes('email not confirmed')) return 'Emailmu belum dikonfirmasi. Buka tautan di email pendaftaran dulu.';
  if (m.includes('already registered')) return 'Email ini sudah terdaftar. Coba masuk.';
  if (m.includes('password should be')) return 'Kata sandi minimal 8 karakter.';
  if (m.includes('rate limit') || error?.status === 429) return 'Terlalu banyak percobaan. Tunggu sebentar lalu coba lagi.';
  if (m.includes('fetch') || m.includes('network')) return 'Tidak bisa terhubung. Periksa koneksimu lalu coba lagi.';
  return 'Gagal memproses. Coba lagi sebentar lagi.';
}

export default function Masuk() {
  const [email, setEmail] = useState('');
  const [sandi, setSandi] = useState('');
  const [galat, setGalat] = useState('');
  const [memuat, setMemuat] = useState(false);

  async function kirim(e) {
    e.preventDefault();
    setGalat('');
    setMemuat(true);
    const { error } = await supabase.auth.signInWithPassword({ email: email.trim(), password: sandi });
    setMemuat(false);
    if (error) setGalat(pesanAuth(error)); // berhasil: AuthProvider memindahkan halaman
  }

  return (
    <LayarAuth>
      <Logo className="lg:hidden" />
      <GambarPlaceholder className="h-40 lg:hidden" nama="ilustrasi masuk" instruksi="Ilustrasi datar 350 x 160: siswa SMA belajar dengan laptop dan gerbang kampus di latar. Warna hijau tua, lime, putih. Tanpa teks." />
      <div className="flex flex-col gap-2">
        <h1 className="text-display">Masuk dan lanjutkan belajarmu</h1>
        <p className="text-body text-ink2">Materi, latihan soal, dan try out UTBK dalam satu tempat.</p>
      </div>
      <form onSubmit={kirim} className="flex flex-col gap-3.5" noValidate>
        <Isian label="Email" ikon={Mail} type="email" autoComplete="email" inputMode="email" required value={email} onChange={(e) => setEmail(e.target.value)} />
        <Isian label="Kata sandi" ikon={Lock} type="password" autoComplete="current-password" required value={sandi} onChange={(e) => setSandi(e.target.value)} />
        <Pesan>{galat}</Pesan>
        <Tombol type="submit" penuh memuat={memuat} disabled={!email || !sandi} className="mt-2.5">Masuk</Tombol>
      </form>
      <p className="mt-auto text-center md:mt-0 text-body text-ink2">
        Belum punya akun? <Link to="/daftar" className="font-bold text-primary">Daftar</Link>
      </p>
    </LayarAuth>
  );
}

export function PerluKonfigurasi() {
  return (
    <Layar className="gap-6 px-5 pt-6 pb-8">
      <Logo />
      <div className="flex flex-col gap-2">
        <h1 className="text-display">Sambungkan ke Supabase dulu</h1>
        <p className="text-body text-ink2">Salin <code>.env.example</code> menjadi <code>.env</code> di folder <code>web</code>, isi <code>VITE_SUPABASE_URL</code> dan <code>VITE_SUPABASE_ANON_KEY</code>, lalu jalankan ulang <code>npm run dev</code>.</p>
      </div>
    </Layar>
  );
}
