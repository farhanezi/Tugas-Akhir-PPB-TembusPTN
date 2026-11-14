// Skor ESTIMASI berbobot tingkat kesulitan (bukan IRT asli).
// Nilai-nilai ini keputusan sementara dan mudah diubah di satu tempat ini.
const BOBOT = { mudah: 1, sedang: 2, sulit: 3 };
const SKALA = { min: 200, maks: 800 }; // skor subtes berkisar 200-800

const bulat1 = (n) => Math.round(n * 10) / 10;

// soal: [{ id, kesulitan }], idBenar: Set id soal yang dijawab benar
function hitungSkorSubtes(soal, idBenar) {
  const total = soal.reduce((j, s) => j + BOBOT[s.kesulitan], 0);
  if (total === 0) return SKALA.min;
  const dapat = soal.reduce((j, s) => j + (idBenar.has(s.id) ? BOBOT[s.kesulitan] : 0), 0);
  return bulat1(SKALA.min + (SKALA.maks - SKALA.min) * (dapat / total));
}

const rataRata = (angka) => (angka.length ? bulat1(angka.reduce((a, b) => a + b, 0) / angka.length) : null);

module.exports = { BOBOT, SKALA, hitungSkorSubtes, rataRata };
