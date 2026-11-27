import { useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { PenLine } from 'lucide-react';
import { api } from '../lib/api.js';
import { useApi } from '../lib/useApi.js';
import { BarisSoal } from './Hasil.jsx';
import { BarAtas, Chip, GalatMuat, Kartu, MemuatDaftar, Pesan, Tombol } from '../components/ui.jsx';

// Soal yang disimpan pengguna dari latihan: dibuka-tutup untuk melihat soal, kunci, dan pembahasan.
export default function Tersimpan() {
  const { data, galat, memuat, ulang, setData } = useApi('/soal-tersimpan');
  const [subtes, setSubtes] = useState(null); // null = semua
  const [galatHapus, setGalatHapus] = useState('');

  const soal = data?.soal;
  const daftarSubtes = useMemo(() => {
    const peta = new Map();
    for (const s of soal || []) if (s.subtes && !peta.has(s.subtes.id)) peta.set(s.subtes.id, s.subtes.nama);
    return [...peta].map(([id, nama]) => ({ id, nama }));
  }, [soal]);
  // Saringan yang subtesnya sudah habis dihapus kembali ke "Semua".
  const aktif = daftarSubtes.some((t) => t.id === subtes) ? subtes : null;
  const tampil = (soal || []).filter((s) => aktif == null || s.subtes?.id === aktif);

  async function hapus(item) {
    setGalatHapus('');
    setData((d) => ({ ...d, soal: d.soal.filter((s) => s.id !== item.id) }));
    try {
      await api(`/soal-tersimpan/${item.id}`, { method: 'DELETE' });
    } catch (e) {
      setGalatHapus(e.message);
      // kembalikan ke posisi semula (urut waktu simpan, terbaru di atas)
      setData((d) => ({ ...d, soal: [...d.soal, item].sort((a, b) => new Date(b.disimpan_at) - new Date(a.disimpan_at)) }));
    }
  }

  return (
    <>
      <BarAtas judul="Profil" ke="/profil" />
      <main className="flex flex-1 flex-col gap-4 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        <h1 className="text-title">Soal tersimpan</h1>

        {memuat && <MemuatDaftar tinggi={['h-16', 'h-16', 'h-16']} />}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}

        {soal && soal.length === 0 && (
          <Kartu className="flex flex-col gap-3">
            <div className="flex flex-col gap-1">
              <p className="text-heading">Belum ada soal tersimpan</p>
              <p className="text-body text-ink2">Tekan ikon simpan saat latihan untuk menyimpan soal yang ingin kamu pelajari lagi.</p>
            </div>
            <Link to="/latihan"><Tombol kecil jenis="soft" ikon={PenLine} tabIndex={-1}>Mulai latihan</Tombol></Link>
          </Kartu>
        )}

        {soal && soal.length > 0 && (
          <>
            {daftarSubtes.length > 1 && (
              <div className="-mx-5 flex gap-2 overflow-x-auto px-5 py-1 md:mx-0 md:flex-wrap md:px-0">
                <Chip jenis={aktif == null ? 'primary' : 'netral'} aktif={aktif == null} onClick={() => setSubtes(null)}>Semua {soal.length}</Chip>
                {daftarSubtes.map((t) => (
                  <Chip key={t.id} jenis={aktif === t.id ? 'primary' : 'netral'} aktif={aktif === t.id} onClick={() => setSubtes(t.id)}>
                    {t.nama} {soal.filter((s) => s.subtes?.id === t.id).length}
                  </Chip>
                ))}
              </div>
            )}
            {galatHapus && <Pesan>{galatHapus}</Pesan>}
            {tampil.length === 0 ? (
              <Kartu><p className="text-body text-ink2">Tidak ada soal di saringan ini.</p></Kartu>
            ) : (
              <Kartu className="py-1">
                <ul>
                  {tampil.map((s, i) => (
                    <BarisSoal key={s.id} soal={{ ...s, nomor: i + 1 }} tersimpan onSimpan={() => hapus(s)} />
                  ))}
                </ul>
              </Kartu>
            )}
            <p className="text-caption text-ink3">Tekan ikon simpan di kanan soal untuk menghapusnya dari daftar ini.</p>
          </>
        )}
      </main>
    </>
  );
}
