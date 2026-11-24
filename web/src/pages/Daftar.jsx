import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Lock, Mail } from 'lucide-react';
import { supabase } from '../lib/supabase.js';
import { Isian, LayarAuth, Logo, Pesan, Tombol } from '../components/ui.jsx';
import { useAuth } from '../auth/AuthProvider.jsx';
import { pesanAuth } from './Masuk.jsx';

export default function Daftar() {
  const { simpanNamaTertunda } = useAuth();
  const [nama, setNama] = useState('');
  const [email, setEmail] = useState('');
  const [sandi, setSandi] = useState('');
  const [galat, setGalat] = useState({});
  const [memuat, setMemuat] = useState(false);
  const [cekEmail, setCekEmail] = useState(false);

  async function kirim(e) {
    e.preventDefault();
    const g = {};
    if (!nama.trim()) g.nama = 'Isi namamu.';
    else if (nama.trim().length > 60) g.nama = 'Nama maksimal 60 karakter.';
    if (!/^\S+@\S+\.\S+$/.test(email.trim())) g.email = 'Format email belum benar.';
    if (sandi.length < 8) g.sandi = 'Kata sandi minimal 8 karakter.';
    setGalat(g);
    if (Object.keys(g).length) return;

    setMemuat(true);
    simpanNamaTertunda(nama.trim()); // dikirim ke API begitu login pertama berhasil
    const { data, error } = await supabase.auth.signUp({ email: email.trim(), password: sandi });
    setMemuat(false);
    if (error) return setGalat({ umum: pesanAuth(error) });
    if (!data.session) setCekEmail(true); // proyek Supabase mewajibkan konfirmasi email
  }

  if (cekEmail) {
    return (
      <LayarAuth>
        <Logo className="lg:hidden" />
        <div className="flex flex-col gap-2">
          <h1 className="text-display">Cek emailmu</h1>
          <p className="text-body text-ink2">Kami mengirim tautan konfirmasi ke <b className="text-ink">{email.trim()}</b>. Buka tautannya, lalu masuk dengan akun barumu.</p>
        </div>
        <Link to="/masuk" className="font-bold text-primary">Ke halaman Masuk</Link>
      </LayarAuth>
    );
  }

  return (
    <LayarAuth>
      <Logo className="lg:hidden" />
      <div className="flex flex-col gap-2">
        <h1 className="text-display">Buat akun, lalu pasang targetmu</h1>
        <p className="text-body text-ink2">Progres, latihan, dan hasil try out tersimpan di akunmu.</p>
      </div>
      <form onSubmit={kirim} className="flex flex-col gap-3.5" noValidate>
        <Isian label="Nama" autoComplete="name" value={nama} onChange={(e) => setNama(e.target.value)} galat={galat.nama} />
        <Isian label="Email" ikon={Mail} type="email" autoComplete="email" inputMode="email" value={email} onChange={(e) => setEmail(e.target.value)} galat={galat.email} />
        <Isian label="Kata sandi" ikon={Lock} type="password" autoComplete="new-password" value={sandi} onChange={(e) => setSandi(e.target.value)} galat={galat.sandi} bantuan="Minimal 8 karakter" />
        <Pesan>{galat.umum}</Pesan>
        <Tombol type="submit" penuh memuat={memuat} className="mt-2.5">Buat akun</Tombol>
      </form>
      <p className="mt-auto text-center md:mt-0 text-body text-ink2">
        Sudah punya akun? <Link to="/masuk" className="font-bold text-primary">Masuk</Link>
      </p>
    </LayarAuth>
  );
}
