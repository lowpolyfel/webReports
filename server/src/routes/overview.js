// server/src/routes/overview.js
import { Router } from 'express';
import { pool } from '../db/pool.js';

const router = Router();

/**
 * /api/overview
 * Totales por tabla y última actividad por cada “registro de tiempo”.
 */
router.get('/overview', async (req, res) => {
  try {
    const qCount = (table) => pool.query(`SELECT COUNT(*) AS c FROM ${table}`);

    const [
      [maquina], [operador], [tecnico], [supervisor],
      [reel], [hr], [opMaq], [regOp], [regCar], [regTec]
    ] = await Promise.all([
      qCount('maquina'),
      qCount('operador'),
      qCount('tecnico'),
      qCount('supervisor'),
      qCount('reel'),
      qCount('hr'),
      qCount('operacion_maquina'),
      qCount('registro_operador'),
      qCount('registro_carrete'),
      qCount('registro_tecnico'),
    ]);

    // Últimas actividades (por tablas con rangos de tiempo)
    const [[opMaqLast]] = await pool.query(`SELECT MAX(fecha_inicio) AS last FROM operacion_maquina`);
    const [[regOpLast]] = await pool.query(`SELECT MAX(fecha_inicio) AS last FROM registro_operador`);
    const [[regTecLast]] = await pool.query(`SELECT MAX(fecha_inicio) AS last FROM registro_tecnico`);
    const [[regCarLast]] = await pool.query(`SELECT MAX(fecha_inicio) AS last FROM registro_carrete`);

    res.json({
      totals: {
        maquinas: maquina[0].c,
        operadores: operador[0].c,
        tecnicos: tecnico[0].c,
        supervisores: supervisor[0].c,
        reels: reel[0].c,
        hr: hr[0].c,
        operaciones: opMaq[0].c,
        reg_operador: regOp[0].c,
        reg_carrete: regCar[0].c,
        reg_tecnico: regTec[0].c,
      },
      lastActivity: {
        operacion_maquina: opMaqLast?.last,
        registro_operador: regOpLast?.last,
        registro_tecnico: regTecLast?.last,
        registro_carrete: regCarLast?.last,
      }
    });
  } catch (err) {
    console.error('[overview]', err);
    res.status(500).json({ error: 'Error building overview' });
  }
});

/**
 * /api/available-dates
 * Fechas únicas (YYYY-MM-DD) donde existe actividad en cualquiera de las tablas de rango.
 * Sirve para chips/botones de navegación por fecha.
 */

router.get('/available-dates', async (req, res) => {
  try {
    const scope = (req.query.scope || '').toLowerCase();

    const sqlByScope = {
      operacion: `SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM operacion_maquina ORDER BY fecha DESC`,
      operador:  `SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_operador ORDER BY fecha DESC`,
      tecnico:   `SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_tecnico ORDER BY fecha DESC`,
      carrete:   `SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_carrete ORDER BY fecha DESC`,
    };

    const sql = sqlByScope[scope] || `
      SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM operacion_maquina
      UNION
      SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_operador
      UNION
      SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_tecnico
      UNION
      SELECT DISTINCT DATE(fecha_inicio) AS fecha FROM registro_carrete
      ORDER BY fecha DESC
    `;

    const [rows] = await pool.query(sql);

    const dates = rows.map(r =>
      r.fecha instanceof Date ? r.fecha.toISOString().slice(0,10) : String(r.fecha)
    );

    res.json({ scope: scope || 'all', dates });
  } catch (err) {
    console.error('[available-dates]', err);
    res.status(500).json({ error: 'Error loading dates' });
  }
});


export default router;

