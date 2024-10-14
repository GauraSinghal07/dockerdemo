# Project Overview

This project sets up a Spring Boot application with an embedded H2 database and Redis for caching, using Docker Compose to orchestrate the services.

## Prerequisites

- Docker
- Docker Compose

## Services

- **Web**: Spring Boot application
    - Port: `8080`
    - Uses H2 as an in-memory database and Redis for caching.
    - Access the H2 console at `http://localhost:8080/h2-console` once the app is running.

- **Redis**: Cache server
    - Port: `6379`

- **H2 Database**: Standalone H2 database server (optional, for external management)
    - Port: `8081` for API, `8082` for web console (can be adjusted if needed).

## How to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
2. Build and start the services using Docker Compose:
   docker-compose up --build
3. Access the Spring Boot application at:
   http://localhost:8080

## Stopping the service
- To stop the running services, use:
  docker-compose down

