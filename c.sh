c() {
    local file="$1"

    if [[ -z "$file" ]]; then
        echo "Usage: c file.c"
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        echo "File not found"
        return 1
    fi

    local output="${file%.c}"

    gcc "$file" -Wall -Wextra -lm -g -o "$output" && "./$output"
}
