#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_directory>"
    exit 1
fi

source_file="$1"
destination_dir="$2"

# Check if source file exists
if [ ! -f "$source_file" ]; then
    echo "Source file does not exist: $source_file"
    exit 1
fi

# Check if destination directory exists
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory does not exist: $destination_dir"
    exit 1
fi

# Iterate over each subfolder in the destination directory
for subfolder in "$destination_dir"/*/; do
    # Check if it's a directory
    if [ -d "$subfolder" ]; then
        echo "Copying $source_file to $subfolder"
        cp "$source_file" "$subfolder"
    fi
done

echo "File copied to all subfolders."
