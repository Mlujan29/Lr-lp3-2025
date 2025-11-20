# Dockerización Spring Boot con MySQL

Este proyecto es una adaptación del template de LP3 para utilizar persistencia de datos en **MySQL**.

> **Nota:** Se ha migrado la base de datos original (H2) a MySQL Server 8.

## Ejecución con Docker Compose

Este proyecto incluye configuración para ejecutarse en contenedores Docker, orquestando la aplicación y la base de datos automáticamente.

### Requisitos

* Docker y Docker Compose instalados.

### Paso a Paso

1. **Configurar credenciales:**
Crear un archivo ```.env``` en la raíz del proyecto tomando como base el ejemplo:
```bash
cp env.sample .env
```

(El archivo .env está configurado con credenciales por defecto, puedes cambiarlas por seguridad).

2. **Iniciar la aplicación:**
Ejecutar el siguiente comando para construir y levantar los servicios:
```bash
docker compose up --build
```

3. **Acceso:**

* **API Spring Boot:** Disponible en ```http://localhost:8081/api/lp3/persona/``` (Note el puerto 8081).

* **Base de Datos:** Accesible desde el host en el puerto **3307.**

4. **Detener:**
Para apagar los contenedores:
```bash
docker compose down
```