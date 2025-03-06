#!/usr/bin/env bash
# shellcheck disable=SC2124

set -e -o pipefail

if ! command -v goimports-reviser &> /dev/null ; then
    echo "goimports-reviser not installed or available in the PATH" >&2
    echo ">>> go install -v github.com/incu6us/goimports-reviser/v3@latest" >&2
    go install -v github.com/incu6us/goimports-reviser/v3@latest >&2
fi

goimports-reviser -format ./...

if [ $? -ne 0 ]; then
  exit 2
fi

git add --all
exit 0
