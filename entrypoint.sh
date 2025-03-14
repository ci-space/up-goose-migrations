#!/bin/sh

echo "cwd: ${PWD}"
echo "migrations directory: ${INPUT_DIR}"

if [ ! -d ${INPUT_DIR} ]; then
    echo "error: migrations directory not found"
    echo "ls for current directory"
    ls .
    exit 1
else
    echo "info: migrations directory exists"
fi

goose up
