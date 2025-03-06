#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v golangci-lint &> /dev/null ; then
    echo "golangci-lint not installed or available in the PATH" >&2
    echo ">>> go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest" >&2
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest >&2
fi

exec golangci-lint run "$@"
