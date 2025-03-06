#!/usr/bin/env bash
# shellcheck disable=SC2124

set -e -o pipefail

command="revive"

if ! command -v revive &> /dev/null ; then
    echo "revive not installed or available in the PATH" >&2
    echo ">>> go install github.com/mgechev/revive@latest" >&2
    go install github.com/mgechev/revive@latest >&2
fi

if [ $# -gt 0 ]; then
  command="$command $@"
fi

staged_files=$(git diff --cached --name-only --diff-filter=ACMRTUXB | grep '\.go$' | tr '\n' ' ')

if [ -n "$staged_files" ]; then
  # If "files" is not empty, run the revive command
  command="$command $staged_files"

  echo "Running: $command"

  exec 5>&1
  output="$($command | tee /dev/fd/5)"
  [[ -z "$output" ]]
fi

