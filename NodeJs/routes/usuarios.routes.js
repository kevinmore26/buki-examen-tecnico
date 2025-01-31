import express from 'express';
import { obtenerUsuarios, registrarUsuario } from '../controllers/usuarios.controller.js';

const router = express.Router();

router.get('/', obtenerUsuarios);
router.post('/', registrarUsuario);

export default router;
