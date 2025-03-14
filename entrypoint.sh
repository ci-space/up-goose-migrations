#!/bin/sh

echo "cwd:${PWD}\n"
ls .

if [ ! -f ${INPUT_DIR} ]; then
    echo "migrations directory not found"
    exit 1
fi

goose up ${INPUT_DIR}
