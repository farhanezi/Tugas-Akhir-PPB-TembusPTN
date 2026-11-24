import { useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { ArrowRight, Check } from 'lucide-react';
import { api } from '../lib/api.js';
import { useApi } from '../lib/useApi.js';
import { useAuth } from '../auth/AuthProvider.jsx';
import { BarAtas, GalatMuat, Kartu, Kerangka, Pesan, Progres, Tombol } from '../components/ui.jsx';
import DaftarSubmateri from '../components/DaftarSubmateri.jsx';

// Halaman satu materi: daftar sub materinya, plus tombol latihan untuk materi ini.
export default function MateriDetail() {
  const { id } = useParams();
  const { muatProfil } = useAuth();
  const { data, galat, memuat, ulang, setData } = useApi(`/materi/${id}`);
  const [sibuk, setSibuk] = useState(false);
  const [galatTandai, setGalatTandai] = useState('');

  // Hanya untuk materi yang belum dipecah jadi sub materi (tanda selesai di level materi).
  async function ubahSelesai() {
    const baru = !data.selesai;
    setSibuk(true);
    setGalatTandai('');
    try {
      await api(`/materi/${data.id}/selesai`, { method: baru ? 'POST' : 'DELETE' });
      setData({ ...data, selesai: baru });
      muatProfil();
    } catch (e) {
      setGalatTandai(e.message);
    } finally {
      setSibuk(false);
    }
  }

  const sub = data?.submateri || [];
  const selesai = sub.filter((x) => x.selesai).length;

  return (
    <>
      <BarAtas judul={data?.subtes.nama || 'Materi'} ke={data ? `/materi/subtes/${data.subtes.id}` : '/materi'} />
      <main className="flex flex-1 flex-col gap-5 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {memuat && (
          <div className="flex flex-col gap-3" role="status" aria-label="Memuat">
            <Kerangka className="h-14" /><Kerangka className="h-40" />
          </div>
        )}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}

        {data && sub.length > 0 && (
          <div className="mx-auto flex w-full max-w-[640px] flex-col gap-5">
            <DaftarSubmateri materi={data} submateri={sub} />
            <Progres nilai={(selesai / sub.length) * 100} />
            {data.jumlah_soal_latihan > 0 && (
              <Link to={`/latihan/subtes/${data.subtes.id}?materi=${data.id}`}><Tombol penuh ikonKanan={ArrowRight} tabIndex={-1}>Latihan {data.jumlah_soal_latihan} soal {data.nama}</Tombol></Link>
            )}
          </div>
        )}

        {data && sub.length === 0 && (
          <div className="mx-auto flex w-full max-w-[640px] flex-col gap-5">
            <h1 className="text-title">{data.nama}</h1>
            <Kartu className="flex flex-col gap-3">
              <div>
                <h2 className="text-heading">{data.selesai ? 'Materi ini sudah selesai' : 'Sudah paham materinya?'}</h2>
                <p className="text-caption text-ink2">Sub materi untuk materi ini segera hadir.</p>
              </div>
              {galatTandai && <Pesan>{galatTandai}</Pesan>}
              <Tombol jenis={data.selesai ? 'soft' : 'secondary'} penuh ikon={Check} memuat={sibuk} onClick={ubahSelesai}>
                {data.selesai ? 'Batal tandai' : 'Tandai selesai'}
              </Tombol>
            </Kartu>
            {data.jumlah_soal_latihan > 0 && (
              <Link to={`/latihan/subtes/${data.subtes.id}?materi=${data.id}`}><Tombol penuh ikonKanan={ArrowRight} tabIndex={-1}>Latihan {data.jumlah_soal_latihan} soal {data.nama}</Tombol></Link>
            )}
          </div>
        )}
      </main>
    </>
  );
}
