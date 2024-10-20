# Laravel Docker Setup

This guide will help you set up and run the Laravel project using Docker.

## Prerequisites

Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup Instructions

### 1. Clone the repository

Clone your project repository to your local machine:

```bash
cd laravel-docker
docker compose up -build
```
```bash
#after you got output like this NOTICE: ready to handle connections,run this command
docker compose up -d
```
```bash
connect to database with host database
```
```bash
add domain to hosts file
update nginx config with domain
```
```bash
## to enter the container
docker exec -it docker-app-dev bash
```


Note: When run it at first time will take a long time.but after that it will be fast.because Images will be created.

Enjoy!🎉





