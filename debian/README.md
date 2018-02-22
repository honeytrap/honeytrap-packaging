# Packaging for Honeytrap

```
docker run -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
docker run -it --mount type=bind,source=$(pwd),target=/build debian-builder sh /build/build-honeytrap-agent.sh
```

* https://wiki.debian.org/Multiarch/HOWTO
