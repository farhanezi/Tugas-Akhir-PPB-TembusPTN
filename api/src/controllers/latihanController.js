const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { idParam, periksa, pastikanProfil } = require('../utils/bantu');

const MAKS_SOAL = 50;
const UMPAN_BALIK = ['langsung', 'akhir'];

function acak(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

// Semua id soal latihan pada materi tertentu (dipaginasi karena Supabase membatasi 1000 baris per permintaan)
async function idSoalLatihan(materiIds) {
  const hasil = [];
  for (let dari = 0; ; dari += 1000) {
    const rows = periksa(
      await supabase
        .from('soal')
        .select('id')
        .is('try_out_id', null)
        .in('materi_id', materiIds)
        .order('id')
        .range(dari, dari + 999)
    );
    hasil.push(...rows.map((r) => r.id));
    if (rows.length < 1000) return hasil;
  }
}

// Ambil sesi latihan milik pengguna; 404 bila tidak ada, 403 bila milik orang lain
async function sesiLatihanMilik(sesiId, userId) {
  const sesi = periksa(
    await supabase.from('sesi').select('id, profil_id, jenis, pengaturan, mulai_at, selesai_at').eq('id', sesiId).maybeSingle()
  );
  if (!sesi || sesi.jenis !== 'latihan') throw new Galat('TIDAK_DITEMUKAN', 'Sesi latihan tidak ditemukan.');
  if (sesi.profil_id !== userId) throw new Galat('BUKAN_PEMILIK', 'Sesi ini bukan milik Anda.');
  return sesi;
}

// POST /api/latihan/sesi
exports.mulai = bungkus(async (req, res) => {
  const { materi_ids: materiIds, jumlah, mode = 'acak', umpan_balik: umpanBalik = 'langsung' } = req.body || {};

  if (!Array.isArray(materiIds) || materiIds.length === 0 || materiIds.length > 50 ||
      !materiIds.every((n) => Number.isInteger(n) && n > 0)) {
    throw new Galat('VALIDASI', 'materi_ids harus berisi 1-50 id materi.');
  }
  if (!Number.isInteger(jumlah) || jumlah < 1 || jumlah > MAKS_SOAL) {
    throw new Galat('VALIDASI', `jumlah harus bilangan bulat 1-${MAKS_SOAL}.`);
  }
  if (mode !== 'acak') throw new Galat('VALIDASI', 'Mode belum tersedia.');
  if (!UMPAN_BALIK.includes(umpanBalik)) throw new Galat('VALIDASI', 'umpan_balik harus langsung atau akhir.');

  const unik = [...new Set(materiIds)];
  const ada = periksa(await supabase.from('materi').select('id').in('id', unik));
  if (ada.length !== unik.length) throw new Galat('VALIDASI', 'Ada materi yang tidak ditemukan.');

  const semua = await idSoalLatihan(unik);
  if (jumlah > semua.length) {
    throw new Galat('STOK_KURANG', `Soal tersedia hanya ${semua.length}, diminta ${jumlah}.`);
  }
  const terpilih = acak(semua).slice(0, jumlah);

  // Kunci (is_benar) sengaja TIDAK diambil
  const rows = periksa(
    await supabase
      .from('soal')
      .select('id, pertanyaan, gambar_url, wacana:wacana_id (isi), opsi (id, label, isi)')
      .in('id', terpilih)
  );
  const peta = new Map(rows.map((r) => [r.id, r]));

  await pastikanProfil(req.user.id);
  const pengaturan = { materi_ids: unik, jumlah, mode, umpan_balik: umpanBalik, soal_ids: terpilih };
  const sesi = periksa(
    await supabase.from('sesi').insert({ profil_id: req.user.id, jenis: 'latihan', pengaturan }).select('id').single()
  );

  res.status(201).json({
    sesi_id: sesi.id,
    jumlah_soal: jumlah,
    umpan_balik: umpanBalik,
    soal: terpilih.map((id, i) => {
      const s = peta.get(id);
      return {
        id,
        nomor: i + 1,
        pertanyaan: s.pertanyaan,
        gambar_url: s.gambar_url,
        wacana: s.wacana ? s.wacana.isi : null,
        opsi: [...s.opsi].sort((a, b) => a.label.localeCompare(b.label)),
      };
    }),
  });
});

// POST /api/latihan/sesi/:id/jawaban   (tombol Periksa; jawaban terkunci)
exports.jawab = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const { soal_id: soalId, opsi_id: opsiId } = req.body || {};
  if (!Number.isInteger(soalId) || !Number.isInteger(opsiId)) {
    throw new Galat('VALIDASI', 'soal_id dan opsi_id wajib berupa angka.');
  }

  const sesi = await sesiLatihanMilik(sesiId, req.user.id);
  if (sesi.selesai_at) throw new Galat('SESI_SELESAI', 'Sesi ini sudah selesai.');
  if (!sesi.pengaturan.soal_ids.includes(soalId)) {
    throw new Galat('TIDAK_DITEMUKAN', 'Soal tidak termasuk sesi ini.');
  }

  const sudah = periksa(
    await supabase.from('jawaban').select('id').eq('sesi_id', sesiId).eq('soal_id', soalId).maybeSingle()
  );
  if (sudah) throw new Galat('SUDAH_DIJAWAB', 'Soal ini sudah diperiksa dan tidak bisa diubah.');

  const opsi = periksa(await supabase.from('opsi').select('id, is_benar').eq('soal_id', soalId));
  const dipilih = opsi.find((o) => o.id === opsiId);
  if (!dipilih) throw new Galat('VALIDASI', 'Opsi bukan milik soal ini.');
  const benar = opsi.find((o) => o.is_benar);

  const { error } = await supabase
    .from('jawaban')
    .insert({ sesi_id: sesiId, soal_id: soalId, opsi_id: opsiId, is_benar: dipilih.is_benar });
  if (error) {
    // 23505 = pelanggaran unique: dua permintaan Periksa berbarengan
    if (error.code === '23505') throw new Galat('SUDAH_DIJAWAB', 'Soal ini sudah diperiksa dan tidak bisa diubah.');
    console.error(error);
    throw new Galat('SERVER', 'Terjadi kesalahan pada database.');
  }

  if (sesi.pengaturan.umpan_balik === 'akhir') return res.json({ tersimpan: true });

  const soal = periksa(await supabase.from('soal').select('pembahasan').eq('id', soalId).single());
  res.json({ benar: dipilih.is_benar, opsi_benar_id: benar ? benar.id : null, pembahasan: soal.pembahasan });
});

// POST /api/latihan/sesi/:id/selesai   (aman dipanggil berulang)
exports.selesai = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const sesi = await sesiLatihanMilik(sesiId, req.user.id);
  let selesaiAt = sesi.selesai_at;
  if (!selesaiAt) {
    selesaiAt = new Date().toISOString();
    periksa(await supabase.from('sesi').update({ selesai_at: selesaiAt }).eq('id', sesiId).is('selesai_at', null));
  }
  res.json({ sesi_id: sesiId, selesai_at: selesaiAt });
});
