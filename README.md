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


### Pruebas Manuales (Ejemplos CURL)

Una vez iniciados los contenedores, puedes utilizar estos comandos en tu terminal para cargar datos y verificar que la API funciona correctamente.

1. **Cargar una nueva Persona (POST)**
Este comando inserta un registro en la base de datos MySQL a través de la API.

```bash
curl -X POST http://localhost:8081/api/lp3/persona \
     -H "Content-Type: application/json" \
     -d '{
           "nombre": "Ana",
           "apellido": "Gomez",
           "edad": 25,
           "numeroCedula": 4567890,
           "sexo": "F"
         }'
```

2. **Consultar todas las Personas (GET)**
Este comando recupera la lista completa de personas guardadas.

```bash
curl -v http://localhost:8081/api/lp3/persona/
```
#### Salida esperada (ejemplo)

``` JSON
[{"id":1,"nombre":"Ana","sexo":"F","apellido":"Gomez","edad":25,"numeroCedula":4567890}]
```

2. **Consultar una persona por ID (GET)**
Reemplaza el 1 al final de la URL por el ID que quieras buscar.

```bash
curl -v http://localhost:8081/api/lp3/persona/1
```

### Para detener
Para apagar los contenedores:
```bash
docker compose down
```