#!/bin/bash

# color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# check if an argument was provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Please provide a directory as an argument.${NC}"
    exit 1
fi

# directory location that you want to scan
scan_dir=$1

# variable to keep track if a broken symlink was found
broken_symlink_found=false

# find all symlinks in the specified directory and its subdirectories
for file in $(find "$scan_dir" -type l); do
    # check if the target of the symlink exists
    if [ ! -e "$file" ]; then
        echo -e "${RED}Broken symlink found: $file. This file points to a location that does not exist.${NC}"
        broken_symlink_found=true
    fi
done

# if no broken symlink was found, print everything is ok
if [ "$broken_symlink_found" = false ]; then
    echo -e "${GREEN}Everything is Oke.${NC}"
fi
