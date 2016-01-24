FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV BRANCH=1.3-stable WEBROOT=/ UID=1000 GID=1000

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "@3.2 http://nl.alpinelinux.org/alpine/v3.2/main" >> /etc/apk/repositories \
 && apk -U add \
    tar \
    ca-certificates \
    python \
    python-dev \
    libffi \
    libffi-dev \
    xdg-utils \
    py-gtk \
    openssl-dev \
    build-base \
    py-pip \
    librsvg \
    supervisor \
    boost-system@3.2 \
    boost-python@3.2 \
    libtorrent-rasterbar@testing \
 && pip install --no-cache \
    service_identity \
    enum34 \
    setuptools \
    six \
    Mako \
    pyxdg \
    chardet \
    twisted \
    pyOpenSSL \
    cffi \
    cryptography \
 && cd /tmp \
 && wget -qO- https://github.com/deluge-torrent/deluge/archive/$BRANCH.tar.gz \
  | tar xz --strip 1 \
 && python setup.py build && python setup.py install \
 && apk del \
    tar \
    build-base \
    py-pip \
    libffi-dev \
    openssl-dev \
    python-dev \
    ca-certificates \
 && rm -rf /var/cache/apk/* /tmp/*

COPY fs /

RUN chmod +x /usr/local/bin/run.sh \
 && cp -R /config /config-bkp

VOLUME /data /config
EXPOSE 53160 53160/udp 58846 8112 
CMD ["run.sh"]
