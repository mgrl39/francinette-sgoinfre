#!/bin/bash

# Define the temporary directory and the installation directory
TMP_DIR="$HOME/sgoinfre/.tmp_francinette"
INSTALL_DIR="$HOME/sgoinfre/francinette-image"

# Create the temporary directory
mkdir -p $TMP_DIR

# Clone the repository into the temporary directory
git clone https://github.com/mgrl39/francinette-sgoinfre.git $TMP_DIR/francinette-image

# Source the removal scripts
source $TMP_DIR/francinette-image/utils/remove_docker.sh
source $TMP_DIR/francinette-image/utils/remove_zshrc.sh

# Remove the existing francinette-image directory and the temporary directory
rm -rf $INSTALL_DIR
rm -rf $TMP_DIR

# Define color codes for terminal output
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print success message
echo -e "${BLUE}[Francinette] ${WHITE}Uninstalled ${GREEN}OK"

# Restart the shell to apply changes
exec "$SHELL"
