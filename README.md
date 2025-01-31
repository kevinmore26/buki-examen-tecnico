ReadMe General - Sistema de Gestión de Eventos
Este sistema permite gestionar eventos a través de un backend en Node.js, una interfaz web en Angular y una aplicación móvil en Flutter. A continuación, encontrarás instrucciones para configurar cada componente y hacerlos trabajar juntos.

PUEDE LEER EL README DE CADA CARPETA SI ES NECESARIO

📌 Requisitos Generales
Node.js v16 o superior.
MySQL instalado y corriendo.
Angular CLI y Flutter SDK instalados y configurados.
Conexión a internet para instalar dependencias.
📌 Backend - Eventos API
El backend proporciona una API RESTful para manejar usuarios, categorías y eventos.

Configuración inicial:

Crea un archivo .env en la carpeta NodeJs/ con los datos de conexión a la base de datos.
Instala dependencias con:
    
npm install
Inicializar la base de datos:

Opcional, ejecuta:
    
npm run init-db
Esto ejecutará el script BaseDatos/Database.sql.
Lo QUE HACE ESTE SCRIPT ES CREAR SU BD EN BASE A LAS CREDENCIALES QUE DIO EN EL .env CREARÁ LA BD Y LAS TABLAS NECESARIAS PARA FACILITAR LA PRUEBA

Iniciar el servidor:


npm start


Por defecto, el servidor correrá en http://localhost:3000.

📌 Frontend Web - Angular Eventos
La interfaz web permite listar y visualizar eventos en tarjetas organizadas en un diseño tipo rejilla.

Instalar dependencias:

    
cd Angular/angular-eventos
npm install
Ejecutar la aplicación:
    
ng serve


Abre http://localhost:4200 en tu navegador para ver la aplicación.

📌 Aplicación Móvil - Flutter Eventos
La aplicación móvil permite registrar eventos .


Instalar dependencias de Flutter:

    
cd Flutter/flutter-eventos
flutter pub get
Ejecutar la aplicación:

    
flutter run


Este comando iniciará la aplicación en un dispositivo conectado o un emulador.

📌 Notas Finales
Conexión Backend-Frontend: Asegúrate de que el backend esté corriendo antes de usar la aplicación web o móvil.
Pruebas: Usa herramientas como Postman para verificar los endpoints de la API antes de integrar con el frontend.
Mejoras: Puedes personalizar el diseño o agregar más validaciones según las necesidades del proyecto.