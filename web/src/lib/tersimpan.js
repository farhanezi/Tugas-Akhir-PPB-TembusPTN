import { useCallback, useEffect, useRef, useState } from 'react';
import { api } from './api.js';

// Id soal yang disimpan pengguna + fungsi simpan/hapus.
// `ubah` langsung memperbarui ikon (optimistis); bila server gagal, ikon dikembalikan
// dan fungsi mengembalikan false (tidak melempar).
export function useTersimpan() {
  const [ids, setIds] = useState(() => new Set());
  const [siap, setSiap] = useState(false);
  const idsRef = useRef(ids);
  idsRef.current = ids;

  useEffect(() => {
    let batal = false;
    api('/soal-tersimpan/id')
      .then((d) => { if (!batal) setIds(new Set(d.soal_ids)); })
      .catch(() => { /* ikon tetap kosong; menyimpan masih bisa dicoba */ })
      .finally(() => { if (!batal) setSiap(true); });
    return () => { batal = true; };
  }, []);

  const ganti = (soalId, simpan) => setIds((lama) => {
    const baru = new Set(lama);
    if (simpan) baru.add(soalId); else baru.delete(soalId);
    return baru;
  });

  const ubah = useCallback(async (soalId, sesiId) => {
    const simpan = !idsRef.current.has(soalId);
    ganti(soalId, simpan);
    try {
      if (simpan) await api('/soal-tersimpan', { method: 'POST', body: { soal_id: soalId, ...(sesiId && { sesi_id: sesiId }) } });
      else await api(`/soal-tersimpan/${soalId}`, { method: 'DELETE' });
      return true;
    } catch {
      ganti(soalId, !simpan);
      return false;
    }
  }, []);

  return { ids, siap, ubah };
}
