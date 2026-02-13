# Étape 1 : Build (facultatif si Jenkins a déjà fait le mvn package, mais plus propre)
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape 2 : Production (Runtime) - C'est ici que ça bloquait
FROM eclipse-temurin:21-jre
WORKDIR /app
# On récupère le JAR généré à l'étape précédente
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]