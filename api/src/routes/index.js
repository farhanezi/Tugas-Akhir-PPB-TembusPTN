const express = require('express');
const { wajibLogin } = require('../middleware/auth');
const health = require('../controllers/healthController');
const profil = require('../controllers/profilController');
const materi = require('../controllers/materiController');
const latihan = require('../controllers/latihanController');
const tryOut = require('../controllers/tryOutController');
const hasil = require('../controllers/hasilController');
const rekom = require('../controllers/rekomendasiController');
const riwayat = require('../controllers/riwayatController');

const router = express.Router();

router.get('/health', health.cek); // satu-satunya yang tanpa login

router.use(wajibLogin); // semua rute di bawah ini wajib login

router.get('/profil', profil.ambil);
router.put('/profil', profil.simpan);
router.get('/target-prodi', profil.daftarTarget);

router.get('/dashboard', rekom.dashboard);
router.get('/rekomendasi', rekom.rekomendasi);
router.get('/riwayat', riwayat.riwayat);

router.get('/subtes', materi.daftarSubtes);
router.get('/subtes/:id/materi', materi.materiDiSubtes);
router.get('/materi/:id', materi.detailMateri);
router.get('/submateri/:id', materi.detailSubmateri);
router.post('/submateri/:id/selesai', materi.tandaiSubmateriSelesai);
router.delete('/submateri/:id/selesai', materi.batalSubmateriSelesai);
router.post('/materi/:id/selesai', materi.tandaiSelesai);
router.delete('/materi/:id/selesai', materi.batalSelesai);

router.post('/latihan/sesi', latihan.mulai);
router.post('/latihan/sesi/:id/jawaban', latihan.jawab);
router.post('/latihan/sesi/:id/selesai', latihan.selesai);

router.get('/try-out', tryOut.daftar);
router.get('/try-out/:id', tryOut.detail);
router.post('/try-out/:id/sesi', tryOut.mulaiSesi);
router.post('/try-out/sesi/:id/subtes/:subtesId/mulai', tryOut.mulaiSubtes);
router.put('/try-out/sesi/:id/jawaban', tryOut.simpanJawaban);
router.post('/try-out/sesi/:id/subtes/:subtesId/selesai', tryOut.selesaiSubtes);

router.get('/sesi/:id/hasil', hasil.hasil);

module.exports = router;
