# Stage 1: Build
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-alpine

# Install 'useradd' in the runtime image
RUN apk --no-cache add shadow  # shadow includes useradd command

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy the built JAR file from the build stage
# COPY --from=build /app/target/demo.jar /app/demo.jar
COPY --from=build /app/target/blog-0.0.1-SNAPSHOT.jar app.jar
# Expose the application port
EXPOSE 8080
# Set the entry point to run the JAR
# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "/app/app.jar"]



# FROM openjdk:17-jdk-alpine
# VOLUME /tmp
# COPY target/blog-0.0.1-SNAPSHOT.jar app.jar
# ENTRYPOINT ["java", "-jar", "/app.jar"]
