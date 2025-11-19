# Guía de Configuración: Proyecto Spring Boot con MySQL

Este proyecto utiliza Spring Boot con Maven y requiere una conexión a MySQL para su ejecución.

---

## 1. Requisitos del Sistema

Asegúrate de tener instalado el siguiente software en tu entorno local:

| Requisito | Versión Mínima | Notas |
| :--- | :--- | :--- |
| **Java Development Kit (JDK)** | 17 o superior | Necesario para compilar y ejecutar el proyecto Spring Boot. |
| **MySQL Server** | 8.0 o superior | La base de datos persistente requerida. |
| **Maven** | 3.6 o superior | (Generalmente incluido en IntelliJ IDEA). |

---
## 2. Puesta en Marcha (Conexión a MySQL)

Para ejecutar la aplicación, es necesario configurar la base de datos y el usuario con las credenciales que usará Spring Boot.

### 2.1. Configuración de la Base de Datos y el Usuario

Accede a tu consola de MySQL (usando `sudo mysql` en la terminal si estás en Ubuntu) y ejecuta los siguientes comandos:

#### A. Creación de la Base de Datos

```sql
-- Crea la base de datos vacía
CREATE DATABASE lp3_db;    #nombre de ejemplo
```
#### B. Creación del Usuario de la Aplicación
Creamos el usuario `proyecto_user` con una contraseña, y le otorgamos permisos exclusivos sobre la base de datos lp3_db.
```sql
-- 1. Crear el usuario (reemplaza 'TU_CONTRASEÑA_LOCAL' por una contraseña segura)
CREATE USER 'proyecto_user'@'localhost' IDENTIFIED BY 'TU_CONTRASEÑA_LOCAL';    #nombre y contraseñas de ejemplo

-- 2. Otorgar permisos al nuevo usuario
GRANT ALL PRIVILEGES ON lp3_db.* TO 'proyecto_user'@'localhost';

-- 3. Aplicar los cambios y salir
FLUSH PRIVILEGES;
EXIT;
```
### 2.2. Configuración del Proyecto (Credenciales)
Para que la aplicación pueda conectar, debes configurar las credenciales en el archivo local de configuración:

  1. Modifica la plantilla: El repositorio contiene el archivo `application.properties.template`. En tu carpeta debes renombrarlo a `application.properties`. (Este paso es crucial para que el archivo pueda ejecutarse).
  
  2. Añade las credenciales: Abre el nuevo archivo application.properties y reemplaza `spring.datasource.username=NOMBRE_DE_USUARIO` y `spring.datasource.password=AQUI_VA_TU_CONTRASEÑA_LOCAL` con el nombre de usuario y contraseña que creaste en el paso anterior.   (En este caso `proyecto_user` y su contraseña)

---
## 3. Ejecución del Proyecto
- Desde IntelliJ IDEA (Recomendado)
  1. Abre el proyecto en IntelliJ.

  2. Espera a que Maven descargue todas las dependencias.

  3. Ejecuta la clase principal ([Nombre del Proyecto]Application.java) haciendo clic en el botón de "Play".
---
####  Nota: Si la aplicación inicia correctamente sin errores en la consola (buscando el mensaje Started [Nombre de tu App] in X seconds), la conexión a MySQL es exitosa.
