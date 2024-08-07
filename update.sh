#!/bin/bash

# Define color codes for terminal output
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Define directories
INSTALL_DIR="$HOME/sgoinfre/francinette-image"
TMP_DIR="$HOME/sgoinfre/.tmp_francinette"

# Check if the installation directory exists
if ls -l $INSTALL_DIR &> /dev/null; then
    # Create a temporary directory
    mkdir -p $TMP_DIR

    # Clone the repository into the temporary directory
    git clone https://github.com/WaRtr0/francinette-image.git $TMP_DIR/francinette-image

    # Source the removal scripts
    source $TMP_DIR/francinette-image/utils/move_tmp.sh
    source $TMP_DIR/francinette-image/utils/remove_docker.sh
    source $TMP_DIR/francinette-image/utils/remove_zshrc.sh

    # Remove the existing installation directory
    rm -rf $INSTALL_DIR

    # Create a new installation directory
    mkdir -p $INSTALL_DIR

    # Move files from the temporary directory to the new installation directory
    mv $TMP_DIR/francinette-image/* $INSTALL_DIR/

    # Move the francinette.tar file if it exists
    if ls -l $TMP_DIR | grep "francinette.tar" &> /dev/null; then
        mv $TMP_DIR/francinette.tar $INSTALL_DIR/
    fi

    # Remove the temporary directory
    rm -rf $TMP_DIR

    # Source the install script
    source $INSTALL_DIR/install.sh

    # Print success message
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${GREEN}OK"
fi

# Check if the installation directory does not exist
if ! ls -l $INSTALL_DIR &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${RED}ERROR (francinette not installed...)"
fi
