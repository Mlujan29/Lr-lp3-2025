# ETAPA 1: Construcción (Build)
# Llamamos a esta etapa "build" para referenciarla después
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Ejecución (Run)
# Aquí NO ponemos "AS build", solo usamos la imagen limpia
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
# Aquí le decimos: "Trae el archivo jar DESDE la etapa 'build'"
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]