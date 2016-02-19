FROM alpine:3.3 
MAINTAINER Wonderfall <wonderfall@schrodinger.io>

ARG VERSION=0.22

ENV GID=991 UID=991

RUN echo "@commuedge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk -U add \
    nginx \
    php7-fpm@testing \
    php7-gd@testing \
    php7-mcrypt@testing \
    php7-json@testing \
    php7-zlib@testing \
    supervisor \
    tini@commuedge \
    ca-certificates \
    tar \
 && mkdir zerobin && cd zerobin \
 && wget -qO- https://github.com/elrido/ZeroBin/archive/$VERSION.tar.gz | tar xz --strip 1 \
 && mv cfg/conf.ini.sample cfg/conf.ini \
 && apk del tar ca-certificates \
 && rm -f /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY supervisord.conf /usr/local/etc/supervisord.conf
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

VOLUME /zerobin/data
EXPOSE 80
LABEL description "A minimalist, opensource online pastebin where the server has zero knowledge of pasted data" \
      zerobin "elrido's ZeroBin v$VERSION"
CMD ["tini","--","run.sh"]
