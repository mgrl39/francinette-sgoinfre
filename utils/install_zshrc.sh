#!/bin/bash

RC_FILE="$HOME/.zshrc"

# Check if Francinette configurations are already in .zshrc
if ! grep "francinette-image" "$RC_FILE" &> /dev/null; then
    # Add Docker start check
    printf "\nif ! docker info | grep 'Running' &> /dev/null; then\n" >> "$RC_FILE"
    printf "\t\techo \"[Francinette] Starting Docker...\"\n" >> "$RC_FILE"
    printf "\t\tsleep 1\n" >> "$RC_FILE"
    printf "\t\texec \"$SHELL\"\n" >> "$RC_FILE"
    printf "fi\n" >> "$RC_FILE"

    # Add Docker image check and load
    printf "\nif ! docker image ls | grep 'francinette-image' &> /dev/null; then\n" >> "$RC_FILE"
    printf "\t\techo \"[Francinette] Loading the docker container\"\n" >> "$RC_FILE"
    printf "\t\tdocker load < %s/francinette-image/francinette.tar\n" "$HOME" >> "$RC_FILE"
    printf "\t\texec \"$SHELL\"\n" >> "$RC_FILE"
    printf "fi\n" >> "$RC_FILE"

    # Add Docker container check and start
    printf "\nif ! docker ps | grep 'francinette-image' &> /dev/null; then\n" >> "$RC_FILE"
    printf "\tif docker run -d -i -v /home:/home -v /goinfre:/goinfre -v /sgoinfre:/sgoinfre -v %s/francinette-image/logs:/francinette/logs-t --name run-paco francinette-image /bin/bash 2>&1 | grep 'already' &> /dev/null; then\n" "$HOME" >> "$RC_FILE"
    printf "\t\tdocker start run-paco\n" >> "$RC_FILE"
    printf "\tfi\n" >> "$RC_FILE"
    printf "fi\n" >> "$RC_FILE"
fi

# Add aliases if they don't exist
if ! grep "francinette=" "$RC_FILE" &> /dev/null; then
    printf "\nalias francinette=%s/francinette-image/run.sh\n" "$HOME" >> "$RC_FILE"
fi

if ! grep "paco=" "$RC_FILE" &> /dev/null; then
    printf "\nalias paco=%s/francinette-image/run.sh\n" "$HOME" >> "$RC_FILE"
fi

# Print completion message
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params installed"
