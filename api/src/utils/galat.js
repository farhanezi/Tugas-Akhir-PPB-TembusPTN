// Format error seragam: { error: { kode, pesan } }
// Daftar kode mengikuti rancangan-endpoint.md
const STATUS = {
  BELUM_LOGIN: 401,
  BUKAN_PEMILIK: 403,
  TIDAK_DITEMUKAN: 404,
  VALIDASI: 422,
  STOK_KURANG: 422,
  SUDAH_DIJAWAB: 409,
  SESI_SELESAI: 409,
  SUBTES_TERKUNCI: 409,
  WAKTU_HABIS: 409,
  TRY_OUT_SUDAH_SELESAI: 409,
  SERVER: 500,
};

class Galat extends Error {
  constructor(kode, pesan) {
    super(pesan);
    this.kode = kode;
    this.status = STATUS[kode] || 500;
  }
}

module.exports = { Galat };
