const { Galat } = require('../utils/galat');

function tidakDitemukan(req, res, next) {
  next(new Galat('TIDAK_DITEMUKAN', `Rute ${req.method} ${req.originalUrl} tidak ada.`));
}

// eslint-disable-next-line no-unused-vars
function penangananError(err, req, res, next) {
  if (!(err instanceof Galat)) {
    console.error(err); // detail hanya di log server, tidak dikirim ke klien
    err = new Galat('SERVER', 'Terjadi kesalahan pada server.');
  }
  res.status(err.status).json({ error: { kode: err.kode, pesan: err.message } });
}

module.exports = { tidakDitemukan, penangananError };
