#!/bin/bash

# Check if the directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Set the target directory
target_dir="$1"

# Find and unzip all .zip files in the specified directory and its subdirectories
find "$target_dir" -type f -name "*.zip" -execdir unzip -o '{}' \;

echo "All .zip files under $target_dir and its subfolders have been unzipped."
