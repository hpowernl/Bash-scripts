#!/bin/bash

remove_empty_dirs() {
    echo "Removed folders"
    echo "------------------------"
    while IFS=  read -r -d $'\0'; do
        dir="$REPLY"
        rmdir -- "$dir" && echo "$dir"
    done < <(find "$1" -type d -empty -print0)
}

show_empty_dirs() {
    echo "Empty Folders"
    echo "---------------------"
    while IFS=  read -r -d $'\0'; do
        dir="$REPLY"
        echo "$dir"
    done < <(find "$1" -type d -empty -print0)
}

if [ "$#" -lt 2 ]; then
    echo "Use the follow command: ./remove-empty-folder.sh --directory /your/directory/path [--remove]"
    exit 1
fi

dir="${@: -1}"

if [ ! -d "$dir" ]; then
    echo "Folder '$dir' don't exist."
    exit 1
fi

if [ "$1" == "--remove" ]; then
    remove_empty_dirs "$dir"
elif [ "$1" == "--directory" ]; then
    show_empty_dirs "$dir"
else
    echo "Error. Use the follow command: ./remove-empty-folder.sh --directory /your/directory/path [--remove]"
    exit 1
fi

exit 0