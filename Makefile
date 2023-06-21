APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ghcr.io
REPOSITORY=stas-zinchenko
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/redman-dev29/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${REPOSITORY}/${APP}:${VERSION}-${TARGETOS}

push:
	docker push ${REGISTRY}/${REPOSITORY}/${APP}:${VERSION}-${TARGETOS}

clean:
	rm -rf kbot
