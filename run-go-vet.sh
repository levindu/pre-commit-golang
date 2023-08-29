#!/usr/bin/env bash

set -e -o pipefail

exec 5>&1
output="$(go vet ./... | tee /dev/fd/5)"
[[ -z "$output" ]]
