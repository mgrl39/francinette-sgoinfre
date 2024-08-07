#!/bin/bash

# Define color codes for terminal output
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m' # No Color

# Remove lines related to "systemctl status docker", "francinette-image" and related commands
sed -i '/systemctl status docker/,+4d' $HOME/.zshrc
sed -i '/grep francinette-image/,+4d' $HOME/.zshrc
sed -i '/grep "francinette-image"/,+4d' $HOME/.zshrc

# Remove lines containing "francinette-image" alone
sed -i '/"francinette-image"/d' $HOME/.zshrc

# Remove lines containing docker ps or "francinette-image"
sed -i '/docker ps/,+4d' $HOME/.zshrc
sed -i '/"francinette-image"/,+4d' $HOME/.zshrc

# Remove alias definitions for paco and francinette
sed -i '/alias paco=/d' $HOME/.zshrc
sed -i '/alias francinette=/d' $HOME/.zshrc

# Print completion message
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params removed ${GREEN}successfully!"
