// server/src/routes/reports.js
import { Router } from 'express';
import { pool } from '../db/pool.js';

const router = Router();

router.get('/reports', async (_req, res) => {
  try {
    const [rows] = await pool.query('SELECT id, title, created_at FROM reports ORDER BY id DESC');
    res.json(rows);
  } catch (e) {
    console.error('Error fetching reports:', e);
    res.status(500).json({ error: 'Failed to fetch reports' });
  }
});

router.post('/reports', async (req, res) => {
  try {
    const { title } = req.body || {};
    if (!title || !title.trim()) return res.status(400).json({ error: 'title required' });
    const [r] = await pool.query('INSERT INTO reports (title) VALUES (?)', [title.trim()]);
    res.json({ id: r.insertId });
  } catch (e) {
    console.error('Error creating report:', e);
    res.status(500).json({ error: 'Failed to create report' });
  }
});

export default router;

