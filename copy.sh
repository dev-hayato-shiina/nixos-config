#!/usr/bin/env zsh
clear

TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")
OUTPUT_FILE="${TIMESTAMP}.txt"

{
  printf '===== tree =====\n\n'
  tree -a -I ".git"
  find . -type f \
    ! -name "copy.sh" \
    ! -name ".gitignore" \
    ! -name ".sops.yaml" \
    ! -name "README.md" \
    ! -name "add_user_password.sh" \
    ! -name "flake.lock" \
    ! -name "install.sh" \
    ! -name "setup_ssh_key.sh" \
    ! -name "*.txt" \
    ! -name "./secrets/*.bak" \
    ! -name "./secrets/secrets.yaml" \
    ! -path "./ssh/*" \
    ! -path "./.git/*" \
    ! -name "*.jpg" \
    ! -name "*.png" \
    -print0 |
  while IFS= read -r -d '' f; do
    printf '\n===== %s =====\n\n' "$f"
    cat "$f"
  done
} > "$OUTPUT_FILE"

echo "Saved: $OUTPUT_FILE"
