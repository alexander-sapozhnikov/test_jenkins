# syntax=docker/dockerfile:1

FROM openjdk:8 
WORKDIR /app/
COPY /spring-petclinic/target /app/
CMD ["java", "-jar", "target/*.jar"]
