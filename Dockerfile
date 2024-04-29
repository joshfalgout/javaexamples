# Use a Maven base image to build the project
FROM maven:3.8.5-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project descriptor
COPY pom.xml .

# Fetch dependencies (not including the source code)
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Build a shaded JAR using Maven
RUN mvn package shade:shade

# Use a lightweight base image to create the final image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the shaded JAR from the builder stage
COPY --from=builder /app/target/my-shaded-app-1.0-SNAPSHOT.jar .

# Command to run the JAR
CMD ["java", "-jar", "my-shaded-app-1.0-SNAPSHOT.jar"]
