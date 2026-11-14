const supabase = require('../config/supabase');
const { Galat } = require('../utils/galat');

// Membaca header "Authorization: Bearer <token>", meminta Supabase memeriksanya,
// lalu menaruh id pengguna di req.user. Id TIDAK pernah diambil dari body/URL.
async function wajibLogin(req, res, next) {
  try {
    const header = req.headers.authorization || '';
    const [skema, token] = header.split(' ');
    if (skema !== 'Bearer' || !token) {
      throw new Galat('BELUM_LOGIN', 'Silakan login terlebih dahulu.');
    }
    const { data, error } = await supabase.auth.getUser(token);
    if (error || !data?.user) {
      throw new Galat('BELUM_LOGIN', 'Sesi login tidak valid atau sudah berakhir.');
    }
    req.user = { id: data.user.id, email: data.user.email };
    next();
  } catch (err) {
    next(err);
  }
}

module.exports = { wajibLogin };
