FROM gradle:8.10.2-jdk21 AS builder
WORKDIR /src
COPY . .
RUN gradle clean bootJar

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /src/build/libs/*-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
