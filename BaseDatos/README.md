# Base de Datos

Este directorio contiene los scripts SQL necesarios para inicializar la base de datos del proyecto y poblarla con datos de ejemplo.

## Archivos incluidos

- **`basedatos.sql`**:  
  Contiene instrucciones para:
  - Crear la base de datos `EventosDB`.
  - Crear las tablas `Registro`, `Categorias` y `Eventos`.
  - Insertar registros de prueba para usuarios, categorías y eventos.

## Cómo utilizar este script

1. **Asegúrate de tener acceso a una base de datos MySQL**.  
   Si no tienes una instalación de MySQL, consulta la [documentación oficial](https://dev.mysql.com/doc/) para configurarla.

2. **Ejecuta el script SQL**.  
   - Abre un cliente MySQL (por ejemplo, MySQL Workbench o la línea de comandos).
   - Conéctate a tu servidor de base de datos.
   - Carga el archivo `basedatos.sql`:
     ```bash
     mysql -u tu_usuario -p < basedatos.sql
     ```
   - O pégalo directamente en tu cliente y ejecútalo línea por línea.

3. **Verifica la base de datos**.  
   - Confirma que la base de datos `EventosDB` fue creada correctamente.
   - Asegúrate de que las tablas `Registro`, `Categorias` y `Eventos` están disponibles y que contienen los datos de ejemplo.

Con este README, quien abra la carpeta `basedatos` sabrá qué hace el archivo y cómo usarlo.


-- USE eventosdb;
-- Consulta que permita obtener todos los eventos ocurridos en una fecha determinada
-- SELECT * 
-- FROM Eventos 
-- WHERE fecha = '2025-11-20';



ESTE README SOLO ES SI LO QUIERE HACER MANUAL, DE CASO CONTRARIO Y QUIERE QUE SE CREE TODO AUTOMATICO, VEA EL README DE /NODEJS 