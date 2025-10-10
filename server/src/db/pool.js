import mysql from 'mysql2/promise';

export const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  user: process.env.DB_USER || 'fel',
  password: process.env.DB_PASSWORD || 'feli123',
  database: process.env.DB_NAME || 'bd_test',
  port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  // Necesario si ejecutas un schema.sql con varias sentencias separadas por ';'
  multipleStatements: true
});

