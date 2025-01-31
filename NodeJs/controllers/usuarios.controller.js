import { db } from '../models/db.js';

export const obtenerUsuarios = (req, res) => {
    db.query('SELECT * FROM registro', (err, results) => {
        if (err) {
            console.error('❌ Error obteniendo usuarios:', err);
            return res.status(500).json({ error: 'Error en la base de datos' });
        }
        res.json(results);
    });
};

export const registrarUsuario = (req, res) => {
    const { nombre, apellido, email, contraseña } = req.body;

    if (!nombre || !apellido || !email || !contraseña) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const query = 'INSERT INTO registro (nombre, apellido, email, contraseña) VALUES (?, ?, ?, ?)';
    db.query(query, [nombre, apellido, email, contraseña], (err, result) => {
        if (err) {
            console.error('❌ Error registrando usuario:', err);
            return res.status(500).json({ error: 'Error en la base de datos' });
        }
        res.status(201).json({ message: 'Usuario registrado', userId: result.insertId });
    });
};
