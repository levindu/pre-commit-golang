#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v golint &> /dev/null ; then
    echo "golint not installed or available in the PATH" >&2
    echo ">>> go install golang.org/x/lint/golint@latest" >&2
    go install golang.org/x/lint/golint@latest >&2
    exit 1
fi

failed=false

for file in "$@"; do
    # redirect stderr so that violations and summaries are properly interleaved.
    if ! golint -set_exit_status "$file" 2>&1
    then
        failed=true
    fi
done

if [[ $failed == "true" ]]; then
    exit 1
fi
