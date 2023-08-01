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

# find all symlinks in the specified directory and its subdirectories
for file in $(find "$scan_dir" -type l); do
    echo "Symlink found: $file"

    # check if the target of the symlink exists
    if [ ! -e "$file" ]; then
        echo -e "${RED}This file points to a location that does not exist.${NC}"
    else
        echo -e "${GREEN}This file points to a valid location.${NC}"
    fi
done
