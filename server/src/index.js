// server/src/index.js
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import app from './app.js';
import { pool } from './db/pool.js';
import { config } from './config/config.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function ensureSchema() {
  const ddlPath = path.join(__dirname, 'db', 'schema.sql');
  if (fs.existsSync(ddlPath)) {
    const ddl = fs.readFileSync(ddlPath, 'utf8');
    // Si tu schema.sql trae varias sentencias separadas por ';',
    // tu pool debe tener multipleStatements:true (ver pool.js).
    await pool.query(ddl);
  }
}

async function start() {
  try {
    await ensureSchema();
    const [ping] = await pool.query('SELECT 1 + 1 AS ok');
    console.log('[DB] Connected. Test:', ping[0].ok);

    app.listen(config.port, () => {
      console.log(`[Server] Listening on http://localhost:${config.port}`);
    });
  } catch (err) {
    console.error('[Startup error]', err);
    process.exit(1);
  }
}

start();
