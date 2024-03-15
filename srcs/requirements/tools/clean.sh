#!/bin/sh

# Stop running containers
docker stop $(docker ps -qa)

# Remove stopped containers
docker rm -f $(docker ps -qa)

# Force remove images
docker rmi -f $(docker images -qa)

# Remove volumes
docker volume rm $(docker volume ls -q)

docker network rm $(docker network ls -q) 2>/dev/null