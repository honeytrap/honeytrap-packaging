#!/bin/sh

yum install -y golang

cp -R /build/rpmbuild /root/
rpmbuild -v -bb --clean honeytrap.spec

cp -R /root/rpmbuild/RPMS/ /build/
