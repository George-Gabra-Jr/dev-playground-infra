# Scalable Microservices Platform

<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/256/6629/6629701.png"/>
</p>

A modern, scalable, and flexible microservices-based application architecture designed for real-time capabilities, persistence, and observability.

## Table of Contents

- [Introduction](#introduction)
- [Architecture Overview](#architecture-overview)
- [Key Principles](#key-principles)
- [Layered Architecture](#layered-architecture)
  - [Ingress Layer](#ingress-layer)
  - [API Gateway Layer](#api-gateway-layer)
  - [Messaging Layer](#messaging-layer)
  - [Identity Layer](#identity-layer)
  - [Core Layer](#core-layer)
  - [Data Layer](#data-layer)
  - [Storage Layer](#storage-layer)
  - [Observability Layer](#observability-layer)
  - [Pipelines Layer](#pipelines-layer)
  - [Infrastructure Layer](#infrastructure-layer)
- [Service Discovery](#service-discovery)
- [To-Do List](#to-do-list)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

This platform implements a multi-layered architecture for microservices-based systems, focusing on clean, scalable, and organized communication between services. It ensures real-time capabilities, persistence, and observability, making it suitable for modern applications requiring high responsiveness and scalability.

## Architecture Overview

The architecture comprises several layers, each responsible for specific functionalities:

- **Ingress Layer**: Traefik
- **API Gateway Layer**: Resgate
- **Messaging Layer**: NATS
- **Identity Layer**: Keycloak
- **Core Layer**: Microservices and Frontend Services
- **Data Layer**: PostgreSQL, KeyDB
- **Storage Layer**: Longhorn, CSI
- **Observability Layer**: Grafana, Loki, Mimir, Tempo, Netdata
- **Pipelines Layer**: Jenkins, SonarQube, Portainer, Docker Registry
- **Infrastructure Layer**: Ubuntu, Docker, Docker Swarm

## Key Principles

The platform is built upon the following principles:

- **Microservices**: Each service is independently deployable and scalable, promoting modularity and ease of maintenance.
- **API-First**: Services communicate via well-defined APIs, ensuring consistency and decoupling between services.
- **Cloud-Native**: Optimized for containers and distributed systems, leveraging container orchestration for scalability.
- **Headless**: Frontend is decoupled from backend services, allowing flexibility in frontend technologies.
- **12-Factor App Principles**: Adheres to best practices for building scalable and maintainable applications, including stateless processes and externalized configurations.

## Layered Architecture

### Ingress Layer

**Tool**: Traefik

- Acts as the entry point for all incoming requests.
- Applies middleware features such as:
  - **Rate Limiting**: Controls the rate of incoming requests.
  - **Retries**: Automatically retries failed requests.
  - **Compression**: Compresses responses to optimize bandwidth.
  - **Body Size Limits**: Restricts the size of incoming request bodies.
  - **Circuit Breaker**: Prevents cascading failures by temporarily halting requests to a service that is experiencing issues.

### API Gateway Layer

**Tool**: Resgate

- Manages real-time API requests using the RES protocol.
- Enables clients to subscribe to resources and receive live updates.
- Simplifies API management and enhances real-time interactions.

### Messaging Layer

**Tool**: NATS

- Provides event-driven, asynchronous communication between services.
- Ensures decoupled interactions, promoting scalability and resilience.
- Acts as the messaging backbone for the system.

### Identity Layer

**Tool**: Keycloak

- Offers identity federation and authentication services.
- Supports single sign-on (SSO), LDAP integration, and social login.
- Manages users, roles, and permissions across the platform.

### Core Layer

**Components**:

- **Microservices**: Develop using whatever language or framework you prefer
  - Contains the business logic and functionalities.
  - Each microservice communicates through NATS for real-time updates.
- **Frontend Services**: Decoupled from backend, allowing independent development.

### Data Layer

**Tools**:

- **PostgreSQL**: Relational database for structured data.
- **KeyDB**: High-performance, Redis-compatible key-value store.

### Storage Layer

**Tools**:

- **Longhorn**: Cloud-native distributed block storage for Kubernetes.
  - Provides centralized network storage for volumes.
- **CSI (Container Storage Interface)**: Abstracts persistent storage for containers.
  - Separates persistence from containers and host machines.

### Observability Layer

**Tools**:

- **Grafana LGTM Stack**
  - **Grafana**: Visualization and dashboarding.
  - **Loki**: Log aggregation system.
  - **Mimir**: Scalable metrics store.
  - **Tempo**: Distributed tracing backend.
  - Provides comprehensive monitoring, logging, metrics, and tracing.
  - Ensures system health, performance optimization, and troubleshooting capabilities.

- **Netdata**: Real-time performance monitoring.

### Pipelines Layer

**Tools**:

- **Jenkins**: Automation server for building and deploying applications.
  - Automates the build, test, and deployment processes.
  - Facilitates continuous integration and continuous delivery pipelines.
- **SonarQube**: Continuous inspection of code quality.
- **Portainer**: Simplifies container management.
- **Docker Registry**: Stores and distributes Docker images.

### Infrastructure Layer

**Tools**:

- **Ubuntu**: The setup script for the host OS is detailed in `setup/setup.md`.
- **Docker**: Containerization platform.
- **Docker Swarm**: Native clustering and orchestration for Docker containers.
  - Handles container orchestration and resource management.
  - Ensures high availability and scalability of services.

## Service Discovery

- **Docker Swarm Networks with Aliases**:
  - Services communicate across layers using aliases.
  - Eliminates the need for hardcoding IP addresses.
  - Facilitates flexibility and ease of scaling.

- **NATS for Core Layer**:
  - Enables asynchronous, event-driven communication.
  - Services discover each other dynamically through events.

## To-Do List

- [ ] Convert `setup.md` into a script
  - [ ] Rewrite the existing setup instructions as a bash script runnable from the terminal.

- [ ] Write a CLI tool to configure the server running parts or all of the stack and reconfiguring it accordingly.
  - [ ] Implement both headless and interactive modes for automated or manual configuration.
  - [ ] In headless mode, require a configuration file to provide necessary setup parameters.

- [ ] Implement Terraform setup for automation
  - [ ] Use Terraform to define and provision infrastructure resources like VMs, networks, and storage.
  - [ ] Create Terraform configuration files to specify desired infrastructure state.
  - [ ] Apply configurations using Terraform commands to automate resource provisioning.

- [ ] Explore Docker secrets/configs for secure and distributed secret and config management
  - [ ] Investigate Docker secrets/configs to securely store sensitive information (API keys, passwords, certificates).
  - [ ] Learn to create and manage Docker secrets/configs.
  - [ ] Update Docker Compose or Docker Swarm configurations to utilize secrets/configs instead of hardcoding sensitive data.

- [ ] Address the vulnerability of connecting the host Docker socket to multiple services, including Jenkins
  - [ ] Find solutions to mitigate security risks associated with sharing the Docker socket between services.
  - [ ] Research best practices for securely connecting Docker engine to Jenkins for building and testing applications.

- [ ] Explore external services for centralized network storage
  - [ ] Investigate external services that provide centralized network storage for volumes.
  - [ ] Evaluate options like Longhorn for separating persistence from containers and host machines.

- [ ] Explore Loki logging driver for Docker and send logs to the observability stack
  - [ ] Research the Loki logging driver for Docker and its integration with the observability stack.
  - [ ] Configure and use the Loki logging driver to send container logs to the stack for centralized log management.

- [ ] Create the infrastructure and application layers of the application, including the following components:
  - [ ] API Gateway: Explore resgate as an API gateway enabling async multicast connection.
  - [ ] Message Broker: Utilize NATS as the messaging system for reliable, scalable communication.
  - [x] Caching Layer: Implement KeyDB or an open-source alternative for caching data.
  - [x] Database: Use PostgreSQL for storing and retrieving application data.
  - [ ] Storage Interface: Leverage Longhorn for handling storage requirements.
  - [ ] Identity Federation: Integrate Keycloak to manage authentication and authorization.

- [ ] Add Souin HTTP cache middleware to Traefik

## Contributing

To contribute to the project, follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Commit your changes.
5. Push to the branch.
6. Open a pull request.

## License

This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions, suggestions, or support, please contact:

- **Email**: [george.ayad@icloud.com](mailto:george.ayad@icloud.com)
