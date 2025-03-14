if [ ! -f ${INPUT_DIR} ]; then
    echo "migrations directory not found"
    exit 1
fi

echo "cwd:${PWD}\n"
ls .

goose up ${INPUT_DIR}
