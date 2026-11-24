import { useCallback, useEffect, useState } from 'react';
import { api } from './api.js';

// Memuat data GET dari API. `path` null = jangan memuat. Berubah path = muat ulang otomatis.
export function useApi(path) {
  const [data, setData] = useState(null);
  const [galat, setGalat] = useState(null);
  const [memuat, setMemuat] = useState(Boolean(path));
  const [kunci, setKunci] = useState(0);

  useEffect(() => {
    if (!path) return undefined;
    let batal = false;
    setMemuat(true);
    setGalat(null);
    setData(null);
    api(path)
      .then((d) => !batal && setData(d))
      .catch((e) => !batal && setGalat(e))
      .finally(() => !batal && setMemuat(false));
    return () => { batal = true; };
  }, [path, kunci]);

  const ulang = useCallback(() => setKunci((k) => k + 1), []);
  return { data, galat, memuat, ulang, setData };
}

// true bila layar cocok dengan media query (mis. '(min-width: 1100px)').
export function useMedia(kueri) {
  const [cocok, setCocok] = useState(() => window.matchMedia(kueri).matches);
  useEffect(() => {
    const m = window.matchMedia(kueri);
    const ubah = () => setCocok(m.matches);
    ubah();
    m.addEventListener('change', ubah);
    return () => m.removeEventListener('change', ubah);
  }, [kueri]);
  return cocok;
}
export const DESKTOP = '(min-width: 1100px)';
