const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');
const { Galat } = require('../utils/galat');
const { idParam, periksa, pastikanProfil } = require('../utils/bantu');
const svc = require('../services/tryOutService');

async function tryOutTerbit(id) {
  const t = periksa(
    await supabase.from('try_out').select('id, judul, deskripsi, terbit').eq('id', id).maybeSingle()
  );
  if (!t || !t.terbit) throw new Galat('TIDAK_DITEMUKAN', 'Try out tidak ditemukan.');
  return t;
}

// Sesi try out terbaru milik pengguna untuk satu try out (atau null), setelah menutup subtes kedaluwarsa
async function sesiSaya(tryOutId, userId) {
  const sesi = periksa(
    await supabase.from('sesi').select(svc.KOLOM_SESI).eq('profil_id', userId).eq('jenis', 'try_out').eq('try_out_id', tryOutId).maybeSingle()
  );
  if (!sesi) return null;
  return svc.sesiTryOutMilik(sesi.id, userId);
}

// GET /api/try-out
async function daftarUntuk(userId) {
  const daftar = periksa(
    await supabase.from('try_out').select('id, judul, deskripsi').eq('terbit', true).order('id')
  );
  const hasil = [];
  for (const t of daftar) {
    const subtes = await svc.subtesDiTryOut(t.id);
    const sesi = await sesiSaya(t.id, userId);
    hasil.push({
      id: t.id,
      judul: t.judul,
      deskripsi: t.deskripsi,
      jumlah_subtes: subtes.length,
      total_soal: subtes.reduce((j, s) => j + s.jumlah_soal, 0),
      total_menit: subtes.reduce((j, s) => j + s.durasi_menit, 0),
      status: !sesi ? 'belum' : sesi.selesai_at ? 'selesai' : 'berjalan',
      sesi_id: sesi ? sesi.id : null,
      skor: sesi && sesi.selesai_at ? Number(sesi.skor) : null,
    });
  }
  return hasil;
}
exports.daftarUntuk = daftarUntuk;
exports.daftar = bungkus(async (req, res) => res.json(await daftarUntuk(req.user.id)));

// GET /api/try-out/:id
exports.detail = bungkus(async (req, res) => {
  const t = await tryOutTerbit(idParam(req.params.id));
  const subtes = await svc.subtesDiTryOut(t.id);
  const sesi = await sesiSaya(t.id, req.user.id);
  const rows = sesi
    ? periksa(await supabase.from('sesi_subtes').select('subtes_id, mulai_at, selesai_at, skor').eq('sesi_id', sesi.id))
    : [];
  const peta = new Map(rows.map((r) => [r.subtes_id, r]));

  let sebelumnyaSelesai = true; // subtes pertama selalu boleh dimulai
  const daftarSubtes = subtes.map((s) => {
    const r = peta.get(s.id);
    let status;
    if (r && r.selesai_at) status = 'selesai';
    else if (r) status = 'berjalan';
    else status = sebelumnyaSelesai ? 'aktif' : 'terkunci';
    sebelumnyaSelesai = Boolean(r && r.selesai_at);
    return {
      id: s.id,
      nama: s.nama,
      kelompok: s.kelompok,
      jumlah_soal: s.jumlah_soal,
      durasi_menit: s.durasi_menit,
      status,
      skor: r && r.selesai_at ? Number(r.skor) : null,
      batas_at: r && !r.selesai_at ? svc.batasAt(r.mulai_at, s.durasi_menit).toISOString() : null,
    };
  });

  res.json({
    id: t.id,
    judul: t.judul,
    deskripsi: t.deskripsi,
    total_soal: subtes.reduce((j, s) => j + s.jumlah_soal, 0),
    total_menit: subtes.reduce((j, s) => j + s.durasi_menit, 0),
    status: !sesi ? 'belum' : sesi.selesai_at ? 'selesai' : 'berjalan',
    sesi_id: sesi ? sesi.id : null,
    skor: sesi && sesi.selesai_at ? Number(sesi.skor) : null,
    subtes: daftarSubtes,
  });
});

