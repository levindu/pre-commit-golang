#!/usr/bin/env bash
# shellcheck disable=SC2124

set -e -o pipefail

goimports-reviser -format ./...

if [ $? -ne 0 ]; then
  exit 2
fi

git add --all
exit 0
