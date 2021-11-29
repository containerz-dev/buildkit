# syntax=docker/dockerfile:1.3

ARG BUILDKIT_VERSION
ARG DOCKER_VERSION

FROM --platform=$BUILDPLATFORM docker:${DOCKER_VERSION} AS docker

FROM --platform=$BUILDPLATFORM moby/buildkit:${BUILDKIT_VERSION} AS buildkit
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

LABEL org.opencontainers.image.authors "The containerz authors"
LABEL org.opencontainers.image.url "https://github.com/containerz-dev/buildkit"
LABEL org.opencontainers.image.source "https://github.com/containerz-dev/buildkit"
LABEL org.opencontainers.image.licenses "BSD-3-Clause"
