#!/usr/bin/env zsh
clear

TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")
OUTPUT_FILE="${TIMESTAMP}.txt"

{
  printf '===== tree =====\n\n'
  tree -a -I ".git"
  find . -type f \
    ! -name "copy.sh" \
    ! -name "*.txt" \
    ! -name "*.bak" \
    ! -path "./.git/*" \
    ! -name "*.lock" \
    ! -name "*.jpg" \
    ! -name "*.png" \
    ! -name "README.md" \
    -print0 |
  while IFS= read -r -d '' f; do
    printf '\n===== %s =====\n\n' "$f"
    cat "$f"
  done
} > "$OUTPUT_FILE"

echo "Saved: $OUTPUT_FILE"
