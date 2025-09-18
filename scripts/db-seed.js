import { execFileSync } from 'node:child_process';

function requireEnv(name) {
  if (!process.env[name]) throw new Error(`Missing env: ${name}`);
  return process.env[name];
}

const host = process.env.DB_HOST || '127.0.0.1';
const port = process.env.DB_PORT || '3306';
const user = requireEnv('fel');
const password = process.env.DB_PASSWORD || 'feli123';
const database = requireEnv('bd_test');

execFileSync('bash', ['-lc', `
  mysql -h ${host} -P ${port} -u ${user} ${password ? `-p${password}` : ''} ${database} -e "
    INSERT INTO reports (title) VALUES ('Primer reporte de prueba');
  "
`], { stdio: 'inherit' });

