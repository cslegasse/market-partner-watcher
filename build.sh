#!/bin/bash

CONTAINER_NAME=""
IMAGE_NAME=""

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container"
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

if [ "$(docker images -q $IMAGE_NAME)" ]; then
    echo "Removing existing image"
    docker rmi $IMAGE_NAME
fi

echo "Building Docker image"
docker build -t $IMAGE_NAME .

echo "Running Docker container"
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME

echo "completed."
