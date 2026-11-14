const supabase = require('../config/supabase');
const bungkus = require('../utils/bungkus');

exports.cek = bungkus(async (req, res) => {
  // ?db=1 ikut menguji koneksi ke Supabase (berguna saat setup)
  const hasil = { status: 'ok', waktu: new Date().toISOString() };
  if (req.query.db === '1') {
    const { error } = await supabase.from('subtes').select('id', { head: true, count: 'exact' });
    hasil.database = error ? `gagal: ${error.message}` : 'terhubung';
  }
  res.json(hasil);
});
