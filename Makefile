APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ghcr.io/stas-zinchenko
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
OS=linux
ARCH=amd64

format:
	gofmt -s -w ./

test:
	./kbot start

get:
	go get

build: format get
	CGO_ENABLED=0 go build -v -o kbot -ldflags "-X="github.com/stas-zinchenko/kbot/cmd.appVersion=${VERSION}-${OS}-${ARCH}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${OS}-${ARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${OS}-${ARCH}

clean:
	rm -rf kbot
