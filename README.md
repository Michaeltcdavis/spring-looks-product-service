# Spring Looks Product Service

A RESTful microservice for managing product catalog data for the Spring Looks e-commerce platform.

## Table of Contents
- [Project Description](#project-description)
- [Architecture](#architecture)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [Dependencies](#dependencies)
- [API Endpoints](#api-endpoints)
- [Configuration](#configuration)
- [Demo](#demo)

## Project Description

The Product Service is a Spring Boot microservice that provides a REST API for managing clothing items in the Spring Looks online store. It offers full CRUD operations for product management and uses MongoDB for data persistence. The service includes comprehensive API documentation via Swagger/OpenAPI and follows modern Spring Boot best practices.

## Architecture
```
Client → API Gateway (Port 9000) → Microservices
├── Product Service (Port 8080)
├── Order Service (Port 8081)
└── Inventory Service (Port 8082)
```

See spring-looks-api-gateway for details.

## Features

- **Product Management**: Create and retrieve clothing products
- **MongoDB Integration**: Persistent storage using MongoDB
- **REST API**: RESTful endpoints for product operations
- **API Documentation**: Interactive Swagger UI for API exploration
- **Containerized Database**: Docker-based MongoDB setup
- **Testing Support**: Comprehensive testing with Testcontainers

## Prerequisites

- Java 21 or higher
- Maven 3.6+
- Docker and Docker Compose
- MongoDB (via Docker)

## Project Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd product-service
```

### 2. Start MongoDB using Docker Compose
```bash
docker-compose up -d
```

### 3. Run the Application
```bash
./mvnw spring-boot:run
```

The application will start on `http://localhost:8080`

### 4. Access API Documentation
- Swagger UI: `http://localhost:8080/swagger-ui.html`
- OpenAPI Docs: `http://localhost:8080/api-docs`

## Dependencies

### Core Dependencies
- **Spring Boot 3.4.5**: Framework foundation
- **Spring Boot Web**: REST API capabilities
- **Spring Data MongoDB**: MongoDB integration
- **Java 21**: Runtime environment

### Documentation
- **SpringDoc OpenAPI**: API documentation and Swagger UI

### Development Tools
- **Lombok**: Reduce boilerplate code
- **Maven Wrapper**: Build tool

### Testing
- **Spring Boot Test**: Testing framework
- **Testcontainers**: Integration testing with MongoDB
- **Rest Assured**: API testing

## API Endpoints

### Base URL
```
http://localhost:8080/api/product
```

### Endpoints

| Method | Endpoint | Description | Response |
|--------|----------|-------------|----------|
| `POST` | `/api/product` | Create a new product | `201 Created` |
| `GET` | `/api/product` | Retrieve all products | `200 OK` |

### Product Model
```json
{
  "id": "string",
  "name": "string",
  "description": "string", 
  "price": "decimal"
}
```

### Example Requests

#### Create Product
```bash
curl -X POST http://localhost:8080/api/product \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Spring Looks T-Shirt",
    "description": "Comfortable cotton t-shirt",
    "price": 29.99
  }'
```

#### Get All Products
```bash
curl -X GET http://localhost:8080/api/product
```

## Configuration

### MongoDB Configuration
The application connects to MongoDB using the configuration in `application.properties`:

```properties
spring.data.mongodb.uri=mongodb://root:${MONGO_PASSWORD}@localhost:27017/product-service?authSource=admin
springdoc.swagger-ui.path=/swagger-ui.html
springdoc.api-docs.path=/api-docs
```

### Docker MongoDB Setup
MongoDB runs in a Docker container with:
- **Port**: 27017
- **Username**: root
- **Password**: Configured in `docker-compose.yml` (see file for details)
- **Database**: product-service

> **Security Note**: For production environments, use environment variables or external configuration management for database credentials. Never commit passwords to version control.

## Demo

### Quick Start Demo

1. **Start the services**:
   Make sure the Docker Daemon is running, then execute:
   ```bash
   docker-compose up -d
   ./mvnw spring-boot:run
   ```

2. **Create a sample product**:
   ```bash
   curl -X POST http://localhost:8080/api/product \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Designer Jeans",
       "description": "Premium denim jeans with modern fit",
       "price": 89.99
     }'
   ```

3. **Retrieve all products**:
   ```bash
   curl http://localhost:8080/api/product
   ```

4. **Explore API interactively**:
   Visit `http://localhost:8080/swagger-ui.html` to use the Swagger UI for testing endpoints.

### Testing
Run the test suite:
```bash
./mvnw test
```

The tests include integration tests using Testcontainers to ensure the application works correctly with a real MongoDB instance.
