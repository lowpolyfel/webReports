export const config = {
    port: parseInt(process.env.PORT || '4000', 10),
    db: {
          host: process.env.BD_HOST || '127.0.0.1',
          port: parseInt(process.env.BD_PUERTO || '3306', 10),
          user: process.env.BD_USUARIO || 'fel',
          password: process.env.BD_CONTRASENA || 'feli123',
          database: process.env.BD_NOMBRE || 'wb_db'
        },
    cors: {
          origin: process.env.WEB_ORIGIN || 'http://localhost:5173'
        }
};

