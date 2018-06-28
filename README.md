# honeytrap-packaging

Used for building Debian and CentOS packages

## General instructions

1.0 Clone the Github repo for packaging

`git clone https://github.com/honeytrap/honeytrap-packaging.git`

### Debian

2.1 Create the debian-builder

Firstly, change to the docker directory:
`cd honeytrap-packaging/docker`

Then, build the debian builder:
`docker build -t debian-builder -f Dockerfile-debian .`

2.2 Create the Debian package

First, change to the debian directory:
`cd ../debian`

Then issue the docker run command, according to the desired arch type:

* `docker run -e OS=linux -e ARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh`
* `docker run -e OS=linux -e ARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh`
* `docker run -e OS=linux -e ARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh`
* `docker run -e OS=linux -e ARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh`

### CentOS

2.1 Create the centos-builder

Firstly, change to the docker directory (from the root of the repo):
`cd honeytrap-packaging/docker`

Then, builde the centos-builder:
`docker build -t centos-builder -f Dockerfile-centos .`

2.2 Create the CentOS package

First, change to the rpm directory:
`cd ../rpm`

Then issue the docer run command, according to the desired arch type:

* `docker run -it --mount type=bind,source=$(pwd),target=/build centos-builder sh /build/build-honeytrap.sh`
* `docker run -it --mount type=bind,source=$(pwd),target=/build centos-builder sh /build/build-honeytrap-agent.sh`

## For use with the Raspberry Pi

1. First move the (ARM debian) package to raspberry pi

2. Install the debian package:
`sudo dpkg -r honeytrap.deb`

3. Check /etc/ directory for .toml files (config.toml / honeytrap.toml).

4. Start honeytrap with:
honeytrap -c /etc/config.toml
