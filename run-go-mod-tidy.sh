#!/usr/bin/env bash

# Find and process go.mod files
go_mod_files=$(find . -type f -name "go.mod")
if [ -n "$go_mod_files" ]; then
  for file in $go_mod_files; do
    (
        cd "$(dirname "$file")" &&
         go mod tidy -v
    )
    if [ $? -ne 0 ]; then
      echo "go mod tidy failed for $file"
      exit 2
    fi
  done
fi

exit 0
