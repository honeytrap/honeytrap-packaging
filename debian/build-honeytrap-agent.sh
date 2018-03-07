#!/bin/sh

DEST=/go/src/github.com/honeytrap/honeytrap-agent/

mkdir -p $DEST 

cd $DEST
git clone https://github.com/honeytrap/honeytrap-agent .

COMMIT=$(git rev-parse --short HEAD)
echo $COMMIT

DATE=$(git log -1 --format=%cd --date=format:'%Y%m%d')
echo $DATE

LDFLAGS=$(go run scripts/gen-ldflags.go)
go build -a -ldflags "$LDFLAGS -extldflags \"-static\"" -o /go/bin/app

/go/bin/app --version

cd /build
cp /go/bin/app honeytrap-agent/usr/bin/honeytrap-agent

cat honeytrap-agent/DEBIAN/control.template | sed -e s/#DATE#/$DATE/ | sed -e s/#COMMIT#/$COMMIT/ > honeytrap-agent/DEBIAN/control

dpkg-deb --build honeytrap-agent 
