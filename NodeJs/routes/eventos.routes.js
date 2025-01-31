import express from 'express';
import { obtenerEventos, crearEvento } from '../controllers/eventos.controller.js';

const router = express.Router();

router.get('/', obtenerEventos);
router.post('/', crearEvento);

export default router;
