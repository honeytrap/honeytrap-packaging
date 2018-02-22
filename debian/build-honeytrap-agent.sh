#!/bin/sh

DEST=/go/src/github.com/honeytrap/honeytrap-agent/

mkdir -p $DEST 

cd $DEST
git clone https://github.com/honeytrap/honeytrap-agent .

LDFLAGS=$(go run scripts/gen-ldflags.go)
GOOS=linux
GOARCH=amd64 
go build -a -ldflags "$LDFLAGS -extldflags \"-static\"" -o /go/bin/app

/go/bin/app --version

cd /build
cp /go/bin/app honeytrap-agent/usr/bin/honeytrap-agent
dpkg-deb --build honeytrap-agent 
