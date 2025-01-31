import { db } from '../models/db.js';

export const obtenerCategorias = (req, res) => {
    db.query('SELECT * FROM categorias', (err, results) => {
        if (err) {
            console.error('❌ Error obteniendo categorías:', err);
            return res.status(500).json({ error: 'Error en la base de datos' });
        }
        res.json(results);
    });
};

export const crearCategoria = (req, res) => {
    const { nombre } = req.body;

    if (!nombre) {
        return res.status(400).json({ error: 'El nombre de la categoría es obligatorio' });
    }

    const query = 'INSERT INTO categorias (nombre) VALUES (?)';
    db.query(query, [nombre], (err, result) => {
        if (err) {
            console.error('❌ Error creando categoría:', err);
            return res.status(500).json({ error: 'Error en la base de datos' });
        }
        res.status(201).json({ message: 'Categoría creada', categoriaId: result.insertId });
    });
};
