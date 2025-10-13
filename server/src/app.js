// server/src/app.js
import express from 'express';
import cors from 'cors';
import overviewRouter from './routes/overview.js';

const app = express();

app.use(cors());
app.use(express.json());

// Monta API
app.use('/api', overviewRouter);

// (opcional) raíz simple para comprobar
app.get('/', (req, res) => res.send('API WebReports (wb_db)'));

export default app;

