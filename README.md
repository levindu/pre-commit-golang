# pre-commit-golang

golang hooks for <http://pre-commit.com/>

## Using these hooks

Add this to your `.pre-commit-config.yaml`

    - repo: https://github.com/dnephin/pre-commit-golang
      rev: master
      hooks:
        - id: go-fmt
        - id: go-lint
        - id: go-imports
        - id: golangci-lint
        - id: go-unit-tests
        - id: go-mod-tidy
        - id: go-get-update

### Available hooks

- `go-fmt` - Runs `gofmt`, requires golang
- `go-lint` - Runs `golint`, requires <https://github.com/golang/lint>
- `go-imports` - Runs `goimports`, requires golang.org/x/tools/cmd/goimports
- `golangci-lint` - Run `golangci-lint run ./...`, requires
  [golangci-lint](https://github.com/golangci/golangci-lint)
- `go-unit-tests` - Run `go test` to all project files with coverage
- `go-mod-tidy` - Run `go mod tidy -v`, requires golang
- `go-get-update` - Run `go get -u -v ./...` to update all project dependencies if there are any available
