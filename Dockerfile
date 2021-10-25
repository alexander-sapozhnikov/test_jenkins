# syntax=docker/dockerfile:1
FROM maven:3.8.2-jdk-8 AS builder
WORKDIR /app/
COPY . /app/
RUN mvn install

FROM openjdk:8 
WORKDIR /app/
COPY --from=builder /app/ /app/
CMD ["java", "-jar", "target/*.jar"]