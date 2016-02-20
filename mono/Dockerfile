FROM alpine:3.3
MAINTAINER xataz <https://github.com/xataz>
MAINTAINER Wonderfall <wonderfall@schrodinger.io>

ARG GLIBC_VER=2.23-r0
ARG GLIBC_URL=https://github.com/andyshinn/alpine-pkg-glibc/releases/download/unreleased

RUN BUILD_DEPS=" \
    tar \
    xz \
    ca-certificates \
    wget" \
    && apk add -U $BUILD_DEPS \
    && wget $GLIBC_URL/glibc-$GLIBC_VER.apk -O /tmp/glibc-$GLIBC_VER.apk \
    && wget $GLIBC_URL/glibc-bin-$GLIBC_VER.apk -O /tmp/glibc-bin-$GLIBC_VER.apk \
    && wget $GLIBC_URL/glibc-i18n-$GLIBC_VER.apk -O /tmp/glibc-i18n-$GLIBC_VER.apk \
    && wget https://www.archlinux.org/packages/extra/x86_64/mono/download/ -O /tmp/mono.pkg.tar.xz \
    && apk add --allow-untrusted \
       /tmp/glibc-$GLIBC_VER.apk \
       /tmp/glibc-bin-$GLIBC_VER.apk \
       /tmp/glibc-i18n-$GLIBC_VER.apk \
    && tar xJf /tmp/mono.pkg.tar.xz \
    && mozroots --import --ask-remove \
    && apk del $BUILD_DEPS \
    && rm -rf /tmp/* /var/cache/apk/*
     
CMD ["mono","--version"]
