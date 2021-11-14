# syntax=docker/dockerfile:1

FROM openjdk:8 
WORKDIR /app/
COPY --from=builder /app/ /app/
CMD ["java", "-jar", "target/*.jar"]
