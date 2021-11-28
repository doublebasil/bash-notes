#!/bin/bash

echo "Enter a directory to check if it exists"
read INPUT_DIR

if [[ -d "${INPUT_DIR}" ]]; then
	echo "That does exist"
else
	echo "That does not exist"
fi
