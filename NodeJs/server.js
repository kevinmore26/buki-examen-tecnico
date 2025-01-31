import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import eventosRoutes from './routes/eventos.routes.js';
import usuariosRoutes from './routes/usuarios.routes.js';
import categoriasRoutes from './routes/categorias.routes.js';
import { db } from './models/db.js';

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

// Rutas
app.use('/eventos', eventosRoutes);
app.use('/usuarios', usuariosRoutes);
app.use('/categorias', categoriasRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});
