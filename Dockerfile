######################################################################
# Cross compile (faster than emulating arm64)
FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.6-builder AS builder

ARG TARGETARCH
ARG TARGETOS

RUN xcaddy build \
    --with github.com/porech/caddy-maxmind-geolocation

######################################################################

FROM docker.io/library/caddy:2.11.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
