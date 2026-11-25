// TembusPTN Design Generator - dibuat otomatis, jangan disunting manual.
var ICONS = {"flag":"<path d=\"M4 22V4a1 1 0 0 1 .4-.8A6 6 0 0 1 8 2c3 0 5 2 7.333 2q2 0 3.067-.8A1 1 0 0 1 20 4v10a1 1 0 0 1-.4.8A6 6 0 0 1 16 16c-3 0-5-2-8-2a6 6 0 0 0-4 1.528\" />","circle-check":"<circle cx=\"12\" cy=\"12\" r=\"10\" /><path d=\"m16 9-5.5 5.5L8 12\" />","circle-x":"<circle cx=\"12\" cy=\"12\" r=\"10\" /><path d=\"m15 9-6 6\" /><path d=\"m9 9 6 6\" />","image":"<rect width=\"18\" height=\"18\" x=\"3\" y=\"3\" rx=\"2\" ry=\"2\" /><circle cx=\"9\" cy=\"9\" r=\"2\" /><path d=\"m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21\" />","mail":"<path d=\"m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7\" /><rect x=\"2\" y=\"4\" width=\"20\" height=\"16\" rx=\"2\" />","lock":"<rect width=\"18\" height=\"11\" x=\"3\" y=\"11\" rx=\"2\" ry=\"2\" /><path d=\"M7 11V7a5 5 0 0 1 10 0v4\" />","eye":"<path d=\"M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0\" /><circle cx=\"12\" cy=\"12\" r=\"3\" />","search":"<path d=\"m21 21-4.34-4.34\" /><circle cx=\"11\" cy=\"11\" r=\"8\" />","check":"<path d=\"M20 6 9 17l-5-5\" />","book-open":"<path d=\"M12 5v16\" /><path d=\"M20.001 19A2 2 0 0022 17V5a2 2 0 00-1.999-2L16 3.002A5 5 0 0012 5a5 5 0 00-4-2H4a2 2 0 00-2 2v12a2 2 0 001.999 2H8a5 5 0 014 2 5 5 0 014-2z\" />","pen-line":"<path d=\"M13 21h8\" /><path d=\"M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z\" />","timer":"<line x1=\"10\" x2=\"14\" y1=\"2\" y2=\"2\" /><line x1=\"12\" x2=\"15\" y1=\"14\" y2=\"11\" /><circle cx=\"12\" cy=\"14\" r=\"8\" />","arrow-right":"<path d=\"M5 12h14\" /><path d=\"m12 5 7 7-7 7\" />","house":"<path d=\"M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8\" /><path d=\"M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z\" />","user-round":"<circle cx=\"12\" cy=\"8\" r=\"5\" /><path d=\"M20 21a8 8 0 0 0-16 0\" />","chevron-right":"<path d=\"m9 18 6-6-6-6\" />","chevron-left":"<path d=\"m15 18-6-6 6-6\" />","play":"<path d=\"M5 5a2 2 0 0 1 3.008-1.728l11.997 6.998a2 2 0 0 1 .003 3.458l-12 7A2 2 0 0 1 5 19z\" />","file-text":"<path d=\"M6 22a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h8a2.4 2.4 0 0 1 1.704.706l3.588 3.588A2.4 2.4 0 0 1 20 8v12a2 2 0 0 1-2 2z\" /><path d=\"M14 2v5a1 1 0 0 0 1 1h5\" /><path d=\"M10 9H8\" /><path d=\"M16 13H8\" /><path d=\"M16 17H8\" />","x":"<path d=\"M18 6 6 18\" /><path d=\"m6 6 12 12\" />","lightbulb":"<path d=\"M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1 .2 2.2 1.5 3.5.7.7 1.3 1.5 1.5 2.5\" /><path d=\"M9 18h6\" /><path d=\"M10 22h4\" />","rotate-ccw":"<path d=\"M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8\" /><path d=\"M3 3v5h5\" />","clock":"<circle cx=\"12\" cy=\"12\" r=\"10\" /><path d=\"M12 6v6l4 2\" />","layout-grid":"<rect width=\"7\" height=\"7\" x=\"3\" y=\"3\" rx=\"1\" /><rect width=\"7\" height=\"7\" x=\"14\" y=\"3\" rx=\"1\" /><rect width=\"7\" height=\"7\" x=\"14\" y=\"14\" rx=\"1\" /><rect width=\"7\" height=\"7\" x=\"3\" y=\"14\" rx=\"1\" />","target":"<circle cx=\"12\" cy=\"12\" r=\"10\" /><circle cx=\"12\" cy=\"12\" r=\"6\" /><circle cx=\"12\" cy=\"12\" r=\"2\" />","history":"<path d=\"M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8\" /><path d=\"M3 3v5h5\" /><path d=\"M12 7v5l4 2\" />","log-out":"<path d=\"m16 17 5-5-5-5\" /><path d=\"M21 12H9\" /><path d=\"M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4\" />"};
// TembusPTN - definisi layar (dipakai oleh plugin Figma dan pratinjau HTML).
// Ditulis dengan sintaks konservatif agar jalan di sandbox plugin Figma.

var C = {
  bg: '#F3F6F2', surface: '#FFFFFF', sunken: '#EAEFE9', line: '#DDE4DC',
  ink: '#0F1F17', ink2: '#44544B', ink3: '#66746B',
  primary: '#0B5D3B', primaryDark: '#08432B', primarySoft: '#E1F0E6',
  lime: '#C6F25A', limeInk: '#1E3A0F',
  panel: '#0C2B1E', panelLine: '#214736', panelText: '#A9C2B4',
  ok: '#1B7F45', okSoft: '#E0F3E7',
  bad: '#BE3329', badSoft: '#FBE8E5',
  warn: '#8A5A0B', warnSoft: '#FBEFCF', warnFill: '#F0B429',
  white: '#FFFFFF'
};
var W = 390, PAD = 20, CW = W - PAD * 2;

function kids(args, from) {
  var out = [];
  for (var i = from; i < args.length; i++) {
    var a = args[i];
    if (a === null || a === undefined || a === false) continue;
    if (Array.isArray(a)) { for (var j = 0; j < a.length; j++) if (a[j]) out.push(a[j]); }
    else out.push(a);
  }
  return out;
}
function V(p) { p = p || {}; p.dir = 'v'; return { t: 'f', p: p, k: kids(arguments, 1) }; }
function H(p) { p = p || {}; p.dir = 'h'; return { t: 'f', p: p, k: kids(arguments, 1) }; }
function A(p) { p = p || {}; p.layout = 'none'; return { t: 'f', p: p, k: kids(arguments, 1) }; }
function T(s, p) { return { t: 't', s: String(s), p: p || {} }; }
function I(n, size, color) { return { t: 'i', n: n, size: size || 20, color: color || C.ink }; }
function grow() { return V({ w: 'fill', h: 'fill', name: 'spacer' }); }
function rule(color) { return H({ w: 'fill', h: 1, fill: color || C.line, name: 'garis' }); }

// ---------- teks ----------
function display(s, color) { return T(s, { size: 28, weight: 700, color: color || C.ink, lh: 34, ls: -2, w: 'fill' }); }
function title(s, color) { return T(s, { size: 20, weight: 700, color: color || C.ink, lh: 26, ls: -1, w: 'fill' }); }
function heading(s, color, hug) { return T(s, { size: 16, weight: 600, color: color || C.ink, lh: 22, w: hug ? undefined : 'fill' }); }
function body(s, color) { return T(s, { size: 14, weight: 400, color: color || C.ink2, lh: 21, w: 'fill' }); }
function small(s, color, hug) { return T(s, { size: 12, weight: 500, color: color || C.ink3, lh: 16, w: hug ? undefined : 'fill' }); }

