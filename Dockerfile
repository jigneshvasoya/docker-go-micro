FROM golang:1.14-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh make

WORKDIR /
COPY Makefile /Makefile

RUN make init

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "ls", "/"]
