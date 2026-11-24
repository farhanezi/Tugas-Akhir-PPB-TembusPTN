import { Link, NavLink } from 'react-router-dom';
import { BookOpen, Flag, House, PenLine, Timer, UserRound } from 'lucide-react';
import { useAuth } from '../auth/AuthProvider.jsx';
import { Logo } from './ui.jsx';

const MENU = [
  ['/', 'Dashboard', House],
  ['/materi', 'Materi', BookOpen],
  ['/latihan', 'Latihan', PenLine],
  ['/try-out', 'Try Out', Timer],
  ['/profil', 'Profil', UserRound],
];

// Ponsel: menu bawah lima tab.
export default function BottomNav() {
  return (
    <nav aria-label="Menu utama" className="sticky bottom-0 z-10 border-t border-line bg-surface px-2 pt-1 pb-[max(env(safe-area-inset-bottom),12px)] md:hidden">
      <ul className="mx-auto flex max-w-[560px]">
        {MENU.map(([ke, label, Ikon]) => (
          <li key={ke} className="flex-1">
            <NavLink to={ke} end={ke === '/'} className="group flex flex-col items-center gap-1 rounded-xl py-2 text-ink3 aria-[current=page]:text-primary">
              <span className="grid h-[30px] w-14 place-items-center rounded-full transition-colors duration-150 group-aria-[current=page]:bg-primary-soft">
                <Ikon size={20} strokeWidth={1.75} />
              </span>
              <span className="text-[11px] leading-[14px] font-medium group-aria-[current=page]:font-bold">{label}</span>
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  );
}

// Tablet: rel ikon 80 px. Desktop: sidebar 248 px dengan nama menu dan kartu akun.
export function SideNav() {
  const { profil, sesi } = useAuth();
  const nama = profil?.nama || '';
  const huruf = (nama || sesi?.user?.email || '?')[0].toUpperCase();
  const t = profil?.target;
  return (
    <aside className="sticky top-0 hidden h-dvh w-20 shrink-0 flex-col items-center gap-6 border-r border-line bg-surface px-2 py-5 md:flex lg:w-[248px] lg:items-stretch lg:gap-7 lg:px-4 lg:pt-7">
      <Link to="/" aria-label="TembusPTN" className="lg:px-2">
        <span className="grid size-9 place-items-center rounded-[11px] bg-lime text-lime-ink lg:hidden"><Flag size={20} strokeWidth={1.75} /></span>
        <Logo className="hidden lg:flex" />
      </Link>
      <nav aria-label="Menu utama" className="w-full">
        <ul className="flex flex-col gap-1.5 lg:gap-1">
          {MENU.map(([ke, label, Ikon]) => (
            <li key={ke}>
              <NavLink to={ke} end={ke === '/'} className="group flex flex-col items-center gap-1 rounded-xl py-1.5 text-ink2 hover:text-ink aria-[current=page]:text-primary lg:h-11 lg:flex-row lg:gap-3 lg:px-3 lg:py-0 lg:hover:bg-bg lg:aria-[current=page]:bg-primary-soft">
                <span className="grid h-9 w-12 place-items-center rounded-xl transition-colors duration-150 group-aria-[current=page]:bg-primary-soft lg:h-auto lg:w-auto lg:group-aria-[current=page]:bg-transparent">
                  <Ikon size={20} strokeWidth={1.75} />
                </span>
                <span className="text-[11px] leading-[14px] font-medium group-aria-[current=page]:font-bold lg:text-[14px] lg:leading-5">{label}</span>
              </NavLink>
            </li>
          ))}
        </ul>
      </nav>
      <Link to="/profil" aria-label="Akun" className="mt-auto flex items-center gap-2.5 rounded-2xl lg:bg-bg lg:p-3">
        <span className="grid size-9 shrink-0 place-items-center rounded-full bg-lime text-[14px] font-bold text-lime-ink">{huruf}</span>
        <span className="hidden min-w-0 flex-1 lg:block">
          <span className="block truncate text-[14px] leading-5 font-semibold">{nama || 'Tanpa nama'}</span>
          <span className="block truncate text-caption text-ink2">{t ? `Target: ${t.prodi} ${t.ptn}` : 'Belum ada target'}</span>
        </span>
      </Link>
    </aside>
  );
}
