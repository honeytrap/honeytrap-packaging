#!/bin/sh

DEST=/go/src/github.com/honeytrap/honeytrap-agent/

mkdir -p $DEST 

cd $DEST
git clone https://github.com/honeytrap/honeytrap-agent .

COMMIT=$(git rev-parse --short HEAD)
DATE=$(git log -1 --format=%cd --date=format:'%Y%m%d')

echo "Building Honeytrap agent"
echo "OS=$OS"
echo "ARCH=$ARCH"
echo "COMMIT=$COMMIT"
echo "DATE=$DATE"

LDFLAGS=$(go run scripts/gen-ldflags.go)
GOOS=$OS GOARCH=$ARCH go build -a -ldflags "$LDFLAGS -extldflags \"-static\"" -o /go/bin/app

/go/bin/app --version
file /go/bin/app

cd /build
cp /go/bin/app honeytrap-agent/usr/bin/honeytrap-agent

cat honeytrap-agent/DEBIAN/control.template | sed -e s/#DATE#/$DATE/ | sed -e s/#COMMIT#/$COMMIT/ > honeytrap-agent/DEBIAN/control

dpkg-deb --build honeytrap-agent 
