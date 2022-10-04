#!/usr/bin/env bash

set -e -o pipefail

exec 5>&1
output="$(goimports-reviser -format ./... | tee /dev/fd/5)"
[[ -z "$output" ]]