// POST /api/try-out/:id/sesi   (mengembalikan sesi yang sedang berjalan bila ada)
exports.mulaiSesi = bungkus(async (req, res) => {
  const t = await tryOutTerbit(idParam(req.params.id));
  if ((await svc.subtesDiTryOut(t.id)).length === 0) throw new Galat('TIDAK_DITEMUKAN', 'Try out ini belum berisi soal.');

  const cek = async () => {
    const ada = await sesiSaya(t.id, req.user.id);
    if (ada && ada.selesai_at) throw new Galat('TRY_OUT_SUDAH_SELESAI', 'Try out ini sudah pernah kamu selesaikan.');
    return ada;
  };

  let sesi = await cek();
  if (sesi) return res.json({ sesi_id: sesi.id, try_out_id: t.id, mulai_at: sesi.mulai_at });

  await pastikanProfil(req.user.id);
  const { data, error } = await supabase
    .from('sesi')
    .insert({ profil_id: req.user.id, jenis: 'try_out', try_out_id: t.id })
    .select(svc.KOLOM_SESI)
    .single();
  if (error) {
    if (error.code === '23505') {
      // dua permintaan berbarengan: pakai sesi yang sudah terbentuk
      sesi = await cek();
      return res.json({ sesi_id: sesi.id, try_out_id: t.id, mulai_at: sesi.mulai_at });
    }
    console.error(error);
    throw new Galat('SERVER', 'Terjadi kesalahan pada database.');
  }
  res.status(201).json({ sesi_id: data.id, try_out_id: t.id, mulai_at: data.mulai_at });
});

// POST /api/try-out/sesi/:id/subtes/:subtesId/mulai   (idempotent)
exports.mulaiSubtes = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const subtesId = idParam(req.params.subtesId, 'subtesId');
  const sesi = await svc.sesiTryOutMilik(sesiId, req.user.id);
  if (sesi.selesai_at) throw new Galat('TRY_OUT_SUDAH_SELESAI', 'Try out ini sudah selesai.');

  const subtesList = await svc.subtesDiTryOut(sesi.try_out_id);
  const idx = subtesList.findIndex((s) => s.id === subtesId);
  if (idx === -1) throw new Galat('TIDAK_DITEMUKAN', 'Subtes tidak ada di try out ini.');
  const subtes = subtesList[idx];

  const rows = periksa(await supabase.from('sesi_subtes').select('subtes_id, mulai_at, selesai_at').eq('sesi_id', sesiId));
  const peta = new Map(rows.map((r) => [r.subtes_id, r]));
  let sekarang = peta.get(subtesId);

  if (sekarang && sekarang.selesai_at) throw new Galat('SUBTES_TERKUNCI', 'Subtes ini sudah selesai dan tidak bisa dibuka lagi.');
  if (!sekarang) {
    const sebelumnya = subtesList.slice(0, idx);
    if (!sebelumnya.every((s) => peta.get(s.id) && peta.get(s.id).selesai_at)) {
      throw new Galat('SUBTES_TERKUNCI', 'Selesaikan subtes sebelumnya terlebih dahulu.');
    }
    const { data, error } = await supabase
      .from('sesi_subtes')
      .insert({ sesi_id: sesiId, subtes_id: subtesId })
      .select('mulai_at, selesai_at')
      .single();
    if (error) {
      if (error.code !== '23505') {
        console.error(error);
        throw new Galat('SERVER', 'Terjadi kesalahan pada database.');
      }
      sekarang = periksa(
        await supabase.from('sesi_subtes').select('mulai_at, selesai_at').eq('sesi_id', sesiId).eq('subtes_id', subtesId).single()
      );
    } else {
      sekarang = data;
    }
  }

  const materi = periksa(await supabase.from('materi').select('id').eq('subtes_id', subtesId));
  const [soal, jawaban] = await Promise.all([
    // Kunci (is_benar) dan pembahasan sengaja TIDAK diambil
    supabase
      .from('soal')
      .select('id, nomor, pertanyaan, gambar_url, wacana:wacana_id (isi), opsi (id, label, isi)')
      .eq('try_out_id', sesi.try_out_id)
      .in('materi_id', materi.map((m) => m.id))
      .order('nomor'),
    supabase.from('jawaban').select('soal_id, opsi_id, ragu').eq('sesi_id', sesiId),
  ]);
  const soalList = periksa(soal)
    .sort((a, b) => a.nomor - b.nomor)
    .map((s) => ({
      id: s.id,
      nomor: s.nomor,
      pertanyaan: s.pertanyaan,
      gambar_url: s.gambar_url,
      wacana: s.wacana ? s.wacana.isi : null,
      opsi: [...s.opsi].sort((a, b) => a.label.localeCompare(b.label)),
    }));
  const idSoal = new Set(soalList.map((s) => s.id));

  res.json({
    subtes: { id: subtes.id, nama: subtes.nama },
    mulai_at: sekarang.mulai_at,
    batas_at: svc.batasAt(sekarang.mulai_at, subtes.durasi_menit).toISOString(),
    waktu_server: new Date().toISOString(),
    soal: soalList,
    jawaban: periksa(jawaban).filter((j) => idSoal.has(j.soal_id)),
  });
});

