FROM golang:1.22.2

RUN \
  go get -u -v github.com/golang/dep/cmd/dep

COPY . ${GOPATH}/src/github.com/dataux/dataux/
WORKDIR ${GOPATH}/src/github.com/dataux/dataux/

RUN \
  dep ensure -v && \
  go build

ENTRYPOINT [ "./dataux" ]
