# Build
FROM eclipse-temurin:21-jdk as builder

WORKDIR /app

COPY mvnw .
COPY mvnw.cmd .
COPY pom.xml .
COPY .mvn .mvn

## Download dependencies (for better layer caching)
RUN chmod +x ./mvnw && ./mvnw dependency:go-offline -B

COPY src ./src

RUN ./mvnw clean package -DskipTests

# Run
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=builder /app/target/product_service-*.jar app.jar

# Non-root user for security
RUN groupadd -r springlooks && useradd -r -g springlooks springlooksUser && \
    chown -R springlooksUser:springlooks /app

USER springlooksUser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