// PUT /api/try-out/sesi/:id/jawaban   (simpan otomatis; boleh diubah selama subtes berjalan)
exports.simpanJawaban = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const { soal_id: soalId, opsi_id: opsiId, ragu } = req.body || {};
  if (!Number.isInteger(soalId)) throw new Galat('VALIDASI', 'soal_id wajib berupa angka.');
  if (opsiId !== null && opsiId !== undefined && !Number.isInteger(opsiId)) throw new Galat('VALIDASI', 'opsi_id tidak valid.');
  if (ragu !== undefined && typeof ragu !== 'boolean') throw new Galat('VALIDASI', 'ragu harus true atau false.');

  // Tanpa pemeriksaan "sesi selesai" di sini: bila subtes terakhir ditutup karena waktu habis,
  // sesi ikut selesai dan tampilan tetap perlu menerima WAKTU_HABIS (dari pemeriksaan subtes di bawah).
  const sesi = await svc.sesiTryOutMilik(sesiId, req.user.id);

  const soal = periksa(
    await supabase.from('soal').select('id, try_out_id, materi:materi_id (subtes_id)').eq('id', soalId).maybeSingle()
  );
  if (!soal || soal.try_out_id !== sesi.try_out_id) throw new Galat('TIDAK_DITEMUKAN', 'Soal tidak termasuk try out ini.');
  const subtesId = soal.materi.subtes_id;

  const ss = periksa(
    await supabase.from('sesi_subtes').select('mulai_at, selesai_at').eq('sesi_id', sesiId).eq('subtes_id', subtesId).maybeSingle()
  );
  if (!ss) throw new Galat('SUBTES_TERKUNCI', 'Subtes ini belum dimulai.');
  const subtes = periksa(await supabase.from('subtes').select('durasi_menit').eq('id', subtesId).single());
  const batas = svc.batasAt(ss.mulai_at, subtes.durasi_menit);
  if (ss.selesai_at) {
    // ditutup karena waktu habis (selesai_at = batas) atau ditutup pengguna
    throw new Galat(new Date(ss.selesai_at) >= batas ? 'WAKTU_HABIS' : 'SUBTES_TERKUNCI', 'Subtes ini sudah ditutup.');
  }

  if (opsiId != null) {
    const opsi = periksa(await supabase.from('opsi').select('id').eq('id', opsiId).eq('soal_id', soalId).maybeSingle());
    if (!opsi) throw new Galat('VALIDASI', 'Opsi bukan milik soal ini.');
  }

  const lama = periksa(
    await supabase.from('jawaban').select('ragu').eq('sesi_id', sesiId).eq('soal_id', soalId).maybeSingle()
  );
  periksa(
    await supabase.from('jawaban').upsert(
      {
        sesi_id: sesiId,
        soal_id: soalId,
        opsi_id: opsiId ?? null,
        ragu: ragu !== undefined ? ragu : lama ? lama.ragu : false,
        dijawab_at: new Date().toISOString(),
      },
      { onConflict: 'sesi_id,soal_id' }
    )
  );
  res.json({ tersimpan: true, sisa_detik: Math.max(0, Math.floor((batas.getTime() - Date.now()) / 1000)) });
});

// POST /api/try-out/sesi/:id/subtes/:subtesId/selesai   (aman dipanggil berulang)
exports.selesaiSubtes = bungkus(async (req, res) => {
  const sesiId = idParam(req.params.id);
  const subtesId = idParam(req.params.subtesId, 'subtesId');
  let sesi = await svc.sesiTryOutMilik(sesiId, req.user.id);

  const baca = async () =>
    periksa(await supabase.from('sesi_subtes').select('selesai_at, skor').eq('sesi_id', sesiId).eq('subtes_id', subtesId).maybeSingle());
  let ss = await baca();
  if (!ss) throw new Galat('SUBTES_TERKUNCI', 'Subtes ini belum dimulai.');

  if (!ss.selesai_at) {
    await svc.tutupSubtes(sesi, subtesId, new Date().toISOString());
    ss = await baca();
    sesi = periksa(await supabase.from('sesi').select(svc.KOLOM_SESI).eq('id', sesiId).single());
  }

  const subtesList = await svc.subtesDiTryOut(sesi.try_out_id);
  const idx = subtesList.findIndex((s) => s.id === subtesId);
  const berikutnya = idx >= 0 && idx < subtesList.length - 1 ? subtesList[idx + 1].id : null;
  res.json({
    skor_subtes: Number(ss.skor),
    subtes_berikutnya_id: berikutnya,
    sesi_selesai: Boolean(sesi.selesai_at),
  });
});

