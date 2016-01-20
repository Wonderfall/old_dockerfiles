FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV GID=1000 UID=1000

RUN apk -U add \
    nginx \
    php-fpm \
    php-curl \
    php-iconv \
    php-xml \
    php-dom \
    php-openssl \
    php-json \
    php-zlib \
    php-pdo_mysql \
    php-pdo_sqlite \
    supervisor \
 && rm -f /var/cache/apk/*

RUN wget http://repository.rainloop.net/v2/webmail/rainloop-community-latest.zip -P /tmp \
 && mkdir /rainloop && unzip -q /tmp/rainloop-community-latest.zip -d /rainloop \
 && rm -rf /tmp/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php/php-fpm.conf
COPY supervisord.conf /usr/local/etc/supervisord.conf
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

VOLUME /rainloop/data
EXPOSE 80
CMD ["run.sh"]
