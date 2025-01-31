import { db } from "../models/db.js";

export const obtenerEventos = (req, res) => {
  db.query("SELECT * FROM eventos", (err, results) => {
    if (err) {
      console.error("❌ Error obteniendo eventos:", err);
      return res.status(500).json({ error: "Error en la base de datos" });
    }
    res.json(results);
  });
};

export const crearEvento = (req, res) => {
  let {
    titulo,
    descripcion,
    fecha,
    hora,
    ubicacion,
    usuario_id,
    categoria_id,
  } = req.body;

  if (!titulo || !descripcion || !fecha) {
    return res.status(400).json({ error: "Faltan campos obligatorios" });
  }

  // Asignamos valores por defecto si no vienen en la petición
  hora = hora || "00:00:00";
  ubicacion = ubicacion || "Ubicación no especificada";
  usuario_id = usuario_id || 1; // Asignar un usuario por defecto (ejemplo: admin)
  categoria_id = categoria_id || null; // Permitir eventos sin categoría

  // Insertar evento en la base de datos
  const query =
    "INSERT INTO eventos (titulo, descripcion, fecha, hora, ubicacion, usuario_id, categoria_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
  db.query(
    query,
    [titulo, descripcion, fecha, hora, ubicacion, usuario_id, categoria_id],
    (err, result) => {
      if (err) {
        console.error("Error insertando evento:", err);
        return res.status(500).json({ error: "Error en la base de datos" });
      }
      res
        .status(201)
        .json({ message: "Evento registrado", eventoId: result.insertId });
    }
  );
};
