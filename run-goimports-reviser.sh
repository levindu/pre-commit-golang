#!/usr/bin/env bash
# shellcheck disable=SC2124

set -e -o pipefail

command="goimports-reviser -format ./..."

echo "Running: $command"

exec 5>&1
output="$($command | tee /dev/fd/5)"
[[ -z "$output" ]]
