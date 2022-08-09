#!/bin/bash
#TODO Make an executable?
printf "File path: "
read File_path
if [[ -f "$File_path" ]]; then
    File_full_name=$(basename "$File_path")
    File_extension=${File_full_name##*.}
    if [[ "$File_extension" == "aco" ]]; then
        File_name=${File_full_name%.*}
        File_dir=$(dirname "$(realpath "$File_path")")
        make -s && ./aco2gpl <"${File_path}" >"${File_dir}/${File_name}.gpl"
        echo "File saved in: \"${File_dir}/${File_name}.gpl\""
    else
        echo "The file isn't an Adobe Photoshop color file(.aco)"
    fi
else
    echo "The file \"$File_path\" does not exists."
fi
