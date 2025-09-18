import { pool } from './db/pool.js';
import app from './app.js';
import { config } from './config/config.js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function ensureSchema() {
  const ddl = fs.readFileSync(path.join(__dirname, 'db', 'schema.sql'), 'utf8');
  await pool.query(ddl);
}

async function start() {
  try {
    await ensureSchema();
    const [ping] = await pool.query('SELECT 1 + 1 AS ok');
    console.log('[DB] Connected. Test:', ping[0].ok);

    app.listen(config.port, () => {
      console.log([Server] Listening on http://localhost:${config.port});
    });
  } catch (err) {
    console.error('[Startup error]', err);
    process.exit(1);
  }
}

start();
