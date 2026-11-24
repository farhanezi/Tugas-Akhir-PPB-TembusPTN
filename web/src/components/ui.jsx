import { useEffect, useId, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { ChevronLeft, CircleCheck, CircleX, Eye, EyeOff, Flag, Image, LoaderCircle, RefreshCw, X } from 'lucide-react';

const cx = (...a) => a.filter(Boolean).join(' ');

export function Logo({ putih, className }) {
  return (
    <div className={cx('flex items-center gap-2', putih && 'text-white', className)}>
      <span className="grid size-8 place-items-center rounded-[10px] bg-lime text-lime-ink"><Flag size={18} strokeWidth={1.75} /></span>
      <span className="text-[18px] font-bold tracking-[-0.01em]">TembusPTN</span>
    </div>
  );
}

const JENIS = {
  primary: 'bg-primary text-white hover:bg-primary-dark active:bg-primary-dark',
  secondary: 'bg-surface text-ink ring-1 ring-inset ring-line hover:bg-bg active:bg-sunken',
  soft: 'bg-primary-soft text-primary hover:brightness-95',
  lime: 'bg-lime text-lime-ink hover:brightness-95',
};

export function Tombol({ jenis = 'primary', kecil, memuat, penuh, ikon: Ikon, ikonKanan: IkonKanan, className, children, disabled, ...p }) {
  const mati = disabled || memuat;
  return (
    <button
      {...p}
      disabled={mati}
      aria-busy={memuat || undefined}
      className={cx(
        'inline-flex items-center justify-center gap-2 rounded-full font-semibold transition-[background-color,filter,transform] duration-150 active:scale-[0.98]',
        kecil ? 'h-10 px-4 text-[13px]' : 'h-13 px-6 text-[15px]',
        penuh && 'w-full',
        mati && !memuat ? 'cursor-not-allowed bg-sunken text-ink3' : JENIS[jenis],
        memuat && 'cursor-progress opacity-80',
        className
      )}
    >
      {memuat ? <LoaderCircle size={18} className="animate-spin" /> : Ikon && <Ikon size={kecil ? 16 : 18} strokeWidth={1.75} />}
      {children}
      {IkonKanan && !memuat && <IkonKanan size={kecil ? 16 : 18} strokeWidth={1.75} />}
    </button>
  );
}

export function Isian({ label, ikon: Ikon, galat, bantuan, type = 'text', ...p }) {
  const id = useId();
  const [tampil, setTampil] = useState(false);
  const sandi = type === 'password';
  return (
    <div className="flex flex-col gap-1.5">
      <label htmlFor={id} className="text-[13px] leading-[18px] font-semibold">{label}</label>
      <div className={cx(
        'flex h-13 items-center gap-2.5 rounded-field bg-surface px-4 ring-1 ring-inset transition-shadow duration-150 focus-within:ring-2',
        galat ? 'ring-bad focus-within:ring-bad' : 'ring-line focus-within:ring-primary'
      )}>
        {Ikon && <Ikon size={18} strokeWidth={1.75} className="shrink-0 text-ink3" />}
        <input
          id={id}
          type={sandi && tampil ? 'text' : type}
          aria-invalid={galat ? true : undefined}
          aria-describedby={galat || bantuan ? `${id}-ket` : undefined}
          className="h-full min-w-0 flex-1 bg-transparent text-[15px] outline-none placeholder:text-ink3"
          {...p}
        />
        {sandi && (
          <button type="button" onClick={() => setTampil((v) => !v)} aria-label={tampil ? 'Sembunyikan kata sandi' : 'Tampilkan kata sandi'} className="-mr-2 grid size-10 place-items-center rounded-full text-ink3 hover:text-ink">
            {tampil ? <EyeOff size={18} strokeWidth={1.75} /> : <Eye size={18} strokeWidth={1.75} />}
          </button>
        )}
      </div>
      {(galat || bantuan) && <p id={`${id}-ket`} className={cx('text-caption', galat ? 'text-bad' : 'text-ink3')}>{galat || bantuan}</p>}
    </div>
  );
}

export function Pesan({ jenis = 'bad', children }) {
  if (!children) return null;
  const warna = jenis === 'ok' ? 'bg-ok-soft text-ok' : 'bg-bad-soft text-bad';
  return <p role={jenis === 'ok' ? 'status' : 'alert'} className={cx('rounded-field px-4 py-3 text-body font-medium', warna)}>{children}</p>;
}

// Tempat gambar yang belum ada. Ganti dengan <img> saat asetnya siap.
export function GambarPlaceholder({ nama, instruksi, gelap, className }) {
  return (
    <div className={cx('flex flex-col items-center justify-center gap-1.5 rounded-card border border-dashed p-4 text-center', gelap ? 'border-panel-line text-white' : 'border-ink3 bg-sunken', className)}>
      <Image size={24} strokeWidth={1.75} className={gelap ? 'text-lime' : 'text-ink2'} />
      <p className="text-[13px] leading-[18px] font-bold">Placeholder: {nama}</p>
      <p className={cx('text-[12px] leading-[17px] font-medium', gelap ? 'text-panel-text' : 'text-ink2')}>{instruksi}</p>
    </div>
  );
}

// Bingkai sederhana untuk layar tunggal (memuat, pesan): kolom sempit di tengah.
export function Layar({ children, className, lebar }) {
  return <div className={cx('mx-auto flex min-h-dvh w-full flex-col bg-bg', !lebar && 'max-w-[430px]', className)}>{children}</div>;
}

// Jarak tepi isi halaman: 20 di ponsel, 16 di tablet (kolom 720), 48 di desktop.
export const TEPI = 'px-5 md:px-4 lg:px-12';

// Halaman Masuk dan Daftar: satu kolom di ponsel, terbelah dengan panel merek di desktop.
export function LayarAuth({ children }) {
  return (
    <div className="flex min-h-dvh bg-bg">
      <aside className="hidden w-[44%] max-w-[640px] shrink-0 flex-col gap-7 bg-panel p-14 lg:flex">
        <Logo putih />
        <GambarPlaceholder gelap className="mt-auto h-[300px]" nama="ilustrasi masuk (desktop)" instruksi="Ilustrasi datar 528 x 300: siswa SMA belajar dengan laptop dan gerbang kampus di latar. Warna hijau tua, lime, putih. Tanpa teks." />
        <div className="flex flex-col gap-2.5">
          <p className="text-[34px] leading-[42px] font-bold tracking-[-0.02em] text-white">Materi, latihan, dan try out UTBK dalam satu tempat</p>
          <p className="text-[16px] leading-6 text-panel-text">Pasang target prodimu, lalu lihat berapa poin lagi jaraknya.</p>
        </div>
      </aside>
      <div className="flex min-w-0 flex-1 flex-col md:justify-center">
        <div className="mx-auto flex w-full max-w-[440px] flex-1 flex-col gap-6 px-5 pt-6 pb-8 md:flex-none">{children}</div>
      </div>
    </div>
  );
}

// Bar atas halaman dalam: tombol kembali (atau tutup) + judul pendek.
export function BarAtas({ judul, ke, tutup, onKembali, kanan }) {
  const nav = useNavigate();
  const Ikon = tutup ? X : ChevronLeft;
  const label = tutup ? 'Tutup' : 'Kembali';
  const isi = <span className="grid size-10 place-items-center rounded-full text-ink hover:bg-sunken"><Ikon size={22} strokeWidth={1.75} /></span>;
  return (
    <header className="sticky top-0 z-10 flex h-14 shrink-0 items-center gap-1 bg-bg px-3 md:px-2 lg:px-10">
      {ke && !onKembali
        ? <Link to={ke} aria-label={label}>{isi}</Link>
        : <button type="button" onClick={onKembali || (() => nav(-1))} aria-label={label}>{isi}</button>}
      <div className="min-w-0 flex-1 truncate text-heading">{judul}</div>
      {kanan}
    </header>
  );
}

export function Progres({ nilai, warna = 'bg-primary', className }) {
  const n = Math.max(0, Math.min(100, Number.isFinite(nilai) ? nilai : 0));
  return (
    <div role="progressbar" aria-valuenow={Math.round(n)} aria-valuemin={0} aria-valuemax={100} className={cx('h-2 overflow-hidden rounded-full bg-sunken', className)}>
      <div className={cx('h-full rounded-full transition-[width] duration-300', warna)} style={{ width: `${n}%` }} />
    </div>
  );
}

export const Kartu = ({ className, children, ...p }) => (
  <div {...p} className={cx('rounded-card bg-surface p-4 ring-1 ring-inset ring-line', className)}>{children}</div>
);

// Keadaan galat bagi bagian halaman yang gagal dimuat.
export function GalatMuat({ galat, onUlang }) {
  return (
    <div className="flex flex-col gap-3">
      <Pesan>{galat?.message || 'Data tidak bisa dimuat.'}</Pesan>
      {onUlang && <Tombol jenis="secondary" ikon={RefreshCw} onClick={onUlang}>Coba lagi</Tombol>}
    </div>
  );
}

export const Kerangka = ({ className }) => <div className={cx('kerangka', className)} aria-hidden="true" />;

export function MemuatDaftar({ tinggi = ['h-24', 'h-24', 'h-24'] }) {
  return (
    <div className="flex flex-col gap-3" role="status" aria-label="Memuat">
      {tinggi.map((t, i) => <Kerangka key={i} className={t} />)}
    </div>
  );
}

const CHIP = {
  netral: 'bg-sunken text-ink2',
  ok: 'bg-ok-soft text-ok',
  bad: 'bg-bad-soft text-bad',
  warn: 'bg-warn-soft text-warn',
  lime: 'bg-lime text-lime-ink',
  primary: 'bg-primary text-white',
};
// Label kecil. Dengan onClick menjadi tombol saring: pemanggil memberi warna hanya saat aktif.
export function Chip({ jenis = 'netral', onClick, aktif, children }) {
  const kelas = cx('inline-flex h-7 shrink-0 items-center rounded-full px-3 text-[12px] leading-4 font-semibold whitespace-nowrap', CHIP[jenis]);
  if (!onClick) return <span className={kelas}>{children}</span>;
  return <button type="button" onClick={onClick} aria-pressed={aktif} className={cx(kelas, 'h-9 px-3.5 text-[13px]')}>{children}</button>;
}

export function Stat({ nilai, label, warna }) {
  return (
    <div className="flex min-w-0 flex-1 flex-col gap-0.5 rounded-2xl bg-surface p-3.5 ring-1 ring-inset ring-line">
      <p className={cx('truncate text-[22px] leading-7 font-bold tracking-[-0.01em]', warna)}>{nilai ?? '–'}</p>
      <p className="text-caption text-ink2">{label}</p>
    </div>
  );
}

export const JudulBagian = ({ children, kanan }) => (
  <div className="flex items-center gap-2">
    <h2 className="min-w-0 flex-1 text-heading">{children}</h2>
    {kanan}
  </div>
);

// Bar aksi yang menempel di dasar layar (halaman tanpa menu bawah).
export function BarBawah({ className, children }) {
  return (
    <div className={cx('sticky bottom-0 z-10 mt-auto border-t border-line bg-surface px-5 pt-3 pb-[max(env(safe-area-inset-bottom),16px)] md:px-4', className)}>
      {children}
    </div>
  );
}

// Opsi jawaban. keadaan: undefined | 'pilih' | 'benar' | 'salah'
export function Opsi({ label, isi, keadaan, onClick, disabled }) {
  const K = {
    pilih: ['bg-primary-soft ring-2 ring-primary', 'bg-primary text-white'],
    benar: ['bg-ok-soft ring-2 ring-ok', 'bg-ok text-white'],
    salah: ['bg-bad-soft ring-2 ring-bad', 'bg-bad text-white'],
  }[keadaan] || ['bg-surface ring-1 ring-line', 'bg-sunken text-ink2'];
  const Tag = onClick ? 'button' : 'div';
  return (
    <Tag
      {...(onClick ? { type: 'button', onClick, disabled, 'aria-pressed': keadaan === 'pilih' } : {})}
      className={cx('flex w-full items-center gap-3 rounded-field py-3 pr-3.5 pl-3 text-left ring-inset transition-[background-color,box-shadow] duration-150', K[0], onClick && !disabled && 'active:scale-[0.99]')}
    >
      <span className={cx('grid size-7 shrink-0 place-items-center rounded-full text-[13px] font-bold', K[1])}>{label}</span>
      <span className={cx('min-w-0 flex-1 text-[15px] leading-[21px] break-words whitespace-pre-line', keadaan && 'font-semibold')}>{isi}</span>
      {keadaan === 'benar' && <CircleCheck size={20} strokeWidth={1.75} className="shrink-0 text-ok" aria-label="Benar" />}
      {keadaan === 'salah' && <CircleX size={20} strokeWidth={1.75} className="shrink-0 text-bad" aria-label="Salah" />}
    </Tag>
  );
}

// Wacana (bila ada), gambar (bila ada), lalu pertanyaan.
export function IsiSoal({ soal, besar }) {
  return (
    <div className="flex flex-col gap-4">
      {soal.wacana && <div className="rounded-card bg-sunken p-4 text-[15px] leading-6 break-words whitespace-pre-line">{soal.wacana}</div>}
      {soal.gambar_url && <img src={soal.gambar_url} alt="Gambar soal" className="max-h-80 w-full rounded-card bg-surface object-contain ring-1 ring-line" loading="lazy" />}
      <p className={cx('text-[17px] leading-[26px] font-medium break-words whitespace-pre-line', besar && 'lg:text-[20px] lg:leading-[30px]')}>{soal.pertanyaan}</p>
    </div>
  );
}

// Elemen khas: jarak skor ke target pada skala 200-800.
export function JarakTarget({ skor, target, gelap = true }) {
  const pos = (v) => Math.max(0, Math.min(100, ((v - 200) / 600) * 100));
  const pt = pos(target);
  const ps = skor != null ? pos(skor) : null;
  const tinta = gelap ? 'text-white' : 'text-ink';
  const redup = gelap ? 'text-panel-text' : 'text-ink3';
  const aksen = gelap ? 'text-lime' : 'text-primary';
  return (
    <div className="relative h-[62px] w-full text-[12px] leading-4" role="img" aria-label={`Skala 200 sampai 800. Target ${target}${skor != null ? `, skormu ${skor}` : ''}.`}>
      <span className={cx('absolute top-0 font-semibold whitespace-nowrap', tinta)} style={pt < 32 ? { left: `calc(${pt}% + 6px)` } : { right: `calc(${100 - pt}% + 6px)` }}>Target {target}</span>
      <div className={cx('absolute inset-x-0 top-[26px] h-2.5 overflow-hidden rounded-full', gelap ? 'bg-panel-line' : 'bg-sunken')}>
        {ps != null && <div className={cx('h-full rounded-full', gelap ? 'bg-lime' : 'bg-primary')} style={{ width: `${ps}%` }} />}
      </div>
      <span className={cx('absolute top-5 h-[22px] w-0.5 -translate-x-1/2 rounded-full', gelap ? 'bg-white' : 'bg-ink')} style={{ left: `${pt}%` }} />
      {(ps == null || ps > 22) && <span className={cx('absolute top-[46px] left-0 font-medium', redup)}>200</span>}
      {ps != null && (
        <span className={cx('absolute top-[46px] font-semibold whitespace-nowrap', aksen)} style={ps <= 22 ? { left: 0 } : { right: `${100 - ps}%` }}>Kamu {skor}</span>
      )}
      {(ps == null || ps < 86) && <span className={cx('absolute top-[46px] right-0 font-medium', redup)}>800</span>}
    </div>
  );
}

// Dialog konfirmasi sederhana: lembar dari bawah di ponsel, kotak di tengah di layar lebar.
export function Dialog({ buka, judul, children, onTutup, aksi }) {
  useEffect(() => {
    if (!buka) return undefined;
    const tekan = (e) => e.key === 'Escape' && onTutup();
    document.addEventListener('keydown', tekan);
    return () => document.removeEventListener('keydown', tekan);
  }, [buka, onTutup]);
  if (!buka) return null;
  return (
    <div className="fixed inset-0 z-50 flex items-end justify-center bg-ink/50 md:items-center md:p-6" onClick={onTutup}>
      <div role="dialog" aria-modal="true" aria-label={judul} onClick={(e) => e.stopPropagation()} className="flex w-full max-w-[430px] flex-col gap-4 rounded-t-panel bg-surface px-5 pt-5 pb-[max(env(safe-area-inset-bottom),20px)] md:rounded-panel md:p-6">
        <div className="flex flex-col gap-1.5">
          <h2 className="text-title">{judul}</h2>
          <div className="text-body text-ink2">{children}</div>
        </div>
        <div className="flex flex-col gap-2.5">{aksi}</div>
      </div>
    </div>
  );
}
