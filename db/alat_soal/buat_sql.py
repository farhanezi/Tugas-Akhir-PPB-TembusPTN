#!/usr/bin/env python3
"""Baca file soal teks -> verifikasi -> tulis SQL (format seed_soal_dummy.sql).
Pakai: python3 -I buat_sql.py masukan.txt keluaran.sql
Sintaks masukan:
  # SUBTES: nama subtes
  @W kunci / isi wacana (banyak baris) / @END
  ## KODE | Materi | kesulitan [| W=kunci]
  Q: ... A:..E: K: V: VP: VQ: T: F: P:
"""
import re, sys, math, collections
from fractions import Fraction

TAG = re.compile(r'^(Q|A|B|C|D|E|K|V|VP|VQ|T|F|P):\s?(.*)$')
MATERI = {
 'Penalaran Umum': ['Penalaran Induktif','Penalaran Deduktif','Penalaran Kuantitatif'],
 'Pengetahuan dan Pemahaman Umum': ['Sinonim dan Makna Kata','Bentuk Kata','Ide Pokok dan Hubungan Antarparagraf','Kesesuaian Wacana'],
 'Pemahaman Bacaan dan Menulis': ['Simpulan dan Ide Pokok','Kalimat Efektif','Ejaan dan Konjungsi','Kepaduan Wacana'],
 'Pengetahuan Kuantitatif': ['Bilangan','Geometri','Aljabar dan Fungsi','Statistika dan Peluang'],
 'Literasi dalam Bahasa Indonesia': ['Makna Kontekstual Kata','Inti dan Simpulan Bacaan','Teks Sastra','Teks Eksplanatif dan Ulasan','Teks Argumentatif'],
 'Literasi dalam Bahasa Inggris': ['Contextual Meaning','Main Idea and Conclusion','Explanatory and Review Text','Argumentative Text'],
 'Penalaran Matematika': ['Bilangan dan Aritmetika Sosial','Pola Bilangan dan Himpunan','Aljabar, Fungsi, dan Persamaan','Geometri dan Pengukuran','Statistika dan Peluang'],
}
PERNY = {'A':('(1), (2), dan (3) SAJA',{1,2,3}),'B':('(1) dan (3) SAJA',{1,3}),
         'C':('(2) dan (4) SAJA',{2,4}),'D':('(4) SAJA',{4}),'E':('SEMUA PILIHAN',{1,2,3,4})}
PQ = {'A':'Kuantitas P lebih dari Q.','B':'Kuantitas P kurang dari Q.','C':'Kuantitas P sama dengan Q.',
      'D':'Tidak dapat ditentukan hubungan antara kuantitas P dan Q.'}
CUKUP = {'A':'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (2) SAJA tidak cukup.',
 'B':'Pernyataan (2) SAJA cukup untuk menjawab pertanyaan, tetapi pernyataan (1) SAJA tidak cukup.',
 'C':'DUA pernyataan BERSAMA-SAMA cukup untuk menjawab pertanyaan, tetapi SATU pernyataan SAJA tidak cukup.',
 'D':'Pernyataan (1) SAJA cukup untuk menjawab pertanyaan dan pernyataan (2) SAJA cukup.',
 'E':'Pernyataan (1) dan pernyataan (2) tidak cukup untuk menjawab pertanyaan.'}

def angka(t):
    s = t.strip().replace('−','-').replace('–','-')
    s = re.sub(r'^Rp\s?', '', s)
    if re.match(r'^-?\d{1,3}(\.\d{3})+(,\d+)?(\s|$)', s):
        s = s.replace('.', '')
    s = s.replace(',', '.')
    m = re.match(r'^(-?\d*)√(\d+)', s)
    if m:
        k = m.group(1)
        k = 1 if k in ('', None) else (-1 if k == '-' else int(k))
        return k*math.sqrt(int(m.group(2)))
    m = re.match(r'^-?\d+(\.\d+)?/\d+', s)
    if m:
        return float(Fraction(m.group(0)))
    m = re.match(r'^-?\d+(\.\d+)?', s)
    if m: return float(m.group(0))
    return None

