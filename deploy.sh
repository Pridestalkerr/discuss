#!/bin/bash

# Make sure docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

# Authenticate to remote registry
docker login $DOCKER_REGISTRY -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Create cert directory for nginx image
mkdir -p ssl
mkdir -p ssl/$FRONTEND_DOMAIN
mkdir -p ssl/$BACKEND_DOMAIN

# Pipe certificates into files
echo $FRONTEND_PUB > ssl/$FRONTEND_DOMAIN/pub.pem
echo $FRONTEND_PRIVATE > ssl/$FRONTEND_DOMAIN/private.pem
echo $BACKEND_PUB > ssl/$BACKEND_DOMAIN/pub.pem
echo $BACKEND_PRIVATE > ssl/$BACKEND_DOMAIN/private.pem

# Bring up containers
docker-compose up -d