// ---------- komponen ----------
function btn(label, kind, o) {
  o = o || {};
  var fill = C.primary, color = C.white, stroke;
  if (kind === 'secondary') { fill = C.surface; color = C.ink; stroke = C.line; }
  if (kind === 'soft') { fill = C.primarySoft; color = C.primary; }
  if (kind === 'lime') { fill = C.lime; color = C.limeInk; }
  if (kind === 'ghost') { fill = null; color = C.primary; }
  if (kind === 'disabled') { fill = C.sunken; color = C.ink3; }
  if (kind === 'danger') { fill = C.surface; color = C.bad; stroke = C.line; }
  var sm = o.size === 'sm';
  return H({ name: 'Tombol/' + (kind || 'primary'), w: o.w, h: sm ? 40 : 52, p: [0, sm ? 16 : 24, 0, sm ? 16 : 24], gap: 8, ai: 'center', jc: 'center', fill: fill, stroke: stroke, r: 999 },
    o.icon ? I(o.icon, sm ? 16 : 18, color) : null,
    T(label, { size: sm ? 13 : 15, weight: 600, color: color, lh: 20 }),
    o.iconRight ? I(o.iconRight, sm ? 16 : 18, color) : null);
}
function chip(label, tone) {
  var fill = C.sunken, color = C.ink2;
  if (tone === 'ok') { fill = C.okSoft; color = C.ok; }
  if (tone === 'bad') { fill = C.badSoft; color = C.bad; }
  if (tone === 'warn') { fill = C.warnSoft; color = C.warn; }
  if (tone === 'primary') { fill = C.primarySoft; color = C.primary; }
  if (tone === 'lime') { fill = C.lime; color = C.limeInk; }
  if (tone === 'panel') { fill = C.panelLine; color = C.white; }
  return H({ name: 'Label', p: [4, 10, 4, 10], r: 999, fill: fill, ai: 'center' }, T(label, { size: 12, weight: 600, color: color, lh: 16 }));
}
function card(p) {
  p = p || {};
  if (p.fill === undefined) p.fill = C.surface;
  if (p.stroke === undefined) p.stroke = C.line;
  if (p.r === undefined) p.r = 20;
  if (p.p === undefined) p.p = 16;
  if (p.w === undefined) p.w = 'fill';
  if (p.gap === undefined) p.gap = 12;
  p.dir = 'v';
  return { t: 'f', p: p, k: kids(arguments, 1) };
}
function progress(w, pct, color, track) {
  var fw = Math.max(0, Math.round(w * pct / 100));
  return A({ name: 'Progres', w: w, h: 6, r: 999, fill: track || C.sunken, clip: true },
    fw > 0 ? H({ x: 0, y: 0, w: fw, h: 6, r: 999, fill: color || C.primary }) : null);
}
function iconTile(name, fill, color, size) {
  size = size || 40;
  return H({ name: 'Ikon', w: size, h: size, r: 12, fill: fill || C.primarySoft, ai: 'center', jc: 'center' }, I(name, Math.round(size / 2), color || C.primary));
}
function avatar(initial, size) {
  size = size || 40;
  return H({ name: 'Avatar', w: size, h: size, r: 999, fill: C.lime, ai: 'center', jc: 'center' }, T(initial, { size: Math.round(size * 0.4), weight: 700, color: C.limeInk }));
}
function statusBar(dark) {
  var c = dark ? C.white : C.ink;
  return H({ name: 'Status bar', w: 'fill', h: 44, p: [0, 24, 0, 24], ai: 'center', jc: 'between' },
    T('9.41', { size: 14, weight: 600, color: c }),
    H({ gap: 5, ai: 'center' }, H({ w: 16, h: 10, r: 2, fill: c }), H({ w: 14, h: 10, r: 2, fill: c }), H({ w: 22, h: 11, r: 3, fill: c })));
}
function topbar(text, o) {
  o = o || {};
  return H({ name: 'Bar atas', w: 'fill', h: 56, p: [0, 12, 0, 12], gap: 4, ai: 'center' },
    H({ w: 40, h: 40, r: 999, ai: 'center', jc: 'center' }, I(o.close ? 'x' : 'chevron-left', 22, C.ink)),
    T(text, { size: 16, weight: 600, color: C.ink, w: 'fill', lh: 22 }),
    o.right || null);
}
function bottomNav(active) {
  var items = [['Dashboard', 'house'], ['Materi', 'book-open'], ['Latihan', 'pen-line'], ['Try Out', 'timer'], ['Profil', 'user-round']];
  var row = [];
  for (var i = 0; i < items.length; i++) {
    var on = items[i][0] === active, col = on ? C.primary : C.ink3;
    row.push(V({ name: 'Nav/' + items[i][0], w: 'fill', gap: 4, ai: 'center', p: [8, 0, 8, 0] },
      H({ w: 56, h: 30, r: 999, fill: on ? C.primarySoft : null, ai: 'center', jc: 'center' }, I(items[i][1], 20, col)),
      T(items[i][0], { size: 11, weight: on ? 700 : 500, color: col, lh: 14 })));
  }
  return V({ name: 'Bottom Nav', w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [4, 8, 20, 8] }, row));
}
function screen(name, o) {
  o = o || {};
  var content = kids(arguments, 2);
  var minH = o.h ? undefined : 844 - 44 - (o.top ? 56 : 0) - (o.nav ? 89 : 0) - (o.bottom ? 93 : 0);
  return V({ name: name, w: W, h: o.h || 'hug', fill: o.bg || C.bg, clip: true, screen: true },
    statusBar(o.dark),
    o.top || null,
    V({ name: 'Isi', w: 'fill', h: o.h ? 'fill' : undefined, minH: minH, p: o.p === undefined ? [8, PAD, 24, PAD] : o.p, gap: o.gap === undefined ? 20 : o.gap }, content),
    o.bottom || null,
    o.nav ? bottomNav(o.nav) : null);
}
function section(titleText, right) {
  return H({ w: 'fill', ai: 'center', gap: 8 }, heading(titleText), right ? T(right, { size: 13, weight: 600, color: C.primary, lh: 18 }) : null);
}
function field(label, value, o) {
  o = o || {};
  return V({ w: 'fill', gap: 6, name: 'Isian/' + label },
    T(label, { size: 13, weight: 600, color: C.ink, lh: 18 }),
    H({ w: 'fill', h: 52, p: [0, 16, 0, 16], gap: 10, r: 14, fill: C.surface, stroke: o.focus ? C.primary : C.line, sw: o.focus ? 2 : 1, ai: 'center' },
      o.icon ? I(o.icon, 18, C.ink3) : null,
      T(value, { size: 15, weight: 400, color: o.placeholder ? C.ink3 : C.ink, w: 'fill', lh: 20 }),
      o.right ? I(o.right, 18, C.ink3) : null));
}

// Elemen khas: jarak skor ke target pada skala 200-800.
function scoreTrack(w, skor, target, dark) {
  var x = function (v) { return Math.round((v - 200) / 600 * w); };
  var base = dark ? C.panelLine : C.sunken, txt = dark ? C.panelText : C.ink3, ink = dark ? C.white : C.ink;
  return A({ name: 'Jarak ke target', w: w, h: 62 },
    T('Target ' + target, { x: x(target) - 92, y: 0, w: 90, align: 'right', size: 12, weight: 600, color: ink, lh: 16 }),
    H({ x: 0, y: 26, w: w, h: 10, r: 999, fill: base }),
    skor ? H({ x: 0, y: 26, w: x(skor), h: 10, r: 999, fill: dark ? C.lime : C.primary }) : null,
    H({ x: x(target) - 1, y: 20, w: 2, h: 22, r: 1, fill: ink }),
    T('200', { x: 0, y: 46, size: 12, weight: 500, color: txt, lh: 16 }),
    skor ? T('Kamu ' + skor, { x: Math.max(34, x(skor) - 60), y: 46, w: 60, align: 'right', size: 12, weight: 600, color: dark ? C.lime : C.primary, lh: 16 }) : null,
    T('800', { x: w - 24, y: 46, w: 24, align: 'right', size: 12, weight: 500, color: txt, lh: 16 }));
}

// Placeholder gambar: ganti isinya dengan gambar asli sesuai instruksi di dalamnya.
function ph(nama, instruksi, h, dark) {
  return V({ name: 'GAMBAR: ' + nama, w: 'fill', h: h, r: 20, p: 16, gap: 6, ai: 'center', jc: 'center', fill: dark ? C.panel : C.sunken, stroke: dark ? C.panelLine : C.ink3, dash: true },
    I(dark ? 'play' : 'image', 24, dark ? C.lime : C.ink2),
    T('Placeholder: ' + nama, { size: 13, weight: 700, color: dark ? C.white : C.ink, lh: 18, w: 'fill', align: 'center' }),
    T(instruksi, { size: 12, weight: 500, color: dark ? C.panelText : C.ink2, lh: 17, w: 'fill', align: 'center' }));
}

