#!/bin/bash

SCRIPT_ARGUMENT="$1"
IMAGE_NAME=developer_container # TODO: rename accordingly

if [[ $SCRIPT_ARGUMENT == "podman" ]];
then
    echo "Building Podman image!"
    podman build --network host --format docker -f Dockerfile -t $IMAGE_NAME:latest .
elif [[ $SCRIPT_ARGUMENT == "docker" ]];
then
    echo "Building Docker image!"
    docker build --network host -f Dockerfile -t $IMAGE_NAME:latest .
else
    echo "UNKNOWN BUILD COMMAND, Exit program!"
    exit 1
fi