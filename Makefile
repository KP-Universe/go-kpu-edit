# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

# 수정 시작 지점
.PHONY: kpu android ios evm all test clean
# .PHONY: geth android ios evm all test clean
# 수정 종료 지점

GOBIN = ./build/bin
GO ?= latest
GORUN = go run

# 수정 시작 지점
kpu:
	$(GORUN) build/ci.go install ./cmd/kpu
	@echo "Done building."
	@echo "Run \"$(GOBIN)/kpu\" to launch kpu."
# geth:
# 	$(GORUN) build/ci.go install ./cmd/geth
# 	@echo "Done building."
# 	@echo "Run \"$(GOBIN)/geth\" to launch geth."
# 수정 종료 지점

all:
	$(GORUN) build/ci.go install

test: all
	$(GORUN) build/ci.go test

lint: ## Run linters.
	$(GORUN) build/ci.go lint

clean:
	go clean -cache
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go install golang.org/x/tools/cmd/stringer@latest
	env GOBIN= go install github.com/fjl/gencodec@latest
	env GOBIN= go install github.com/golang/protobuf/protoc-gen-go@latest
	env GOBIN= go install ./cmd/abigen
	@type "solc" 2> /dev/null || echo 'Please install solc'
	@type "protoc" 2> /dev/null || echo 'Please install protoc'
