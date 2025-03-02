FROM debian:bookworm-slim

WORKDIR /usr/src/playit

# Add source and install playit in one layer
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update \
    && apt-get --no-install-recommends install -y curl ca-certificates \
    && curl -SsL https://playit-cloud.github.io/ppa/key.gpg -o /etc/apt/trusted.gpg.d/playit.asc \
    && curl -SsL https://playit-cloud.github.io/ppa/playit-cloud.list -o /etc/apt/sources.list.d/playit-cloud.list \
    && apt-get update \
    && apt-get --no-install-recommends install -y playit

ENTRYPOINT ["playit"]
