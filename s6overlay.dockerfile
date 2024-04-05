FROM debian:bookworm-slim
ENV TARGETARCH="arm64"
ENV S6_ARCH="aarch64"
RUN apt-get update && apt-get install -y --no-install-recommends cron curl xz-utils ca-certificates && which cron && \
    rm -rf /etc/cron.*/*

ARG S6_OVERLAY_VERSION=3.1.6.2

RUN update-ca-certificates
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-aarch64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-aarch64.tar.xz


COPY entrypoint.sh /entrypoint.sh
RUN /entrypoint.sh

COPY /rootfs/s6overlay /
CMD ["/init"]