// ---------- data contoh ----------
var SUBTES = [
  { nama: 'Penalaran Umum', kel: 'TPS', soal: 30, menit: '30', materi: 3, selesai: 3, stok: 0, skor: 640, benar: 22, pakai: '28 mnt' },
  { nama: 'Pengetahuan dan Pemahaman Umum', kel: 'TPS', soal: 20, menit: '15', materi: 5, selesai: 2, stok: 0, skor: 598, benar: 13, pakai: '15 mnt' },
  { nama: 'Pemahaman Bacaan dan Menulis', kel: 'TPS', soal: 20, menit: '25', materi: 4, selesai: 0, stok: 0, skor: 655, benar: 15, pakai: '22 mnt' },
  { nama: 'Pengetahuan Kuantitatif', kel: 'TPS', soal: 20, menit: '20', materi: 4, selesai: 1, stok: 48, skor: 540, benar: 11, pakai: '20 mnt' },
  { nama: 'Literasi Bahasa Indonesia', kel: 'LIT', soal: 30, menit: '42,5', materi: 4, selesai: 0, stok: 0, skor: 668, benar: 23, pakai: '39 mnt' },
  { nama: 'Literasi Bahasa Inggris', kel: 'LIT', soal: 20, menit: '20', materi: 4, selesai: 0, stok: 0, skor: 620, benar: 14, pakai: '20 mnt' },
  { nama: 'Penalaran Matematika', kel: 'LIT', soal: 20, menit: '42,5', materi: 5, selesai: 0, stok: 36, skor: 563, benar: 11, pakai: '42 mnt' }
];
var SKOR = 612, TARGET = 695;