// Dipakai GET /api/sesi/:id/hasil untuk sesi try out
exports.hasil = async (sesiId, userId) => {
  const sesi = await svc.sesiTryOutMilik(sesiId, userId);
  if (!sesi.selesai_at) throw new Galat('TIDAK_DITEMUKAN', 'Hasil baru tersedia setelah semua subtes selesai.');

  const t = periksa(await supabase.from('try_out').select('id, judul').eq('id', sesi.try_out_id).single());
  const [subtesList, ssRows, soalRows, jawabanRows, profil] = await Promise.all([
    svc.subtesDiTryOut(sesi.try_out_id),
    supabase.from('sesi_subtes').select('subtes_id, mulai_at, selesai_at, skor').eq('sesi_id', sesiId),
    supabase
      .from('soal')
      .select('id, nomor, pertanyaan, gambar_url, pembahasan, wacana:wacana_id (isi), materi:materi_id (id, nama, subtes_id), opsi (id, label, isi, is_benar)')
      .eq('try_out_id', sesi.try_out_id),
    supabase.from('jawaban').select('soal_id, opsi_id, ragu, is_benar').eq('sesi_id', sesiId),
    supabase.from('profil').select('target_prodi_id').eq('id', userId).maybeSingle(),
  ]);
  const ss = new Map(periksa(ssRows).map((r) => [r.subtes_id, r]));
  const jwb = new Map(periksa(jawabanRows).map((j) => [j.soal_id, j]));
  const soalSemua = periksa(soalRows);

  const materiStat = new Map();
  const perSubtes = subtesList.map((s) => {
    const r = ss.get(s.id);
    const soalS = soalSemua.filter((x) => x.materi.subtes_id === s.id).sort((a, b) => a.nomor - b.nomor);
    let benar = 0;
    let salah = 0;
    const soalOut = soalS.map((x) => {
      const j = jwb.get(x.id);
      if (j && j.opsi_id != null) {
        j.is_benar ? benar++ : salah++;
        const k = `${s.id}:${x.materi.id}`;
        const m = materiStat.get(k) || { subtes_id: s.id, subtes_nama: s.nama, materi_id: x.materi.id, nama: x.materi.nama, benar: 0, salah: 0 };
        j.is_benar ? m.benar++ : m.salah++;
        materiStat.set(k, m);
      }
      return {
        id: x.id,
        nomor: x.nomor,
        pertanyaan: x.pertanyaan,
        gambar_url: x.gambar_url,
        wacana: x.wacana ? x.wacana.isi : null,
        materi: { id: x.materi.id, nama: x.materi.nama },
        opsi: [...x.opsi].sort((a, b) => a.label.localeCompare(b.label)),
        jawaban_opsi_id: j ? j.opsi_id : null,
        benar: j && j.opsi_id != null ? j.is_benar : null,
        ragu: j ? j.ragu : false,
        pembahasan: x.pembahasan,
      };
    });
    return {
      subtes: {
        id: s.id,
        nama: s.nama,
        kelompok: s.kelompok,
        skor: r ? Number(r.skor) : null,
        benar,
        salah,
        total: soalS.length,
        belum_dijawab: soalS.length - benar - salah,
        durasi_detik: r && r.selesai_at ? Math.max(0, Math.round((new Date(r.selesai_at) - new Date(r.mulai_at)) / 1000)) : null,
      },
      soal: soalOut,
    };
  });

  let target = null;
  const tp = periksa(profil);
  if (tp && tp.target_prodi_id) {
    const row = periksa(
      await supabase.from('target_prodi').select('ptn, prodi, skor_target').eq('id', tp.target_prodi_id).maybeSingle()
    );
    if (row) target = { ...row, skor_target: Number(row.skor_target), selisih: Math.round((Number(row.skor_target) - Number(sesi.skor)) * 10) / 10 };
  }

  return {
    sesi_id: sesiId,
    jenis: 'try_out',
    try_out: t,
    skor_total: Number(sesi.skor),
    skor_label: 'estimasi',
    mulai_at: sesi.mulai_at,
    selesai_at: sesi.selesai_at,
    subtes: perSubtes.map((p) => p.subtes),
    target,
    // dari yang akurasinya paling rendah; hanya materi yang ada salahnya
    materi_lemah: [...materiStat.values()]
      .filter((m) => m.salah > 0)
      .map((m) => ({ ...m, akurasi: Math.round((m.benar / (m.benar + m.salah)) * 100) }))
      .sort((a, b) => a.akurasi - b.akurasi || b.salah - a.salah)
      .slice(0, 5),
    soal: perSubtes.map((p) => ({ subtes_id: p.subtes.id, subtes_nama: p.subtes.nama, soal: p.soal })),
  };
};
