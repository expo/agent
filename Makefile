VERSION := $(shell cat agent/version.go  | grep Version | head -n1 | cut -d \" -f 2)

build: deps
	@echo "building ${VERSION}"
	@go build -o pkg/buildkite *.go

dist: deps
	@scripts/build.sh

clean:
	@test ! -e pkg || rm -r pkg

test:
	@go test ./...

fmt:
	@go fmt ./...

lint:
	@golint cmd buildkite

vet:
	@go vet ./...

.PHONY: build dist clean test fmt vet
