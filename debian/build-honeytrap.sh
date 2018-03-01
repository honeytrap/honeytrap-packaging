#!/bin/sh

DEST=/go/src/github.com/honeytrap/honeytrap/

mkdir -p $DEST 

cd $DEST
git clone https://github.com/honeytrap/honeytrap .

COMMIT=$(git rev-parse --short HEAD)
echo $COMMIT

DATE=$(git log -1 --format=%cd --date=format:'%Y%m%d')
echo $DATE

LDFLAGS=$(go run scripts/gen-ldflags.go)
go build -a -ldflags "$LDFLAGS -extldflags \"-static\"" -o /go/bin/app

/go/bin/app --version

cd /build
cp /go/bin/app honeytrap/usr/bin/honeytrap

cat honeytrap/DEBIAN/control.template | sed -e s/#DATE#/$DATE/ | sed -e s/#COMMIT#/$COMMIT/ > honeytrap/debian/control

dpkg-deb --build honeytrap
