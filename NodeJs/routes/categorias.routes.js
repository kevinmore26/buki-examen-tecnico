import express from 'express';
import { obtenerCategorias, crearCategoria } from '../controllers/categorias.controller.js';

const router = express.Router();

router.get('/', obtenerCategorias);
router.post('/', crearCategoria);

export default router; // 💡 🔥 Esto soluciona el error
