#!/bin/bash

# Define the directories
TMP_DIR="$HOME/sgoinfre/.tmp_francinette"
FRANCINETE_DIR="$HOME/sgoinfre/francinette-image"
FRANCINETE_TAR="$FRANCINETE_DIR/francinette.tar"

# Create the temporary directory if it doesn't exist
mkdir -p "$TMP_DIR"

# Check if the francinette.tar file exists and move it to the temporary directory
if [ -f "$FRANCINETE_TAR" ]; then
    mv "$FRANCINETE_TAR" "$TMP_DIR/"
    echo "Moved francinette.tar to $TMP_DIR"
else
    echo "francinette.tar not found in $FRANCINETE_DIR"
fi
