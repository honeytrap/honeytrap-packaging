# Packaging for Honeytrap

```
docker run -e GOOS=linux -e GOARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
docker run -e GOOS=linux -e GOARCH=amd64 -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh
docker run -e GOOS=linux -e GOARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
docker run -e GOOS=linux -e GOARCH=arm -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh
```

* https://wiki.debian.org/Multiarch/HOWTO