def baca(path):
    subtes, waca, soal = None, {}, []
    cur = None; w = None; tag = None
    for raw in open(path, encoding='utf-8'):
        line = raw.rstrip('\n')
        if w is not None:
            if line.strip() == '@END':
                waca[w[0]] = '\n'.join(w[1]).strip('\n'); w = None
            else: w[1].append(line)
            continue
        if line.startswith('# SUBTES:'):
            subtes = line.split(':',1)[1].strip(); continue
        if line.startswith('@W '):
            w = (line[3:].strip(), []); continue
        if line.startswith('## '):
            parts = [p.strip() for p in line[3:].split('|')]
            cur = dict(kode=parts[0], materi=parts[1], kes=parts[2], w=None, t={}, line=line)
            for extra in parts[3:]:
                if extra.startswith('W='): cur['w'] = extra[2:]
            soal.append(cur); tag = None; continue
        if cur is None or (not line.strip() and tag is None): continue
        m = TAG.match(line)
        if m:
            tag = m.group(1); cur['t'][tag] = m.group(2)
        elif tag is not None:
            if line.strip() == '' : cur['t'][tag] += '\n'
            else: cur['t'][tag] += '\n' + line
    return subtes, waca, soal

def bangun(s, galat):
    t = s['t']; k = s['kode']; f = t.get('F','').strip()
    opsi = {}
    if f == 'pernyataan':
        opsi = {l:v[0] for l,v in PERNY.items()}
        try:
            benar = {i+1 for i,e in enumerate(t['T'].split(';')) if eval(e, {'math':math,'F':Fraction,'Fraction':Fraction})}
        except Exception as e:
            galat.append(f'{k}: T gagal: {e}'); return None
        hit = [l for l,v in PERNY.items() if v[1]==benar]
        if not hit: galat.append(f'{k}: himpunan pernyataan benar {sorted(benar)} tidak ada di opsi baku'); return None
        key = hit[0]
        if 'K' in t and t['K'].strip()!=key: galat.append(f'{k}: K={t["K"].strip()} tapi hitungan {key}')
    elif f == 'pq':
        opsi = dict(PQ)
        if 'VP' in t:
            p = eval(t['VP'], {'math':math,'F':Fraction,'Fraction':Fraction}); q = eval(t['VQ'], {'math':math,'F':Fraction,'Fraction':Fraction})
            key = 'A' if p>q+1e-9 else ('B' if p<q-1e-9 else 'C')
            if 'K' in t and t['K'].strip()!=key: galat.append(f'{k}: K={t["K"].strip()} tapi hitungan {key}')
        else: key = t['K'].strip()
    elif f == 'cukup':
        opsi = dict(CUKUP); key = t['K'].strip()
    else:
        for l in 'ABCDE':
            if l in t: opsi[l] = t[l].strip()
        key = t.get('K','').strip()
        if 'V' in t:
            try: v = eval(t['V'], {'math':math,'F':Fraction,'Fraction':Fraction})
            except Exception as e: galat.append(f'{k}: V gagal: {e}'); v=None
            if v is not None:
                if key not in opsi: galat.append(f'{k}: K tidak ada'); return None
                cocok = [l for l,x in opsi.items() if angka(x) is not None and abs(angka(x)-float(v))<1e-6*max(1,abs(float(v)))]
                if cocok != [key]: galat.append(f'{k}: V={float(v):.6g} cocok dengan {cocok}, K={key}')
    if key not in opsi: galat.append(f'{k}: K "{key}" tidak ada di opsi'); return None
    if len(opsi) < 4: galat.append(f'{k}: opsi kurang dari 4')
    if len(set(x.strip() for x in opsi.values())) != len(opsi): galat.append(f'{k}: ada opsi kembar')
    if s['kes'] not in ('mudah','sedang','sulit'): galat.append(f'{k}: kesulitan salah')
    if 'Q' not in t or not t['Q'].strip(): galat.append(f'{k}: Q kosong')
    if 'P' not in t or len(t['P'].strip())<15: galat.append(f'{k}: pembahasan kosong/terlalu pendek')
    for fld in (t.get('Q',''), t.get('P',''), *opsi.values()):
        if '$' in fld: galat.append(f'{k}: ada karakter $')
    return dict(opsi=opsi, key=key)

