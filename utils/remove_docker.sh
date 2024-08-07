#!/bin/bash

# Color codes for terminal output
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m' # No Color

# Check if the Docker container "run-paco" is running and stop it if necessary
if docker ps | grep "francinette-image" &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Stopping and removing Docker container..."
    docker stop run-paco
    docker rm run-paco
else
    echo -e "${BLUE}[Francinette] ${WHITE}No running container found."
fi

# Check if the Docker image "francinette-image" exists and remove it if necessary
if docker image ls | grep "francinette-image" &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Removing Docker image..."
    docker rmi francinette-image
else
    echo -e "${BLUE}[Francinette] ${WHITE}No Docker image found."
fi

# Print completion message
echo -e "${BLUE}[Francinette] ${WHITE}Docker image removed ${GREEN}successfully!"
