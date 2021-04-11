GOPATH:=$(shell go env GOPATH)

.PHONY: init
init:
	go get github.com/micro/micro/v3
	go get -u github.com/golang/protobuf/proto
	go get -u github.com/golang/protobuf/protoc-gen-go
	go get github.com/micro/micro/v3/cmd/protoc-gen-micro

.PHONY: proto
proto:
	protoc --openapi_out=. --proto_path=${GOPATH}/src:. --micro_out=. --go_out=. proto/helloworld.proto

.PHONY: docs
docs:
	protoc --openapi_out=. --proto_path=${GOPATH}/src:. --micro_out=. --go_out=. proto/helloworld.proto
	@redoc-cli bundle api-helloworld.json

.PHONY: build
build: proto
	go build -o helloworld *.go

.PHONY: test
test:
	go test -v ./... -cover

