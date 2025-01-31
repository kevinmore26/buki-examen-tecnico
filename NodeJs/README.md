# 🚀 Backend - Eventos API

Este es el backend del sistema de gestión de eventos, construido con **Node.js**, **Express** y **MySQL**. Sigue los pasos a continuación para configurarlo correctamente en tu entorno local.

---

## 📌 1️⃣ Configurar Variables de Entorno

Antes de iniciar, necesitas crear un archivo **`.env`** en la carpeta `NodeJs/` con la configuración de la base de datos:

```ini
# Configuración de la base de datos
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=EventosDB
PORT=3000
```

✍ **Asegúrate de reemplazar `tu_contraseña` con la contraseña de tu MySQL.**

---

## 📌 2️⃣ Instalar Dependencias

Abre la terminal en la carpeta `NodeJs/` y ejecuta:

```sh
npm install
```

Esto instalará todas las dependencias necesarias.

---

## 📌 3️⃣ Inicializar la Base de Datos (Opcional)

Si es la primera vez que configuras el proyecto, ejecuta este comando para crear las tablas y agregar datos de prueba:

```sh
npm run init-db
```

🔹 **Esto ejecutará el script `BaseDatos/Database.sql`, creando la estructura de la BD.**

---

## 📌 4️⃣ Iniciar el Servidor

Después de configurar todo, inicia el servidor con:

```sh
npm start
```

Si todo está bien, verás algo como esto en la terminal:

```sh
🚀 Servidor corriendo en http://localhost:3000
✅ Conectado a la base de datos MySQL
```

---

## 📌 5️⃣ Probar la API en Postman

Puedes probar la API en **Postman** o en el navegador. Aquí tienes algunos endpoints:

### **Usuarios (Registro)**
- **Obtener usuarios:** `GET http://localhost:3000/usuarios`
- **Registrar usuario:** `POST http://localhost:3000/usuarios`
  ```json
  {
    "nombre": "Juan",
    "apellido": "Pérez",
    "email": "juan@example.com",
    "contraseña": "123456"
  }
  ```

### **Categorías**
- **Obtener categorías:** `GET http://localhost:3000/categorias`
- **Crear categoría:** `POST http://localhost:3000/categorias`
  ```json
  {
    "nombre": "Tecnología"
  }
  ```

### **Eventos**
- **Obtener eventos:** `GET http://localhost:3000/eventos`
- **Crear evento:** `POST http://localhost:3000/eventos`
  ```json
  {
    "titulo": "Conferencia de IA",
    "descripcion": "Charla sobre inteligencia artificial",
    "fecha": "2025-03-01",
    "hora": "15:00",
    "ubicacion": "Sala 2",
    "usuario_id": 1,
    "categoria_id": 1
  }
  ```

---

## 📌 6️⃣ Notas Finales

✅ **Si obtienes un error de conexión a MySQL**, verifica que los valores en `.env` sean correctos.  
✅ **Si los datos de prueba no aparecen, revisa `BaseDatos/Database.sql` y ejecútalo de nuevo con `npm run init-db`.**

🚀 **¡Listo! Ahora tu backend está funcionando y puedes conectarlo con el frontend.** 😃
