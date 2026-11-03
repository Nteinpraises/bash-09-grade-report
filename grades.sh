#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 FILE.csv" >&2
    exit 1
fi 

file="$1"

if [[ ! -f "$file" || ! -r "$file" ]]; then
    echo "Error: Cannot read '$file'" >&2
    exit 1
fi

line_number=0

while IFS=',' read -r name html css bash git || [[ -n "$name" ]]; do
    (( line_number++ ))

    if (( line_number == 1 )); then
        continue
    fi 

    echo "$name"
done < "$file"