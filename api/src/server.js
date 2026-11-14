const app = require('./app');

const PORT = process.env.PORT || 3000;

// Di Vercel, app diekspor dan dijalankan sebagai fungsi serverless (tanpa listen).
if (process.env.VERCEL) {
  module.exports = app;
} else {
  app.listen(PORT, () => console.log(`API TembusPTN berjalan di http://localhost:${PORT}`));
  module.exports = app;
}
