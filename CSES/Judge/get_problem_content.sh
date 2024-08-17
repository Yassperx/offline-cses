#!/bin/bash

# Input file
input_file="problems.txt"

# Base directory where the main folders will be created
base_dir="/home/yassperx/Desktop/offline cp/CSES/Problems"

# Iterate over lines in the input file
while IFS= read -r line || [[ -n "$line" ]]; do
    # If it's the first line or after a reset, use it as the folder name
    if [ -z "$main_folder_name" ]; then
        main_folder_name="$line"
        main_folder_path="$base_dir/$main_folder_name"

        # Create the main folder in the specified directory
        mkdir -p "$main_folder_path"
    else
        # If the line is "0", ask for a new main folder name and reset
        if [ "$line" == "0" ]; then
            echo "Please enter a new main folder name:"
            read new_main_folder_name
            main_folder_name="$new_main_folder_name"
            main_folder_path="$base_dir/$main_folder_name"

            # Create the new main folder
            mkdir -p "$main_folder_path"
            continue
        fi

        # If the line is "-1", reset and wait for a new main folder name
        if [ "$line" == "-1" ]; then
            main_folder_name=""
            continue
        fi

        # Create a subfolder named after the current line (id)
        subfolder_path="$main_folder_path/$line"
        mkdir -p "$subfolder_path"

        # Define the file path for the statement.md file
        file_path="$subfolder_path/statement.md"

        # Run the Python script and redirect the output to statement.md
        echo -e "$line" | python3 mkpy.py > "$file_path"
    fi
done < "$input_file"

