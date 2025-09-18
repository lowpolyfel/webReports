import { execFileSync } from 'node:child_process';

function requireEnv(name) {
  if (!process.env[name]) throw new Error(`Falta variable: ${name}`);
  return process.env[name];
}

const host = process.env.BD_HOST || '127.0.0.1';
const port = process.env.BD_PUERTO || '3306';
const user = requireEnv('BD_USUARIO');
const password = process.env.BD_CONTRASENA || '';
const database = requireEnv('BD_NOMBRE');

execFileSync('bash', ['-lc', `
  mysql -h ${host} -P ${port} -u ${user} ${password ? `-p${password}` : ''} ${database} -e "
    INSERT INTO reports (title) VALUES ('Reporte de prueba');
  "
`], { stdio: 'inherit' });
