import { createContext, useCallback, useContext, useEffect, useState } from 'react';
import { supabase, terkonfigurasi } from '../lib/supabase.js';
import { api } from '../lib/api.js';

const Konteks = createContext(null);
export const useAuth = () => useContext(Konteks);

const KUNCI_NAMA = 'tembusptn:nama_tertunda';
const kunciLewati = (uid) => `tembusptn:lewati_target:${uid}`;

export function AuthProvider({ children }) {
  const [sesi, setSesi] = useState(undefined); // undefined = masih memeriksa
  const [profil, setProfil] = useState(null);
  const [galatProfil, setGalatProfil] = useState(null);
  const [targetDilewati, setTargetDilewati] = useState(false);

  useEffect(() => {
    if (!terkonfigurasi) return setSesi(null);
    supabase.auth.getSession().then(({ data }) => setSesi(data.session));
    const { data } = supabase.auth.onAuthStateChange((_e, s) => setSesi(s));
    return () => data.subscription.unsubscribe();
  }, []);

  const uid = sesi?.user?.id;

  const muatProfil = useCallback(async () => {
    setGalatProfil(null);
    try {
      let p = await api('/profil');
      // Nama dari form Daftar disimpan dulu di perangkat (akun bisa butuh konfirmasi email).
      const nama = localStorage.getItem(KUNCI_NAMA);
      if (nama && !p.nama) {
        const hasil = await api('/profil', { method: 'PUT', body: { nama } });
        p = { ...p, perlu_onboarding: false, nama: hasil.nama, target: hasil.target };
      }
      localStorage.removeItem(KUNCI_NAMA);
      setProfil(p);
    } catch (e) {
      if (e.kode !== 'BELUM_LOGIN') setGalatProfil(e);
    }
  }, []);

  useEffect(() => {
    setProfil(null);
    setTargetDilewati(uid ? localStorage.getItem(kunciLewati(uid)) === '1' : false);
    if (uid) muatProfil();
  }, [uid, muatProfil]);

  const nilai = {
    sesi,
    profil,
    galatProfil,
    muatProfil,
    setProfil,
    simpanNamaTertunda: (nama) => localStorage.setItem(KUNCI_NAMA, nama),
    targetDilewati,
    // State ikut diubah supaya Kerangka langsung tahu; localStorage hanya untuk kunjungan berikutnya.
    lewatiTarget: () => {
      if (!uid) return;
      localStorage.setItem(kunciLewati(uid), '1');
      setTargetDilewati(true);
    },
    keluar: () => supabase.auth.signOut(),
  };
  return <Konteks.Provider value={nilai}>{children}</Konteks.Provider>;
}
