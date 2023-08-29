#!/usr/bin/env bash
# shellcheck disable=SC2124

set -e -o pipefail

command="goimports-reviser -format"

if [ $# -gt 0 ]; then
  command="$command $@"
fi

command="$command ./..."

echo "Running: $command"

exec 5>&1
output="$($command | tee /dev/fd/5)"
[[ -z "$output" ]]
