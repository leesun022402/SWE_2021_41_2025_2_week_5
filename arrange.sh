#!/bin/bash

SOURCE_FOLDER="files"

if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Directory '$SOURCE_FOLDER' not found."
    echo "Please run this script in the '~/SWE_2021_41_2025_2_week_5-main/' directory."
    exit 1
fi

for filepath in "$SOURCE_FOLDER"/*
do
    if [ -f "$filepath" ]; then
        filename=$(basename "$filepath")        
        first_char="${filename:0:1}"
        
        dest_folder_name="${first_char,,}"
        mkdir -p "$dest_folder_name"
        
        mv "$filepath" "$dest_folder_name/"
    fi
done
