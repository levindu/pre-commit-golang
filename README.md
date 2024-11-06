pre-commit-golang
=================

:rotating_light: Please see the project sunsetting announcement:
[Issues/98](https://github.com/dnephin/pre-commit-golang/issues/98)
:rotating_light:

----

golang hooks for <http://pre-commit.com/>

## Using these hooks

Add this to your `.pre-commit-config.yaml`

    - repo: https://github.com/Drafteame/pre-commit-golang
      rev: master
      hooks:
        - id: go-fmt
        - id: go-lint
        - id: go-imports
        - id: golangci-lint
        - id: go-unit-tests
        - id: go-mod-tidy
        - id: go-get-update
        - id: goimports-reviser

### Available hooks

- `go-fmt` - Runs `gofmt`, requires golang
- `go-vet` - Runs `go vet`, requires golang
- `go-lint` - Runs `golint`, requires <https://github.com/golang/lint> but is unmaintained & deprecated in favour of [golangci-lint](https://github.com/golangci/golangci-lint)
- `go-imports` - Runs `goimports`, requires golang.org/x/tools/cmd/goimports
- `golangci-lint` - Run `golangci-lint run ./...`, requires [golangci-lint](https://github.com/golangci/golangci-lint)
- `go-unit-tests` - Run `go test` to all project files with coverage
- `go-mod-tidy` - Run `go mod tidy -v`, requires golang
- `go-get-update` - Run `go get -u -v ./...` to update all project dependencies if there are any available
- `goimports-reviser` - Run `goimports-reviser -format ./...` to format all golang files (requires [goimports-reviser cli](https://github.com/incu6us/goimports-reviser))
- `revive` - Runs `revive` to inspect all staged files (requires [revive](https://github.com/mgechev/revive))
- `force-mod-version` - Search for all go.mod and go.work files and remove specific toolchains and unify to a specific go version (default 1.22)
