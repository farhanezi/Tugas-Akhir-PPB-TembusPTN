import re,sys
def ubah(path, kode, opsi, key):
    s=open(path,encoding='utf-8').read()
    i=s.index('## '+kode+' |'); j=s.find('\n## ',i+1); j=len(s) if j<0 else j
    blok=s[i:j]
    blok2=re.sub(r'^A:.*\nB:.*\nC:.*\nD:.*\nE:.*$', '\n'.join(f'{l}: {o}' for l,o in zip('ABCDE',opsi)), blok, flags=re.M)
    blok2=re.sub(r'^K:.*$', f'K: {key}', blok2, flags=re.M)
    assert blok2!=blok, kode
    open(path,'w',encoding='utf-8').write(s[:i]+blok2+s[j:])
