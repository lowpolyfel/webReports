import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import { config } from './config/config.js';
import reportsRouter from './routes/reports.routes.js';

const app = express();

app.use(cors({ origin: config.cors.origin }));
app.use(express.json());
app.use(morgan('dev'));

app.get('/api/health', (_req, res) => {
    res.json({ ok: true, service: 'server', ts: new Date().toISOString() });
});

app.use('/api/reports', reportsRouter);

export default app;
