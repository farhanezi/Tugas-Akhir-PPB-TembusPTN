import { useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { ArrowRight, Check, ChevronLeft, ChevronRight, ExternalLink, FileText, Video } from 'lucide-react';
import { api } from '../lib/api.js';
import { useApi } from '../lib/useApi.js';
import { useAuth } from '../auth/AuthProvider.jsx';
import { BarAtas, GalatMuat, Kartu, Kerangka, Pesan, Tombol } from '../components/ui.jsx';
import DaftarSubmateri from '../components/DaftarSubmateri.jsx';

// Mengubah tautan YouTube biasa menjadi tautan embed. Bukan YouTube: null.
export function embedYoutube(url) {
  try {
    const u = new URL(url);
    const host = u.hostname.replace(/^www\./, '');
    let id = null;
    if (host === 'youtu.be') id = u.pathname.slice(1).split('/')[0];
    else if (host === 'youtube.com' || host === 'm.youtube.com' || host === 'youtube-nocookie.com') {
      if (u.pathname === '/watch') id = u.searchParams.get('v');
      else {
        const m = u.pathname.match(/^\/(?:embed|shorts|live)\/([\w-]{6,})/);
        if (m) id = m[1];
      }
    }
    return id && /^[\w-]{6,}$/.test(id) ? `https://www.youtube-nocookie.com/embed/${id}` : null;
  } catch {
    return null;
  }
}

function Video16x9({ url, judul }) {
  if (!url) {
    return (
      <div className="flex aspect-video flex-col items-center justify-center gap-2 rounded-card bg-sunken text-ink2">
        <Video size={28} strokeWidth={1.75} />
        <p className="text-body font-semibold">Video segera hadir</p>
      </div>
    );
  }
  const embed = embedYoutube(url);
  if (!embed) {
    return (
      <a href={url} target="_blank" rel="noopener noreferrer" className="flex aspect-video flex-col items-center justify-center gap-2 rounded-card bg-panel text-white">
        <Video size={28} strokeWidth={1.75} />
        <span className="text-body font-semibold">Buka video pembahasan</span>
      </a>
    );
  }
  return (
    <div className="aspect-video overflow-hidden rounded-card bg-panel">
      <iframe
        src={embed}
        title={`Video pembahasan ${judul}`}
        className="size-full"
        loading="lazy"
        allow="accelerometer; encrypted-media; picture-in-picture; fullscreen"
        allowFullScreen
        referrerPolicy="strict-origin-when-cross-origin"
      />
    </div>
  );
}

function TautanSaudara({ materi, arah }) {
  if (!materi) return <span />;
  const maju = arah === 'maju';
  return (
    <Link to={`/submateri/${materi.id}`} className={`flex min-w-0 max-w-[48%] items-center gap-1 py-2 text-[13px] leading-[18px] font-semibold text-ink2 hover:text-ink ${maju ? 'justify-end text-right' : ''}`}>
      {!maju && <ChevronLeft size={16} strokeWidth={1.75} className="shrink-0" />}
      <span className="truncate">{materi.nama}</span>
      {maju && <ChevronRight size={16} strokeWidth={1.75} className="shrink-0" />}
    </Link>
  );
}

export default function SubmateriDetail() {
  const { id } = useParams();
  const { muatProfil } = useAuth();
  const { data, galat, memuat, ulang, setData } = useApi(`/submateri/${id}`);
  // Daftar sub materi sejawat: untuk nama tautan sebelum/berikutnya dan panel kiri di desktop.
  const saudara = useApi(data ? `/materi/${data.materi.id}` : null);
  const [sibuk, setSibuk] = useState(false);
  const [galatTandai, setGalatTandai] = useState('');

  async function ubahSelesai() {
    const baru = !data.selesai;
    setSibuk(true);
    setGalatTandai('');
    try {
      await api(`/submateri/${data.id}/selesai`, { method: baru ? 'POST' : 'DELETE' });
      setData({ ...data, selesai: baru });
      muatProfil(); // ringkasan "Materi selesai" di Profil ikut diperbarui
    } catch (e) {
      setGalatTandai(e.message);
    } finally {
      setSibuk(false);
    }
  }

  const daftar = saudara.data?.submateri || [];
  const sebelum = data && daftar.find((x) => x.id === data.submateri_sebelumnya_id);
  const berikut = data && daftar.find((x) => x.id === data.submateri_berikutnya_id);
  const stok = data?.jumlah_soal_latihan || 0;

  return (
    <>
      <BarAtas judul={data?.materi.nama || 'Materi'} ke={data ? `/materi/${data.materi.id}` : '/materi'} />
      <main className="flex flex-1 flex-col gap-5 px-5 pt-1 pb-6 md:px-4 lg:px-12">
        {memuat && (
          <div className="flex flex-col gap-3" role="status" aria-label="Memuat">
            <Kerangka className="h-14" /><Kerangka className="aspect-video" /><Kerangka className="h-20" />
          </div>
        )}
        {galat && <GalatMuat galat={galat} onUlang={ulang} />}

        {data && (
          <div className="lg:flex lg:items-start lg:gap-6">
            {/* Desktop: daftar sub materi tetap terlihat di kiri. */}
            {saudara.data && (
              <div className="hidden lg:block lg:w-[340px] lg:shrink-0">
                <DaftarSubmateri panel materi={saudara.data} submateri={daftar.map((x) => (x.id === data.id ? { ...x, selesai: data.selesai } : x))} aktifId={data.id} />
              </div>
            )}
            <div className="flex min-w-0 flex-1 flex-col gap-5">
            <div className="flex flex-col gap-1.5">
              <h1 className="text-title lg:text-display">{data.nama}</h1>
              <p className="text-caption text-ink2">{data.materi.nama} · sub materi {data.urutan} dari {data.jumlah_saudara}</p>
            </div>

            <Video16x9 url={data.video_url} judul={data.nama} />

            <div className="grid gap-5 md:grid-cols-2 md:items-start md:gap-4">
            {data.pdf_url ? (
              <a href={data.pdf_url} target="_blank" rel="noopener noreferrer">
                <Kartu className="flex items-center gap-3">
                  <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary"><FileText size={20} strokeWidth={1.75} /></span>
                  <span className="min-w-0 flex-1">
                    <span className="block text-heading">Catatan {data.nama}</span>
                    <span className="block text-caption text-ink2">PDF</span>
                  </span>
                  <span className="flex items-center gap-1 text-body font-bold text-primary">Buka <ExternalLink size={14} strokeWidth={2} /></span>
                </Kartu>
              </a>
            ) : (
              <Kartu className="flex items-center gap-3 bg-bg">
                <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-sunken text-ink3"><FileText size={20} strokeWidth={1.75} /></span>
                <p className="text-body text-ink3">Catatan PDF segera hadir</p>
              </Kartu>
            )}

            <Kartu className="flex flex-col gap-3">
              <div>
                <h2 className="text-heading">{data.selesai ? 'Sub materi ini sudah selesai' : 'Sudah paham sub materinya?'}</h2>
                <p className="text-caption text-ink2">{data.selesai ? 'Progresmu sudah tercatat.' : 'Tandai agar progresmu tercatat.'}</p>
              </div>
              {galatTandai && <Pesan>{galatTandai}</Pesan>}
              <Tombol jenis={data.selesai ? 'soft' : 'secondary'} penuh ikon={Check} memuat={sibuk} onClick={ubahSelesai}>
                {data.selesai ? 'Batal tandai' : 'Tandai selesai'}
              </Tombol>
            </Kartu>
            </div>

            {stok > 0 && (
              <Link to={`/latihan/subtes/${data.subtes.id}?materi=${data.materi.id}`} className="md:self-start"><Tombol penuh ikonKanan={ArrowRight} tabIndex={-1}>Latihan {stok} soal {data.materi.nama}</Tombol></Link>
            )}

            {(sebelum || berikut) && (
              <nav aria-label="Sub materi lain" className="flex items-center justify-between gap-2">
                <TautanSaudara materi={sebelum} arah="mundur" />
                <TautanSaudara materi={berikut} arah="maju" />
              </nav>
            )}
            </div>
          </div>
        )}
      </main>
    </>
  );
}
