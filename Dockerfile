FROM golang:1.14-alpine AS build-env

WORKDIR /helloworld

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh make

RUN export CGO_ENABLED=0 && \
    go get github.com/micro/micro/v3 && \
    go get -u github.com/golang/protobuf/proto && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    go get github.com/micro/micro/v3/cmd/protoc-gen-micro

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "ls", "/"]
