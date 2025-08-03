#!/bin/bash
# Creates a .sha256 file with the same subfolders and each file (so creates a directory tree identical to the original.  
SRC_DIR="/data"
DATE=$(date +%Y%m%d_%H%M%S)

find "$SRC_DIR" -type f | while read -r file; do
    # Get the directory and filename relative to SRC_DIR
    rel_dir=$(dirname "${file#$SRC_DIR/}")
    filename=$(basename "$file")
    # Create a log directory for this file
    log_dir="/tmp/$rel_dir/$filename"
    mkdir -p "$log_dir"
    # Generate sha256 and save to $DATE.sha256 inside the log directory
    sha256sum "$file" > "$log_dir/$DATE.sha256"
done
