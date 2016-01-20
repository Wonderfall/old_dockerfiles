FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV VER=1.9.1-b GID=1000 UID=1000

RUN apk -U add \
    nginx \
    php-fpm \
    php-xml \
    php-zlib \
    php-iconv \
    php-dom \
    php-gd \
    php-curl \
    php-gettext \
    php-pdo_mysql \
    php-ctype \
    php-json \
    supervisor \
 && rm -f /var/cache/apk/*

RUN wget -q http://wllbg.org/latest -P /tmp \
 && wget -q http://wllbg.org/vendor -P /tmp \
 && unzip -q /tmp/latest \
 && mv wallabag-$VER wallabag \
 && unzip -q /tmp/vendor -d /wallabag \
 && rm -f /tmp/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php/php-fpm.conf
COPY supervisord.conf /usr/local/etc/supervisord.conf
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

VOLUME /config
EXPOSE 80
CMD ["run.sh"]