def q(x): return "'" + x.strip('\n').replace("'","''") + "'"

def sql_soal(s, b, subtes, wref):
    t = s['t']; k = s['kode']
    kolom = 'kode, materi_id, ' + ('wacana_id, ' if wref else '') + 'kesulitan, pertanyaan, pembahasan'
    sel = f"{q(k)}, m.id, " + (f"{wref}, " if wref else '') + f"{q(s['kes'])}, {q(t['Q'])}, {q(t['P'])}"
    vals = ',\n  '.join(f"({q(l)}, {q(x)}, {'true' if l==b['key'] else 'false'})" for l,x in sorted(b['opsi'].items()))
    return (f"insert into soal ({kolom})\nselect {sel}\nfrom materi m join subtes s on s.id = m.subtes_id\n"
            f"where s.nama = {q(subtes)} and m.nama = {q(s['materi'])}\non conflict (kode) do nothing;\n"
            f"insert into opsi (soal_id, label, isi, is_benar)\nselect so.id, v.label, v.isi, v.is_benar\nfrom soal so, (values\n  {vals}\n) as v (label, isi, is_benar)\n"
            f"where so.kode = {q(k)}\non conflict (soal_id, label) do nothing;\n")

def main(masuk, keluar):
    subtes, waca, soal = baca(masuk); galat = []
    if subtes not in MATERI: print('SUBTES tidak dikenal', subtes); sys.exit(1)
    hasil = []; kode_ada=set(); qs=set()
    for s in soal:
        if s['kode'] in kode_ada: galat.append(f"{s['kode']}: kode ganda")
        kode_ada.add(s['kode'])
        if s['materi'] not in MATERI[subtes]: galat.append(f"{s['kode']}: materi '{s['materi']}' tidak ada di {subtes}")
        if s['w'] and s['w'] not in waca: galat.append(f"{s['kode']}: wacana {s['w']} tidak ada")
        qn = re.sub(r'\W+','',s['t'].get('Q','').lower())
        if qn in qs: galat.append(f"{s['kode']}: pertanyaan kembar")
        qs.add(qn)
        b = bangun(s, galat)
        hasil.append((s,b))
    cnt = collections.Counter(s['materi'] for s in soal)
    kes = collections.Counter(s['kes'] for s in soal)
    print(f"{subtes}: {len(soal)} soal"); print(' per materi:', dict(cnt)); print(' kesulitan:', dict(kes))
    kunci = collections.Counter(b['key'] for _,b in hasil if b); print(' sebaran kunci:', dict(sorted(kunci.items())))
    if galat:
        print('GALAT:'); [print(' -',g) for g in galat]; sys.exit(2)
    out = [f"-- =====================================================================\n-- Soal latihan: {subtes} ({len(soal)} soal). Orisinal, ditulis untuk TembusPTN.\n-- Kode soal tetap; aman dijalankan ulang (on conflict do nothing).\n-- Dihasilkan dari file sumber lewat skrip, lalu diverifikasi (kunci, opsi, materi).\n-- =====================================================================\n"]
    sudah=set(); i=0
    while i < len(hasil):
        s,b = hasil[i]
        if s['w'] and s['w'] not in sudah:
            sudah.add(s['w'])
            grup = [(x,y) for x,y in hasil if x['w']==s['w']]
            body = ''.join(sql_soal(x,y,subtes,'w')+'\n' for x,y in grup)
            out.append(f"do $do$\ndeclare w bigint;\nbegin\n  if not exists (select 1 from soal where kode = {q(grup[0][0]['kode'])}) then\n    insert into wacana (isi) values ({q(waca[s['w']])}) returning id into w;\n"
                       + '\n'.join('    '+l if l else l for l in body.split('\n')) + "\n  end if;\nend $do$;\n")
        elif not s['w']:
            out.append(sql_soal(s,b,subtes,None))
        i+=1
    open(keluar,'w',encoding='utf-8').write('\n'.join(out))
    print('SQL ditulis:', keluar)
if __name__=='__main__': main(sys.argv[1], sys.argv[2])
