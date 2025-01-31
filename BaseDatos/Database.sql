-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS EventosDB;
USE EventosDB;

-- Tabla de Usuarios (Registro)
CREATE TABLE IF NOT EXISTS Registro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);

-- Tabla de Categorías (Opcional, pero útil para escalabilidad)
CREATE TABLE IF NOT EXISTS Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Eventos
CREATE TABLE IF NOT EXISTS Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    usuario_id INT,
    categoria_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Registro(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id) ON DELETE SET NULL
);

-- Insertar Usuarios de Prueba
INSERT INTO Registro (nombre, apellido, email, contraseña) VALUES
('Juan', 'Pérez', 'juan@example.com', '123456'),
('María', 'González', 'maria@example.com', '123456'),
('Carlos', 'López', 'carlos@example.com', '123456'),
('Ana', 'Torres', 'ana@example.com', '123456'),
('Pedro', 'Ramírez', 'pedro@example.com', '123456');

-- Insertar Categorías de Prueba
INSERT INTO Categorias (nombre) VALUES
('Tecnología'),
('Salud'),
('Negocios'),
('Educación'),
('Ciencia');

-- Insertar Eventos de Prueba
INSERT INTO Eventos (titulo, descripcion, fecha, hora, ubicacion, usuario_id, categoria_id) VALUES
('Conferencia de IA', 'Charla sobre inteligencia artificial', '2025-03-01', '15:00', 'Sala 2', 1, 1),
('Workshop de Programación', 'Aprende sobre Angular y Node.js', '2025-04-10', '10:00', 'Auditorio', 2, 1),
('Taller de Machine Learning', 'Explora modelos de aprendizaje automático con Python y TensorFlow.', '2025-07-15', '14:00', 'Sala de Innovación', 3, 2),
('Congreso de Biotecnología', 'Descubre los últimos avances en biotecnología aplicada.', '2025-09-05', '09:30', 'Centro de Convenciones', 4, 5),
('Seminario de Liderazgo', 'Aprende sobre liderazgo y gestión empresarial.', '2025-11-20', '18:00', 'Salón de Conferencias', 5, 3);

-- USE eventosdb;
-- Consulta que permita obtener todos los eventos ocurridos en una fecha determinada
-- SELECT * 
-- FROM Eventos 
-- WHERE fecha = '2025-11-20';

