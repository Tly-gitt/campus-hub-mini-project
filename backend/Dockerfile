# Stage 1: Build Spring Boot application
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

# Copy Gradle Wrapper and build configuration
COPY gradlew ./
COPY gradle ./gradle
COPY build.gradle ./
COPY settings.gradle ./

# Normalize Windows line endings and grant execute permission
RUN sed -i 's/\r$//' gradlew && chmod +x gradlew

# Copy application source
COPY src ./src

# Build executable Spring Boot JAR
RUN ./gradlew bootJar --no-daemon

# Stage 2: Run application
FROM eclipse-temurin:21-jre

WORKDIR /app

RUN useradd --system --uid 10001 appuser

COPY --from=build --chown=appuser:appuser /app/build/libs/*.jar /app/app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]