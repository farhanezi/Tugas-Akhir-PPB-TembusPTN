const express = require('express');
const cors = require('cors');
const routes = require('./routes');
const { tidakDitemukan, penangananError } = require('./middleware/errorHandler');

const app = express();

const asal = (process.env.CORS_ORIGINS || 'http://localhost:5173')
  .split(',').map((s) => s.trim()).filter(Boolean);
app.use(cors({ origin: asal }));
app.use(express.json({ limit: '100kb' }));

app.use('/api', routes);
app.use(tidakDitemukan);
app.use(penangananError);

module.exports = app;
