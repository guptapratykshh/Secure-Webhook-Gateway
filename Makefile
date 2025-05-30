SHELL:=/bin/bash
GO_BUILD_ENV=GOOS=$(shell go env GOOS) GOARCH=$(shell go env GOARCH)
GO_FILES=$(shell go list ./... | grep -v /vendor/)

BUILD_VERSION=$(shell cat VERSION)
BUILD_TAG=$(BUILD_VERSION)

.SILENT:

all: fmt vet install test

build:
	mkdir bin;\
	$(GO_BUILD_ENV) go build -o bin ./cmd/...;\

install:
	$(GO_BUILD_ENV) go install

vet:
	go vet $(GO_FILES)

fmt:
	go fmt $(GO_FILES)

test:
	go test $(GO_FILES) -cover

integration_test:
	go test -tags=integration $(GO_FILES)

clean:
	rm -rf bin 2> /dev/null
