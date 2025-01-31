import mysql from 'mysql2';
import fs from 'fs';
import dotenv from 'dotenv';

dotenv.config();

// Configurar conexión a MySQL
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    multipleStatements: true // Para ejecutar múltiples queries
});

// Leer el archivo SQL
const schemaSQL = fs.readFileSync('../BaseDatos/Database.sql', 'utf8');

// Ejecutar el script SQL
db.query(schemaSQL, (err, results) => {
    if (err) {
        console.error('❌ Error al ejecutar el script SQL:', err);
    } else {
        console.log('✅ Base de datos inicializada correctamente.');
    }
    db.end();
});
