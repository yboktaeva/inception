
# **Inception**

## **Description**

The `Inception` project is part of the 42 School curriculum, focusing on DevOps practices. The goal is to build a multi-service application using Docker containers orchestrated with Docker Compose. The project introduces essential concepts of containerization, networking, and persistent storage.

---

## **Docker Setup**

### **Version**
The project uses **Docker Compose version 3.9** for defining the multi-service architecture.

### **Networks**
A custom Docker network named `inception` (driver: bridge) is configured to allow communication between the services.

### **Services**
The project defines the following services in the `docker-compose.yml` file:

1. **Nginx**
   - Acts as the web server.
   - Routes traffic to the WordPress service.
   - **Ports**: exposes port `443` for secure HTTPS communication.
   - **Volumes**: mounts the WordPress files to `/var/www/wordpress`.

2. **MariaDB**
   - Provides the database backend for WordPress.
   - **Volumes**: stores database files in a persistent directory.

3. **WordPress**
   - Hosts the WordPress application.
   - Relies on the MariaDB service for database operations.
   - **Volumes**: mounts WordPress files for persistence.

### **Volumes**
The project uses Docker volumes for persistent data storage:
- **`wordpress`**:
  - Maps to `/home/$(USER)/data/wp` on the host.
  - Stores WordPress application files.
- **`mariadb`**:
  - Maps to `/home/$(USER)/data/db` on the host.
  - Stores MariaDB database files.

---

## **Makefile**

The provided `Makefile` simplifies managing the Docker setup. Below are the targets:

### **Targets**

#### **`all`**
Builds and launches all services:
```bash
make all
```

#### **`build`**
Builds the Docker images for all services:
```bash
make build
```

#### **`up`**
Starts the services in detached mode after ensuring volumes are created:
```bash
make up
```

#### **`down`**
Stops and removes all running containers:
```bash
make down
```

#### **`clean`**
Runs a custom script to remove temporary files:
```bash
make clean
```

#### **`prune`**
Performs a complete cleanup of Docker resources:
```bash
make prune
```

---

## **Key Features**

1. **Docker Containers**  
   - Implements a containerized architecture for better modularity and scalability.

2. **Custom Docker Network**  
   - Ensures seamless communication between services.

3. **Persistent Storage**  
   - Prevents data loss with host-mounted Docker volumes.

4. **Automation with Makefile**  
   - Simplifies building, starting, and cleaning up the project.

---

## **Acknowledgments**

This project is a part of the 42 School curriculum, designed to provide hands-on experience with Docker, container orchestration, and DevOps practices.

---
