#!/usr/bin/env bash
FILES=$(go list ./...  | grep -v /vendor/)

go test -v -race ${FILES} --cover -tags=unit -short

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
