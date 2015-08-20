#!/bin/bash

# Works like cat, except also prints filename and line number for each line

if [ -z "$1" ]; then
    echo "Print lines in a file, printing the filename and line number for each line"
    exit 1
fi

filename="$1"
line_number=0
while IFS='' read -r line || [[ -n $line ]]; do
    line_number=$((line_number+1))
    echo "$filename:$line_number|$line"
done < "$filename"

