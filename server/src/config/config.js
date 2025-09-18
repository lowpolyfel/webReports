export const config = {
  port: parseInt(process.env.PORT || '4000', 10),
  db: {
    host: process.env.DB_HOST || '127.0.0.1',
    port: parseInt(process.env.DB_PORT || '3306', 10),
    user: process.env.DB_USER || 'fel',
    password: process.env.DB_PASSWORD || 'feli123',
    database: process.env.DB_NAME || 'bd_test'
  },
  cors: {
    origin: process.env.WEB_ORIGIN || 'http://localhost:5173'
  }
};
