#!/usr/bin/env bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e -o pipefail

exec 5>&1
output="$(gofmt -s -w -l $(shell go list -f {{.Dir}} ./... | grep -v /vendor/) | tee /dev/fd/5)"
[[ -z "$output" ]]
