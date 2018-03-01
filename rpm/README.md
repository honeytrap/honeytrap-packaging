# Packaging for Honeytrap

```
docker run -it --mount type=bind,source=$(pwd),target=/build centos-builder sh /build/build-honeytrap.sh
docker run -it --mount type=bind,source=$(pwd),target=/build centos-builder sh /build/build-honeytrap-agent.sh
```