// ---------- layar ----------
function brand(color) {
  return H({ gap: 8, ai: 'center', name: 'Logo' },
    H({ w: 32, h: 32, r: 10, fill: C.lime, ai: 'center', jc: 'center' }, I('flag', 18, C.limeInk)),
    T('TembusPTN', { size: 18, weight: 700, color: color || C.ink, ls: -1 }));
}
function sMasuk(daftar) {
  return screen(daftar ? '02 Daftar' : '01 Masuk', { h: 844, p: [24, PAD, 32, PAD], gap: 24 },
    brand(),
    daftar ? null : ph('ilustrasi masuk', 'Ilustrasi datar 350 x 160: siswa SMA belajar dengan laptop dan gerbang kampus di latar. Warna hijau tua, lime, putih. Tanpa teks.', 160),
    V({ w: 'fill', gap: 8 },
      display(daftar ? 'Buat akun, lalu pasang targetmu' : 'Masuk dan lanjutkan belajarmu'),
      body(daftar ? 'Progres, latihan, dan hasil try out tersimpan di akunmu.' : 'Materi, latihan soal, dan try out UTBK dalam satu tempat.')),
    V({ w: 'fill', gap: 14 },
      daftar ? field('Nama', 'Farhan Aira') : null,
      field('Email', 'farhan@contoh.id', { icon: 'mail', focus: !daftar }),
      field('Kata sandi', daftar ? 'Minimal 8 karakter' : '••••••••••', { icon: 'lock', right: 'eye', placeholder: daftar })),
    btn(daftar ? 'Buat akun' : 'Masuk', 'primary', { w: 'fill' }),
    grow(),
    H({ w: 'fill', jc: 'center', gap: 6 },
      T(daftar ? 'Sudah punya akun?' : 'Belum punya akun?', { size: 14, color: C.ink2 }),
      T(daftar ? 'Masuk' : 'Daftar', { size: 14, weight: 700, color: C.primary })));
}
function sTarget() {
  var rows = [['ITB', 'STEI-K', 695, true], ['ITB', 'FTI', 672, false], ['ITB', 'FMIPA', 641, false]];
  var list = [];
  for (var i = 0; i < rows.length; i++) {
    var r = rows[i];
    list.push(H({ w: 'fill', p: [12, 14, 12, 14], gap: 12, r: 14, ai: 'center', fill: r[3] ? C.primarySoft : C.surface, stroke: r[3] ? C.primary : C.line, sw: r[3] ? 2 : 1 },
      V({ w: 'fill', gap: 2 }, heading(r[1]), small('Skor target ' + r[2] + ' (estimasi)', C.ink2)),
      H({ w: 22, h: 22, r: 999, fill: r[3] ? C.primary : C.surface, stroke: r[3] ? null : C.line, ai: 'center', jc: 'center' }, r[3] ? I('check', 14, C.white) : null)));
  }
  return screen('03 Pilih Target', { h: 844, p: [8, PAD, 24, PAD], gap: 20, top: H({ w: 'fill', h: 56, p: [0, PAD, 0, PAD], ai: 'center', jc: 'between' }, brand(), T('Lewati', { size: 14, weight: 600, color: C.ink2 })) },
    V({ w: 'fill', gap: 8 }, display('Mau tembus ke mana?'), body('Target dipakai untuk menghitung jarak skormu. Bisa diubah kapan saja di Profil.')),
    field('Cari PTN atau prodi', 'ITB', { icon: 'search' }),
    V({ w: 'fill', gap: 10 }, small('Institut Teknologi Bandung · 3 prodi', C.ink2), list),
    small('Skor target adalah estimasi dari data komunitas tahun lalu, bukan angka resmi.'),
    grow(),
    btn('Simpan target', 'primary', { w: 'fill' }));
}
function lemahRow(materi, subtes, akurasi, n) {
  return V({ w: 'fill', gap: 10 },
    H({ w: 'fill', gap: 12, ai: 'center' },
      V({ w: 'fill', gap: 2 }, heading(materi), small(subtes, C.ink2)),
      V({ ai: 'end', gap: 2 }, T(akurasi + '%', { size: 16, weight: 700, color: C.bad, lh: 22 }), small(n + ' jawaban', C.ink3, true))),
    H({ w: 'fill', gap: 8 }, btn('Pelajari', 'secondary', { size: 'sm', w: 'fill', icon: 'book-open' }), btn('Latihan', 'soft', { size: 'sm', w: 'fill', icon: 'pen-line' })));
}
function sDashboard() {
  return screen('04 Dashboard', { nav: 'Dashboard' },
    H({ w: 'fill', ai: 'center', gap: 12 },
      V({ w: 'fill', gap: 2 }, title('Halo, Farhan'), small('Target: STEI-K ITB', C.ink2)),
      avatar('F')),
    V({ name: 'Banner capaian', w: 'fill', p: 20, gap: 16, r: 24, fill: C.panel },
      V({ w: 'fill', gap: 4 },
        T('83 poin lagi', { size: 34, weight: 700, color: C.white, lh: 40, ls: -2, w: 'fill' }),
        T('menuju skor target STEI-K ITB. Skor try out tertinggimu 612 (estimasi).', { size: 14, color: C.panelText, lh: 21, w: 'fill' })),
      scoreTrack(CW - 40, SKOR, TARGET, true)),
    V({ w: 'fill', gap: 12 },
      section('Perkuat yang lemah', 'Semua materi'),
      card({ gap: 16 },
        lemahRow('Geometri', 'Pengetahuan Kuantitatif', 42, 12), rule(),
        lemahRow('Teori peluang', 'Penalaran Matematika', 50, 8), rule(),
        lemahRow('Aljabar dan fungsi', 'Pengetahuan Kuantitatif', 58, 12))),
    V({ w: 'fill', gap: 12 },
      section('Try out berikutnya'),
      card({ gap: 14 },
        H({ w: 'fill', gap: 12, ai: 'center' },
          iconTile('timer', C.lime, C.limeInk, 44),
          V({ w: 'fill', gap: 2 }, heading('Try Out 2'), small('7 subtes · 160 soal · 3 jam 15 menit', C.ink2))),
        btn('Lihat try out', 'primary', { w: 'fill', iconRight: 'arrow-right' }))));
}
function sDashboardBaru() {
  var umum = [['Bilangan', 'Pengetahuan Kuantitatif'], ['Penalaran induktif', 'Penalaran Umum'], ['Fungsi', 'Penalaran Matematika']];
  var rows = [];
  for (var i = 0; i < umum.length; i++) {
    if (i) rows.push(rule());
    rows.push(H({ w: 'fill', gap: 12, ai: 'center' }, iconTile('book-open'), V({ w: 'fill', gap: 2 }, heading(umum[i][0]), small(umum[i][1], C.ink2)), I('chevron-right', 20, C.ink3)));
  }
  return screen('05 Dashboard - pengguna baru', { nav: 'Dashboard' },
    H({ w: 'fill', ai: 'center', gap: 12 }, V({ w: 'fill', gap: 2 }, title('Halo, Farhan'), small('Target: STEI-K ITB', C.ink2)), avatar('F')),
    V({ name: 'Banner capaian', w: 'fill', p: 20, gap: 16, r: 24, fill: C.panel },
      V({ w: 'fill', gap: 4 },
        T('Belum ada skor', { size: 28, weight: 700, color: C.white, lh: 34, ls: -2, w: 'fill' }),
        T('Kerjakan try out pertamamu untuk melihat jarak ke skor target 695.', { size: 14, color: C.panelText, lh: 21, w: 'fill' })),
      scoreTrack(CW - 40, 0, TARGET, true),
      btn('Mulai Try Out 1', 'lime', { w: 'fill', iconRight: 'arrow-right' })),
    V({ w: 'fill', gap: 12 }, section('Mulai dari sini', 'Semua materi'), card({ gap: 14 }, rows)),
    V({ w: 'fill', gap: 12 }, section('Coba latihan singkat'),
      card({ gap: 14 }, body('10 soal Pengetahuan Kuantitatif, sekitar 10 menit. Setiap jawaban langsung diperiksa.'), btn('Atur latihan', 'soft', { w: 'fill', icon: 'pen-line' }))));
}
function subtesCard(s, mode) {
  var kosong = mode === 'latihan' ? s.stok === 0 : false;
  var info = mode === 'latihan' ? (kosong ? 'Soal latihan segera hadir' : s.stok + ' soal latihan · ' + s.materi + ' materi') : s.selesai + ' dari ' + s.materi + ' materi selesai';
  return card({ gap: 12, fill: kosong ? C.bg : C.surface, name: 'Subtes/' + s.nama },
    H({ w: 'fill', gap: 12, ai: 'center' },
      V({ w: 'fill', gap: 2 }, heading(s.nama, kosong ? C.ink3 : C.ink), small(info, kosong ? C.ink3 : C.ink2)),
      kosong ? null : I('chevron-right', 20, C.ink3)),
    mode === 'materi' ? progress(CW - 32, s.selesai / s.materi * 100) : null);
}
function sMateriSubtes() {
  var tps = [], lit = [];
  for (var i = 0; i < SUBTES.length; i++) (SUBTES[i].kel === 'TPS' ? tps : lit).push(subtesCard(SUBTES[i], 'materi'));
  return screen('06 Materi - subtes', { nav: 'Materi' },
    V({ w: 'fill', gap: 4 }, title('Materi'), body('6 dari 29 materi selesai')),
    V({ name: 'Rekomendasi', w: 'fill', p: 16, gap: 12, r: 20, fill: C.primarySoft },
      heading('Disarankan untukmu'),
      H({ w: 'fill', gap: 12, ai: 'center' }, V({ w: 'fill', gap: 2 }, T('Geometri', { size: 15, weight: 600, color: C.ink, w: 'fill', lh: 20 }), small('Pengetahuan Kuantitatif · akurasi 42%', C.ink2)), btn('Pelajari', 'primary', { size: 'sm' }))),
    V({ w: 'fill', gap: 10 }, small('Tes Potensi Skolastik', C.ink2), tps),
    V({ w: 'fill', gap: 10 }, small('Tes Literasi', C.ink2), lit));
}
function sMateriDaftar() {
  var m = [['Bilangan', true, 14], ['Aljabar dan fungsi', false, 12], ['Geometri', false, 12], ['Statistika dan peluang', false, 10]];
  var rows = [];
  for (var i = 0; i < m.length; i++) {
    if (i) rows.push(rule());
    rows.push(H({ w: 'fill', gap: 12, ai: 'center', p: [4, 0, 4, 0] },
      H({ w: 28, h: 28, r: 999, fill: m[i][1] ? C.primary : C.surface, stroke: m[i][1] ? null : C.line, ai: 'center', jc: 'center' }, m[i][1] ? I('check', 16, C.white) : null),
      V({ w: 'fill', gap: 2 }, heading(m[i][0]), small(m[i][2] + ' soal latihan' + (i === 3 ? ' · video segera hadir' : ''), C.ink2)),
      I('chevron-right', 20, C.ink3)));
  }
  return screen('07 Materi - daftar materi', { nav: 'Materi', top: topbar('Materi'), p: [4, PAD, 24, PAD] },
    V({ w: 'fill', gap: 10 }, title('Pengetahuan Kuantitatif'), body('1 dari 4 materi selesai. Urutan dari dasar ke lanjut, tapi kamu bebas memilih.'), progress(CW, 25)),
    card({ gap: 12 }, rows),
    btn('Latihan subtes ini', 'soft', { w: 'fill', icon: 'pen-line' }));
}
function sMateriDetail() {
  return screen('08 Materi - detail', { nav: 'Materi', top: topbar('Pengetahuan Kuantitatif'), p: [4, PAD, 24, PAD] },
    V({ w: 'fill', gap: 6 }, title('Geometri'), small('Materi 3 dari 4', C.ink2)),
    ph('thumbnail video', 'Embed YouTube 16:9 (350 x 197). Pakai thumbnail video pembahasan materi ini. Jika video_url kosong, tampilkan teks "Video segera hadir".', 197, true),
    card({ gap: 0, p: 0 },
      H({ w: 'fill', p: 16, gap: 12, ai: 'center' }, iconTile('file-text'), V({ w: 'fill', gap: 2 }, heading('Catatan Geometri'), small('PDF · 6 halaman', C.ink2)), T('Buka', { size: 14, weight: 700, color: C.primary }))),
    card({ gap: 12 },
      H({ w: 'fill', gap: 12, ai: 'center' }, V({ w: 'fill', gap: 2 }, heading('Sudah paham materinya?'), small('Tandai agar progresmu tercatat.', C.ink2))),
      btn('Tandai selesai', 'secondary', { w: 'fill', icon: 'check' })),
    btn('Latihan 12 soal Geometri', 'primary', { w: 'fill', iconRight: 'arrow-right' }),
    H({ w: 'fill', jc: 'between', ai: 'center' },
      H({ gap: 4, ai: 'center' }, I('chevron-left', 16, C.ink2), T('Aljabar dan fungsi', { size: 13, weight: 600, color: C.ink2 })),
      H({ gap: 4, ai: 'center' }, T('Statistika dan peluang', { size: 13, weight: 600, color: C.ink2 }), I('chevron-right', 16, C.ink2))));
}
function sLatihanSubtes() {
  var list = [];
  var order = [3, 6, 0, 1, 2, 4, 5];
  for (var i = 0; i < order.length; i++) list.push(subtesCard(SUBTES[order[i]], 'latihan'));
  return screen('09 Latihan - subtes', { nav: 'Latihan' },
    V({ w: 'fill', gap: 4 }, title('Latihan Soal'), body('Pilih subtes, atur sendiri materi dan jumlah soalnya.')),
    V({ w: 'fill', gap: 10 }, list));
}
function checkRow(label, n, on) {
  return H({ w: 'fill', gap: 12, ai: 'center', p: [4, 0, 4, 0] },
    H({ w: 22, h: 22, r: 6, fill: on ? C.primary : C.surface, stroke: on ? null : C.line, sw: 1.5, ai: 'center', jc: 'center' }, on ? I('check', 14, C.white) : null),
    T(label, { size: 15, weight: on ? 600 : 400, color: C.ink, w: 'fill', lh: 20 }),
    small(n + ' soal', C.ink3, true));
}
function seg(label, state) {
  var on = state === 'on', off = state === 'off';
  return H({ w: 'fill', h: 44, r: 12, ai: 'center', jc: 'center', fill: on ? C.primary : (off ? C.sunken : C.surface), stroke: on || off ? null : C.line },
    T(label, { size: 15, weight: 600, color: on ? C.white : (off ? C.ink3 : C.ink) }));
}
function sPengaturan() {
  return screen('10 Latihan - pengaturan sesi', { h: 844, top: topbar('Latihan Soal'), p: [4, PAD, 16, PAD], gap: 16,
    bottom: V({ w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [12, PAD, 28, PAD], gap: 16, ai: 'center' },
      V({ w: 'fill', gap: 2 }, T('10 soal', { size: 16, weight: 700, color: C.ink }), small('sekitar 10 menit', C.ink2)),
      btn('Mulai latihan', 'primary', { iconRight: 'arrow-right' }))) },
    V({ w: 'fill', gap: 4 }, title('Pengetahuan Kuantitatif'), body('Atur sesi latihanmu.')),
    card({ gap: 8 },
      H({ w: 'fill', ai: 'center' }, heading('Materi'), T('Pilih semua', { size: 13, weight: 600, color: C.primary })),
      checkRow('Bilangan', 14, false), checkRow('Aljabar dan fungsi', 12, true), checkRow('Geometri', 12, true), checkRow('Statistika dan peluang', 10, false)),
    card({ gap: 10 },
      heading('Jumlah soal'),
      H({ w: 'fill', gap: 8 }, seg('5'), seg('10', 'on'), seg('20'), seg('30', 'off')),
      small('24 soal tersedia dari materi yang dipilih.', C.ink2)),
    card({ gap: 10 },
      heading('Pembahasan'),
      H({ w: 'fill', gap: 8 }, seg('Langsung', 'on'), seg('Di akhir'))));
}
function opsi(label, isi, state) {
  var fill = C.surface, stroke = C.line, sw = 1, bf = C.sunken, bc = C.ink2, ic = null;
  if (state === 'pilih') { fill = C.primarySoft; stroke = C.primary; sw = 2; bf = C.primary; bc = C.white; }
  if (state === 'benar') { fill = C.okSoft; stroke = C.ok; sw = 2; bf = C.ok; bc = C.white; ic = I('circle-check', 20, C.ok); }
  if (state === 'salah') { fill = C.badSoft; stroke = C.bad; sw = 2; bf = C.bad; bc = C.white; ic = I('circle-x', 20, C.bad); }
  return H({ name: 'Opsi/' + (state || 'biasa'), w: 'fill', p: [12, 14, 12, 12], gap: 12, r: 14, ai: 'center', fill: fill, stroke: stroke, sw: sw },
    H({ w: 28, h: 28, r: 999, fill: bf, ai: 'center', jc: 'center' }, T(label, { size: 13, weight: 700, color: bc })),
    T(isi, { size: 15, weight: state ? 600 : 400, color: C.ink, w: 'fill', lh: 21 }), ic);
}
var SOAL_PK = 'Sebuah persegi panjang memiliki keliling 36 cm. Jika panjangnya dua kali lebarnya, luas persegi panjang tersebut adalah ...';
function latihanTop(n) {
  return V({ w: 'fill' }, H({ w: 'fill', h: 56, p: [0, 12, 0, 12], gap: 4, ai: 'center' },
    H({ w: 40, h: 40, r: 999, ai: 'center', jc: 'center' }, I('x', 22, C.ink)),
    V({ w: 'fill', gap: 6 }, small('Soal ' + n + ' dari 10 · Geometri', C.ink2), progress(250, n * 10)),
    H({ w: 40, h: 40 })));
}
function sKerja() {
  return screen('11 Latihan - mengerjakan', { h: 844, top: latihanTop(4), p: [12, PAD, 16, PAD], gap: 16,
    bottom: V({ w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [12, PAD, 28, PAD] }, btn('Periksa', 'primary', { w: 'fill' }))) },
    T(SOAL_PK, { size: 17, weight: 500, color: C.ink, lh: 26, w: 'fill' }),
    V({ w: 'fill', gap: 10 }, opsi('A', '54 cm²'), opsi('B', '64 cm²', 'pilih'), opsi('C', '72 cm²'), opsi('D', '81 cm²'), opsi('E', '96 cm²')));
}
function sKerjaPeriksa() {
  return screen('12 Latihan - setelah periksa', { top: latihanTop(4), p: [12, PAD, 16, PAD], gap: 16,
    bottom: V({ w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [12, PAD, 28, PAD] }, btn('Lanjut', 'primary', { w: 'fill', iconRight: 'arrow-right' }))) },
    T(SOAL_PK, { size: 17, weight: 500, color: C.ink, lh: 26, w: 'fill' }),
    V({ w: 'fill', gap: 10 }, opsi('A', '54 cm²'), opsi('B', '64 cm²', 'salah'), opsi('C', '72 cm²', 'benar'), opsi('D', '81 cm²'), opsi('E', '96 cm²')),
    V({ name: 'Umpan balik', w: 'fill', p: 16, gap: 10, r: 16, fill: C.badSoft },
      heading('Belum tepat. Jawaban benar: C', C.bad),
      rule('#F1CFCA'),
      H({ w: 'fill', gap: 8, ai: 'center' }, I('lightbulb', 18, C.ink), heading('Pembahasan')),
      body('Keliling = 2(p + l) = 36 dan p = 2l, jadi 2(3l) = 36 sehingga l = 6 cm dan p = 12 cm. Luas = 12 × 6 = 72 cm².', C.ink)));
}
function stat(v, label, color) {
  return V({ w: 'fill', gap: 2, p: 14, r: 16, fill: C.surface, stroke: C.line }, T(v, { size: 22, weight: 700, color: color || C.ink, lh: 28, ls: -1 }), small(label, C.ink2));
}
function soalRow(n, teks, benar, ragu) {
  return H({ w: 'fill', gap: 12, ai: 'center', p: [2, 0, 2, 0] },
    H({ w: 32, h: 32, r: 10, fill: benar ? C.okSoft : C.badSoft, ai: 'center', jc: 'center' }, T(n, { size: 13, weight: 700, color: benar ? C.ok : C.bad })),
    V({ w: 'fill', gap: 2 }, T(teks, { size: 14, weight: 500, color: C.ink, w: 'fill', lh: 20 }), small(benar ? 'Benar' : 'Salah · jawabanmu B, kunci C', benar ? C.ok : C.bad)),
    ragu ? chip('Ragu', 'warn') : null,
    I('chevron-right', 18, C.ink3));
}
function sHasilLatihan() {
  return screen('13 Latihan - hasil sesi', { top: topbar('Hasil latihan', { close: true }), p: [4, PAD, 24, PAD] },
    V({ name: 'Ringkasan', w: 'fill', p: 20, gap: 6, r: 24, fill: C.panel },
      T('7 dari 10 benar', { size: 30, weight: 700, color: C.white, lh: 36, ls: -2, w: 'fill' }),
      T('Akurasi 70% · Pengetahuan Kuantitatif', { size: 14, color: C.panelText, lh: 21, w: 'fill' })),
    H({ w: 'fill', gap: 10 }, stat('7', 'Benar', C.ok), stat('3', 'Salah', C.bad), stat('9.40', 'Menit')),
    V({ w: 'fill', gap: 12 }, section('Paling banyak salah'),
      card({ gap: 12 }, H({ w: 'fill', gap: 12, ai: 'center' }, V({ w: 'fill', gap: 2 }, heading('Geometri'), small('2 dari 5 benar di sesi ini', C.ink2)), btn('Pelajari', 'soft', { size: 'sm', icon: 'book-open' })))),
    V({ w: 'fill', gap: 12 }, section('Pembahasan soal', 'Hanya yang salah'),
      card({ gap: 12 }, soalRow('1', 'Nilai x yang memenuhi 3x − 7 = 11', true), rule(), soalRow('2', 'Luas segitiga siku-siku dengan sisi 6 dan 8', true), rule(), soalRow('3', 'Jumlah sudut dalam segi enam', false), rule(), soalRow('4', 'Luas persegi panjang berkeliling 36 cm', false))),
    V({ w: 'fill', gap: 10 }, btn('Latihan lagi', 'primary', { w: 'fill', icon: 'rotate-ccw' }), btn('Selesai', 'secondary', { w: 'fill' })));
}
function sTryoutDaftar() {
  function to(judul, status, tone, extra, cta, kind) {
    return card({ gap: 14 },
      H({ w: 'fill', gap: 12, ai: 'center' }, V({ w: 'fill', gap: 2 }, T(judul, { size: 18, weight: 700, color: C.ink, lh: 24, ls: -1, w: 'fill' }), small('7 subtes · 160 soal · 3 jam 15 menit', C.ink2)), chip(status, tone)),
      extra, btn(cta, kind, { w: 'fill' }));
  }
  return screen('14 Try Out - daftar', { nav: 'Try Out' },
    V({ w: 'fill', gap: 4 }, title('Try Out'), body('Simulasi penuh mengikuti susunan UTBK-SNBT. Setiap try out hanya bisa dikerjakan sekali.')),
    to('Try Out 1', 'Selesai', 'ok', H({ w: 'fill', gap: 8, ai: 'end' }, T('612', { size: 32, weight: 700, color: C.ink, lh: 36, ls: -2 }), V({ p: [0, 0, 5, 0] }, small('skor estimasi', C.ink2, true))), 'Lihat hasil', 'secondary'),
    to('Try Out 2', 'Sedang berjalan', 'warn', V({ w: 'fill', gap: 8 }, progress(CW - 32, 3 / 7 * 100), small('3 dari 7 subtes selesai · berikutnya Pengetahuan Kuantitatif', C.ink2)), 'Lanjutkan', 'primary'),
    to('Try Out 3', 'Belum dikerjakan', null, null, 'Lihat detail', 'secondary'));
}
function sTryoutDetail() {
  function row(s, st) {
    var ic, right;
    if (st === 'selesai') { ic = H({ w: 28, h: 28, r: 999, fill: C.primary, ai: 'center', jc: 'center' }, I('check', 16, C.white)); right = small('Selesai', C.ok, true); }
    else if (st === 'aktif') { ic = H({ w: 28, h: 28, r: 999, fill: C.lime, ai: 'center', jc: 'center' }, I('play', 13, C.limeInk)); right = chip('Berikutnya', 'lime'); }
    else { ic = H({ w: 28, h: 28, r: 999, fill: C.sunken, ai: 'center', jc: 'center' }, I('lock', 14, C.ink3)); right = null; }
    return H({ w: 'fill', gap: 12, ai: 'center', p: [4, 0, 4, 0] }, ic,
      V({ w: 'fill', gap: 2 }, T(s.nama, { size: 15, weight: 600, color: st === 'kunci' ? C.ink3 : C.ink, w: 'fill', lh: 20 }), small(s.soal + ' soal · ' + s.menit + ' menit', st === 'kunci' ? C.ink3 : C.ink2)), right);
  }
  var st = ['selesai', 'selesai', 'selesai', 'aktif', 'kunci', 'kunci', 'kunci'], tps = [], lit = [];
  for (var i = 0; i < 7; i++) { var g = SUBTES[i].kel === 'TPS' ? tps : lit; if (g.length) g.push(rule()); g.push(row(SUBTES[i], st[i])); }
  return screen('15 Try Out - detail', { top: topbar('Try Out'), p: [4, PAD, 16, PAD],
    bottom: V({ w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [12, PAD, 28, PAD] }, btn('Lanjutkan: Pengetahuan Kuantitatif', 'primary', { w: 'fill' }))) },
    V({ w: 'fill', gap: 8 }, H({ w: 'fill' }, chip('Sedang berjalan', 'warn')), display('Try Out 2'), body('Simulasi penuh UTBK-SNBT. Subtes dikerjakan berurutan dan waktunya tidak bisa dijeda.')),
    H({ w: 'fill', gap: 10 }, stat('7', 'Subtes'), stat('160', 'Soal'), stat('3 j 15 m', 'Durasi')),
    V({ w: 'fill', gap: 10 }, small('Tes Potensi Skolastik', C.ink2), card({ gap: 10 }, tps)),
    V({ w: 'fill', gap: 10 }, small('Tes Literasi', C.ink2), card({ gap: 10 }, lit)));
}
function timerPill(t, warn) {
  return H({ p: [6, 12, 6, 10], gap: 6, r: 999, fill: warn ? C.badSoft : C.lime, ai: 'center' }, I('clock', 16, warn ? C.bad : C.limeInk), T(t, { size: 15, weight: 700, color: warn ? C.bad : C.limeInk, lh: 20 }));
}
function tryoutTop() {
  return V({ w: 'fill', fill: C.panel }, statusBar(true), H({ w: 'fill', p: [8, PAD, 14, PAD], gap: 12, ai: 'center' },
    V({ w: 'fill', gap: 2 }, T('Pengetahuan Kuantitatif', { size: 15, weight: 600, color: C.white, w: 'fill', lh: 20 }), T('Soal 7 dari 20', { size: 12, weight: 500, color: C.panelText, lh: 16 })),
    timerPill('12.47')));
}
function toScreen(name, o) {
  var content = kids(arguments, 2);
  return V({ name: name, w: W, h: 844, fill: C.bg, clip: true, screen: true }, tryoutTop(),
    V({ name: 'Isi', w: 'fill', h: 'fill', p: [20, PAD, 16, PAD], gap: 16 }, content), o.bottom);
}
function sTryoutKerja() {
  return toScreen('16 Try Out - mengerjakan', { bottom: V({ w: 'fill', fill: C.surface }, rule(), H({ w: 'fill', p: [12, PAD, 28, PAD], gap: 10, ai: 'center' },
    H({ w: 52, h: 52, r: 999, fill: C.surface, stroke: C.line, ai: 'center', jc: 'center' }, I('chevron-left', 22, C.ink)),
    btn('20 soal', 'secondary', { w: 'fill', icon: 'layout-grid' }),
    H({ w: 52, h: 52, r: 999, fill: C.primary, ai: 'center', jc: 'center' }, I('chevron-right', 22, C.white)))) },
    T('Rata-rata lima bilangan adalah 14. Jika satu bilangan dikeluarkan, rata-rata empat bilangan sisanya menjadi 12. Bilangan yang dikeluarkan adalah ...', { size: 17, weight: 500, color: C.ink, lh: 26, w: 'fill' }),
    V({ w: 'fill', gap: 10 }, opsi('A', '18'), opsi('B', '20'), opsi('C', '22', 'pilih'), opsi('D', '24'), opsi('E', '26')),
    H({ w: 'fill', gap: 10, ai: 'center', p: [4, 0, 0, 0] },
      H({ w: 22, h: 22, r: 6, fill: C.warnFill, ai: 'center', jc: 'center' }, I('check', 14, C.ink)),
      T('Tandai ragu-ragu', { size: 14, weight: 600, color: C.ink, w: 'fill' }),
      small('Tersimpan otomatis', C.ink3, true)));
}
function sTryoutNomor() {
  var st = ['j', 'j', 'r', 'j', 'j', 'j', 'a', 'j', 'b', 'b', 'r', 'j', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'];
  var rows = [];
  for (var r = 0; r < 4; r++) {
    var cells = [];
    for (var c = 0; c < 5; c++) {
      var i = r * 5 + c, s = st[i], fill = C.surface, stroke = C.line, col = C.ink2, sw = 1;
      if (s === 'j') { fill = C.primary; stroke = null; col = C.white; }
      if (s === 'r') { fill = C.warnFill; stroke = null; col = C.ink; }
      if (s === 'a') { fill = C.primarySoft; stroke = C.primary; col = C.primary; sw = 2; }
      cells.push(H({ w: 'fill', h: 52, r: 14, fill: fill, stroke: stroke, sw: sw, ai: 'center', jc: 'center' }, T(String(i + 1), { size: 16, weight: 700, color: col })));
    }
    rows.push(H({ w: 'fill', gap: 10 }, cells));
  }
  function leg(fill, stroke, label) { return H({ gap: 6, ai: 'center' }, H({ w: 14, h: 14, r: 4, fill: fill, stroke: stroke }), small(label, C.ink2, true)); }
  return toScreen('17 Try Out - nomor soal', { bottom: V({ w: 'fill', fill: C.surface }, rule(), V({ w: 'fill', p: [12, PAD, 28, PAD], gap: 8 },
    small('9 soal belum dijawab. Subtes yang selesai tidak bisa dibuka lagi.', C.ink2), btn('Selesai subtes', 'primary', { w: 'fill' }))) },
    H({ w: 'fill', ai: 'center' }, title('Nomor soal'), H({ w: 40, h: 40, r: 999, ai: 'center', jc: 'center' }, I('x', 22, C.ink))),
    H({ w: 'fill', gap: 16 }, leg(C.primary, null, 'Dijawab 9'), leg(C.warnFill, null, 'Ragu 2'), leg(C.surface, C.line, 'Kosong 9')),
    V({ w: 'fill', gap: 10 }, rows));
}
function sTryoutHasil() {
  var rows = [];
  for (var i = 0; i < 7; i++) {
    var s = SUBTES[i];
    if (i) rows.push(rule());
    rows.push(V({ w: 'fill', gap: 8 },
      H({ w: 'fill', gap: 12, ai: 'center' }, V({ w: 'fill', gap: 2 }, T(s.nama, { size: 14, weight: 600, color: C.ink, w: 'fill', lh: 20 }), small(s.benar + ' dari ' + s.soal + ' benar · ' + s.pakai, C.ink2)), T(String(s.skor), { size: 18, weight: 700, color: C.ink, lh: 24 })),
      progress(CW - 32, (s.skor - 200) / 6, s.skor < 600 ? C.warnFill : C.primary)));
  }
  return screen('18 Try Out - hasil', { top: topbar('Hasil Try Out 1', { close: true }), p: [4, PAD, 24, PAD] },
    V({ name: 'Banner capaian', w: 'fill', p: 20, gap: 16, r: 24, fill: C.panel },
      V({ w: 'fill', gap: 2 },
        H({ w: 'fill', gap: 10, ai: 'end' }, T('612', { size: 48, weight: 700, color: C.white, lh: 52, ls: -3 }), V({ p: [0, 0, 9, 0] }, T('skor estimasi', { size: 13, weight: 500, color: C.panelText }))),
        T('83 poin lagi menuju target STEI-K ITB.', { size: 14, color: C.panelText, lh: 21, w: 'fill' })),
      scoreTrack(CW - 40, SKOR, TARGET, true)),
    V({ w: 'fill', gap: 12 }, section('Skor per subtes'), card({ gap: 12 }, rows)),
    V({ w: 'fill', gap: 12 }, section('Materi terlemah'),
      card({ gap: 16 }, lemahRow('Geometri', 'Pengetahuan Kuantitatif', 40, 5), rule(), lemahRow('Teori peluang', 'Penalaran Matematika', 50, 4))),
    V({ w: 'fill', gap: 12 }, section('Pembahasan'),
      H({ w: 'fill', gap: 8 }, chip('Semua 160'), chip('Salah 51', 'bad'), chip('Ragu 12', 'warn')),
      card({ gap: 12 }, soalRow('3', 'Simpulan yang pasti benar dari dua pernyataan', false, true), rule(), soalRow('7', 'Bilangan yang dikeluarkan dari rata-rata', true), rule(), soalRow('9', 'Peluang terambil dua bola merah', false))));
}
function sProfil() {
  return screen('19 Profil', { nav: 'Profil' },
    title('Profil'),
    card({ gap: 14 },
      H({ w: 'fill', gap: 12, ai: 'center' }, A({ name: 'GAMBAR: foto profil (opsional, 52 x 52, lingkaran; tanpa foto pakai inisial)', w: 52, h: 52 }, H({ x: 0, y: 0 }, avatar('F', 52))), V({ w: 'fill', gap: 2 }, T('Farhan Aira', { size: 18, weight: 700, color: C.ink, w: 'fill', lh: 24 }), small('farhan@contoh.id', C.ink2)), T('Ubah', { size: 14, weight: 700, color: C.primary }))),
    card({ gap: 12 },
      H({ w: 'fill', gap: 12, ai: 'center' }, iconTile('target', C.lime, C.limeInk), V({ w: 'fill', gap: 2 }, small('Target', C.ink2), heading('STEI-K · ITB')), T('Ganti', { size: 14, weight: 700, color: C.primary })),
      small('Skor target 695, estimasi dari data komunitas tahun lalu.')),
    H({ w: 'fill', gap: 10 }, stat('1', 'Try out selesai'), stat('612', 'Skor tertinggi'), stat('6', 'Materi selesai')),
    card({ gap: 0, p: [4, 16, 4, 16] },
      H({ w: 'fill', gap: 12, ai: 'center', p: [12, 0, 12, 0] }, I('history', 20, C.ink), T('Riwayat', { size: 15, weight: 600, color: C.ink, w: 'fill' }), I('chevron-right', 20, C.ink3)),
      rule(),
      H({ w: 'fill', gap: 12, ai: 'center', p: [12, 0, 12, 0] }, I('log-out', 20, C.bad), T('Keluar', { size: 15, weight: 600, color: C.bad, w: 'fill' }))));
}
function sRiwayat() {
  function r(jenis, judul, sub, nilai, label) {
    return H({ w: 'fill', gap: 12, ai: 'center', p: [2, 0, 2, 0] },
      iconTile(jenis === 'to' ? 'timer' : 'pen-line', jenis === 'to' ? C.lime : C.primarySoft, jenis === 'to' ? C.limeInk : C.primary),
      V({ w: 'fill', gap: 2 }, T(judul, { size: 15, weight: 600, color: C.ink, w: 'fill', lh: 20 }), small(sub, C.ink2)),
      V({ ai: 'end', gap: 2 }, T(nilai, { size: 16, weight: 700, color: C.ink, lh: 22 }), small(label, C.ink3, true)));
  }
  return screen('20 Riwayat', { nav: 'Profil', top: topbar('Profil'), p: [4, PAD, 24, PAD] },
    title('Riwayat'),
    H({ w: 'fill', gap: 8 }, chip('Semua', 'primary'), chip('Try out'), chip('Latihan')),
    card({ gap: 12 },
      r('lat', 'Geometri, Aljabar dan fungsi', '14 Nov · 10 soal', '70%', 'akurasi'), rule(),
      r('to', 'Try Out 1', '13 Nov · 160 soal', '612', 'skor'), rule(),
      r('lat', 'Bilangan', '12 Nov · 20 soal', '85%', 'akurasi'), rule(),
      r('lat', 'Fungsi', '11 Nov · 10 soal', '60%', 'akurasi')),
    small('Hanya sesi yang selesai yang tampil di sini.'));
}
function sSistem() {
  function sw(hex, nama) { return V({ gap: 6, w: 96 }, H({ w: 96, h: 56, r: 12, fill: hex, stroke: C.line }), T(nama, { size: 12, weight: 600, color: C.ink }), T(hex, { size: 12, color: C.ink3 })); }
  return V({ name: '00 Sistem desain', w: 820, p: 40, gap: 32, fill: C.surface, screen: true },
    V({ w: 'fill', gap: 6 }, brand(), body('Satu keluarga huruf (Plus Jakarta Sans), satu aksen hijau, lime hanya untuk data dan aksi utama di panel gelap.')),
    V({ w: 'fill', gap: 12 }, heading('Warna'),
      H({ gap: 12 }, sw(C.primary, 'primary'), sw(C.primarySoft, 'primarySoft'), sw(C.lime, 'lime'), sw(C.panel, 'panel'), sw(C.ink, 'ink'), sw(C.ink2, 'ink2'), sw(C.ink3, 'ink3')),
      H({ gap: 12 }, sw(C.bg, 'bg'), sw(C.surface, 'surface'), sw(C.sunken, 'sunken'), sw(C.line, 'line'), sw(C.ok, 'benar'), sw(C.bad, 'salah'), sw(C.warnFill, 'ragu'))),
    V({ w: 'fill', gap: 10 }, heading('Tipografi'),
      T('Display 28 / 34 Bold', { size: 28, weight: 700, color: C.ink, lh: 34, ls: -2 }),
      T('Judul 20 / 26 Bold', { size: 20, weight: 700, color: C.ink, lh: 26, ls: -1 }),
      T('Subjudul 16 / 22 SemiBold', { size: 16, weight: 600, color: C.ink, lh: 22 }),
      T('Isi 14 / 21 Regular. Teks soal memakai 17 / 26 Medium.', { size: 14, color: C.ink2, lh: 21 }),
      T('Keterangan 12 / 16 Medium', { size: 12, weight: 500, color: C.ink3, lh: 16 })),
    V({ w: 'fill', gap: 12 }, heading('Tombol'),
      H({ gap: 12, ai: 'center' }, btn('Utama', 'primary'), btn('Sekunder', 'secondary'), btn('Lembut', 'soft'), btn('Lime', 'lime'), btn('Nonaktif', 'disabled')),
      H({ gap: 12, ai: 'center' }, btn('Kecil', 'primary', { size: 'sm' }), btn('Kecil', 'secondary', { size: 'sm' }), chip('Selesai', 'ok'), chip('Sedang berjalan', 'warn'), chip('Salah', 'bad'), chip('Netral'))),
    V({ w: 'fill', gap: 12 }, heading('Opsi jawaban'),
      H({ gap: 12, w: 'fill' }, opsi('A', 'Biasa'), opsi('B', 'Dipilih', 'pilih'), opsi('C', 'Benar', 'benar'), opsi('D', 'Salah', 'salah'))),
    V({ w: 740, gap: 12 }, heading('Jarak ke target'), V({ p: 20, r: 24, fill: C.panel }, scoreTrack(310, SKOR, TARGET, true))));
}

function buildScreens() {
  return [sSistem(), sMasuk(false), sMasuk(true), sTarget(), sDashboard(), sDashboardBaru(), sMateriSubtes(), sMateriDaftar(), sMateriDetail(),
    sLatihanSubtes(), sPengaturan(), sKerja(), sKerjaPeriksa(), sHasilLatihan(), sTryoutDaftar(), sTryoutDetail(), sTryoutKerja(), sTryoutNomor(), sTryoutHasil(), sProfil(), sRiwayat()];
}
if (typeof module !== 'undefined') module.exports = { buildScreens: buildScreens, C: C };

// Renderer Figma: mengubah pohon layar menjadi node Figma.
var FONT = { family: 'Inter', styles: { 400: 'Regular', 500: 'Medium', 600: 'Semi Bold', 700: 'Bold' } };
function rgb(hex) { var n = parseInt(hex.slice(1), 16); return { r: ((n >> 16) & 255) / 255, g: ((n >> 8) & 255) / 255, b: (n & 255) / 255 }; }
function solid(hex) { return [{ type: 'SOLID', color: rgb(hex) }]; }
async function pickFont() {
  var all = await figma.listAvailableFontsAsync();
  var want = { 400: 'regular', 500: 'medium', 600: 'semibold', 700: 'bold' };
  var fams = ['Plus Jakarta Sans', 'Inter'];
  for (var f = 0; f < fams.length; f++) {
    var found = {}, ok = true;
    for (var w in want) {
      var hit = null;
      for (var i = 0; i < all.length; i++) {
        var fn = all[i].fontName;
        if (fn.family === fams[f] && fn.style.replace(/\s+/g, '').toLowerCase() === want[w]) { hit = fn.style; break; }
      }
      if (!hit) { ok = false; break; }
      found[w] = hit;
    }
    if (ok) { FONT = { family: fams[f], styles: found }; break; }
  }
  for (var k in FONT.styles) await figma.loadFontAsync({ family: FONT.family, style: FONT.styles[k] });
}
function isAuto(node) { return node && node.type === 'FRAME' && node.layoutMode && node.layoutMode !== 'NONE'; }
function place(node, p, parent) {
  parent.appendChild(node);
  if (!isAuto(parent) && (p.x !== undefined || p.y !== undefined)) { node.x = p.x || 0; node.y = p.y || 0; }
}
function sizeChild(node, p, parent, canHug) {
  var auto = isAuto(parent);
  if (p.w === 'fill' && auto) node.layoutSizingHorizontal = 'FILL';
  else if (typeof p.w === 'number') node.layoutSizingHorizontal = 'FIXED';
  else if (canHug) node.layoutSizingHorizontal = 'HUG';
  if (p.h === 'fill' && auto) node.layoutSizingVertical = 'FILL';
  else if (typeof p.h === 'number') node.layoutSizingVertical = 'FIXED';
  else if (canHug) node.layoutSizingVertical = 'HUG';
}
var ALIGN = { start: 'MIN', center: 'CENTER', end: 'MAX', between: 'SPACE_BETWEEN' };
function render(n, parent) {
  var p = n.p || {};
  if (n.t === 'i') {
    var svg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="' + n.color + '" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">' + ICONS[n.n] + '</svg>';
    var ic = figma.createNodeFromSvg(svg);
    ic.name = 'ikon/' + n.n;
    ic.resize(n.size, n.size);
    parent.appendChild(ic);
    return ic;
  }
  if (n.t === 't') {
    var t = figma.createText();
    t.fontName = { family: FONT.family, style: FONT.styles[p.weight || 400] };
    t.fontSize = p.size || 14;
    t.lineHeight = { unit: 'PIXELS', value: p.lh || Math.round((p.size || 14) * 1.4) };
    if (p.ls) t.letterSpacing = { unit: 'PERCENT', value: p.ls };
    t.fills = solid(p.color || C.ink);
    t.characters = n.s;
    if (p.align) t.textAlignHorizontal = p.align.toUpperCase();
    place(t, p, parent);
    if (p.w === 'fill' && isAuto(parent)) { t.textAutoResize = 'HEIGHT'; t.layoutSizingHorizontal = 'FILL'; }
    else if (typeof p.w === 'number') { t.textAutoResize = 'HEIGHT'; t.resize(p.w, t.height); }
    return t;
  }
  var f = figma.createFrame();
  f.name = p.name || (p.layout === 'none' ? 'Grup' : (p.dir === 'h' ? 'Baris' : 'Kolom'));
  f.fills = p.fill ? solid(p.fill) : [];
  f.clipsContent = !!p.clip;
  if (p.stroke) { f.strokes = solid(p.stroke); f.strokeWeight = p.sw || 1; f.strokeAlign = 'INSIDE'; if (p.dash) f.dashPattern = [6, 5]; }
  if (p.r) f.cornerRadius = Math.min(p.r, 500);
  var auto = p.layout !== 'none';
  if (auto) {
    f.layoutMode = p.dir === 'h' ? 'HORIZONTAL' : 'VERTICAL';
    f.itemSpacing = p.gap || 0;
    var pd = p.p === undefined ? [0, 0, 0, 0] : (typeof p.p === 'number' ? [p.p, p.p, p.p, p.p] : p.p);
    f.paddingTop = pd[0]; f.paddingRight = pd[1]; f.paddingBottom = pd[2]; f.paddingLeft = pd[3];
    f.primaryAxisAlignItems = ALIGN[p.jc || 'start'];
    f.counterAxisAlignItems = ALIGN[p.ai || 'start'] === 'SPACE_BETWEEN' ? 'MIN' : ALIGN[p.ai || 'start'];
  }
  f.resize(typeof p.w === 'number' ? p.w : 100, typeof p.h === 'number' ? p.h : 100);
  place(f, p, parent);
  sizeChild(f, p, parent, auto);
  if (p.minH && auto) f.minHeight = p.minH;
  for (var i = 0; i < n.k.length; i++) render(n.k[i], f);
  return f;
}
async function main() {
  await pickFont();
  var page = figma.createPage();
  page.name = 'TembusPTN - Mobile';
  await figma.setCurrentPageAsync(page);
  var screens = buildScreens();
  var x = 0, y = 0, rowH = 0, made = [];
  for (var i = 0; i < screens.length; i++) {
    var node = render(screens[i], page);
    if (i === 1 || (i > 1 && (i - 1) % 7 === 0)) { x = 0; y += rowH + 160; rowH = 0; }
    node.x = x; node.y = y;
    var label = figma.createText();
    label.fontName = { family: FONT.family, style: FONT.styles[600] };
    label.fontSize = 18; label.characters = screens[i].p.name; label.fills = solid('#44544B');
    page.appendChild(label); label.x = x; label.y = y - 36;
    x += node.width + 80; rowH = Math.max(rowH, node.height);
    made.push(node);
  }
  figma.viewport.scrollAndZoomIntoView(made);
  figma.closePlugin('TembusPTN: ' + made.length + ' frame dibuat dengan huruf ' + FONT.family + '.');
}
main().catch(function (e) { figma.closePlugin('Gagal: ' + (e && e.message ? e.message : e)); });
