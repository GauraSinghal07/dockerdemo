# Stage 1: Build
FROM maven:3.8.4-jdk-17 AS build
WORKDIR /app
COPY . .  # Copy the entire project to the container
RUN mvn clean package -DskipTests  # Build the project without running tests

# Stage 2: Run
FROM openjdk:17-jdk-slim  # Use slim version of Java 17

# Security best practice: Create a non-root user for running the application
RUN useradd -ms /bin/bash appuser
USER appuser

# Copy the built JAR file from the build stage
# COPY --from=build /app/target/demo.jar /app/demo.jar
COPY target/blog-0.0.1-SNAPSHOT.jar app.jar

# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]



# FROM openjdk:17-jdk-alpine
# VOLUME /tmp
# COPY target/blog-0.0.1-SNAPSHOT.jar app.jar
# ENTRYPOINT ["java", "-jar", "/app.jar"]
