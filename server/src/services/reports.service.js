import { pool } from '../db/pool.js';

export async function listReports() {
  const [rows] = await pool.query('SELECT id, title, created_at FROM reports ORDER BY id DESC');
  return rows;
}

export async function createReport(title) {
  const [result] = await pool.execute('INSERT INTO reports (title) VALUES (?)', [title]);
  return { id: result.insertId, title };
}
