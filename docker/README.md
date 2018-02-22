# Debian Packager for Docker

This docker image will build Debian packages. Usage:

# Build Docker image
```
docker build -t debian-builder -f Dockerfile-debian .
```

# Building packages
```
docker run -it --mount type=bind,source=(pwd),target=/build debian-builder sh /build/build-honeytrap.sh
```
