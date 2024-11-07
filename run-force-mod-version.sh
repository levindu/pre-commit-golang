#!/usr/bin/env bash

set -e -o pipefail

version="1.22"
if [ $# -gt 0 ]; then
  version="$1"
fi


function sed_replace() {
  local os=$(uname)

  if [ "$os" = "Darwin" ]; then
    sed -i '' "$1" "$2"
  else
    sed -i "$1" "$2"
  fi
}

function get_base_dir() {
  local file="$1"
  local dir=$(dirname "$file")
  echo "$dir"
}

function update_go_version() {
  local file="$1"

  if grep -q "^toolchain go" "$file"; then
    echo "Removing gotoolchain version from $file"
    sed_replace '/^toolchain go/d' "$file"
  fi

  if current_version=$(grep "^go [0-9]" "$file" | awk '{print $2}'); then
    if [ "$current_version" != "$version" ]; then
      echo "Updating go version from $current_version to $version in $file"
      pattern="s|^go .*|go $version|g"
      sed_replace "$pattern" "$file"
    fi
  fi
}

# Find and process go.work files
go_work_files=$(find . -type f -name "go.work")
if [ -n "$go_work_files" ]; then
  for file in $go_work_files; do
    update_go_version "$file"
  done
fi

# Find and process go.mod files
go_mod_files=$(find . -type f -name "go.mod")
if [ -n "$go_mod_files" ]; then
  for file in $go_mod_files; do
    update_go_version "$file"
  done
fi

git add --all
exit 0
