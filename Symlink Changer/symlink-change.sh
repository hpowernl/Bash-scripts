#!/bin/bash

# Argumenten
old_symlink_path=$1
new_symlink_path=$2

# Recursieve symlink vervanger
find . -type l | while read -r symlink; do
    target=$(readlink "${symlink}")
    if [[ ${target} == *"${old_symlink_path}"* ]]; then
        new_target="${target/${old_symlink_path}/${new_symlink_path}}"
        if [ "${new_target}" != "${target}" ]; then
            rm "${symlink}"
            ln -s "${new_target}" "${symlink}"
            new_target_after=$(readlink "${symlink}")
            if [ "${new_target_after}" == "${target}" ]; then
                echo "${symlink}" "${target}" "${new_target_after}"
            fi
        fi
    fi
done