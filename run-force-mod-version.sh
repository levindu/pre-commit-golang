#!/usr/bin/env bash

set -e -o pipefail

version="1.22"

function sed_replace() {
  os=$(uname)

  if [ "$os" = "Darwin" ]; then
    sed -i '' "$1" "$2"
  else
    sed -i "$1" "$2"
  fi
}

if [ $# -gt 0 ]; then
  version="$1"
fi

# Find all go.mod and go.work files recursively
files=$(find . -type f \( -name "go.mod" -o -name "go.work" \))

if [ -z "$files" ]; then
  echo "No go.mod or go.work files found"
  exit 0
fi

for file in $files; do
  # Remove gotoolchain line if present
  if grep -q "^toolchain go" "$file"; then
    echo "Removing gotoolchain version from $file"
    sed_replace '/^toolchain go/d' "$file"
  fi

  # Check if current version is different from target version
  if current_version=$(grep "^go [0-9]" "$file" | awk '{print $2}'); then
    if [ "$current_version" != "$version" ]; then
      echo "Updating go version from $current_version to $version in $file"
      pattern="s|^go .*|go $version|g"
      sed_replace "$pattern" "$file"
    fi
  fi

  # Add file to git if it has changed
  if git diff --quiet "$file"; then
    git add "$file"
  fi
done


