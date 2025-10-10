// server/src/app.js
import express from 'express';
import cors from 'cors';

import datesRouter from './routes/dates.js';
import reportsRouter from './routes/reports.js';

const app = express();
app.use(cors());
app.use(express.json());

// Opcional: health
app.get('/api/health', (_req, res) => res.json({ ok: true }));

// Montar rutas APIa:
app.use('/api', datesRouter);
app.use('/api', reportsRouter);

// Si navegas a / (root) responderá 404 por diseño.
// Si quieres una respuesta simple en '/', agrega:
// app.get('/', (_req, res) => res.send('WebReports API'));

export default app;
