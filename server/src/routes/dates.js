// server/src/routes/dates.js
import { Router } from 'express';
import { pool } from '../db/pool.js';

const router = Router();

const SQL_AVAILABLE_DATES = `
  SELECT DISTINCT DATE(inicio_operacion) AS fecha FROM registros_operador
  UNION
  SELECT DISTINCT DATE(inicio_operacion) AS fecha FROM registros_maquina
  ORDER BY fecha DESC
`;

router.get('/available-dates', async (_req, res) => {
  try {
    const [rows] = await pool.query(SQL_AVAILABLE_DATES);
    const dates = rows.map(r =>
      r.fecha instanceof Date ? r.fecha.toISOString().slice(0, 10) : String(r.fecha)
    );
    res.json({ dates });
  } catch (e) {
    console.error('Error fetching available dates:', e);
    res.status(500).json({ error: 'Failed to fetch available dates' });
  }
});

export default router;
