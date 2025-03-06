#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v goimports &> /dev/null ; then
    echo "goimports not installed or available in the PATH" >&2
    echo ">>> go install golang.org/x/tools/cmd/goimports@latest" >&2
    go install golang.org/x/tools/cmd/goimports@latest >&2
fi

output="$(goimports -l -w "$@")"
echo "$output"
[[ -z "$output" ]]
