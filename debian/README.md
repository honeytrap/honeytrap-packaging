# Packaging for Honeytrap

```
docker run -e OS=linux -e ARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
docker run -e OS=linux -e ARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh
docker run -e OS=linux -e ARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
docker run -e OS=linux -e ARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh
```

* https://wiki.debian.org/Multiarch/HOWTO
