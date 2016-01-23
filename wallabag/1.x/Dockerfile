FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV VER=1.9.1-b BASE_URL=http://sub.domain.tld GID=1000 UID=1000

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
    tar \
    ca-certificates \
 && rm -f /var/cache/apk/*

WORKDIR /wallabag

RUN wget -qO- https://github.com/wallabag/wallabag/archive/$VERSION.tar.gz | tar xz --strip 1 \
 && wget -q http://wllbg.org/vendor && mv vendor vendor.zip \
 && unzip -q vendor.zip && rm vendor.zip \

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php/php-fpm.conf
COPY supervisord.conf /usr/local/etc/supervisord.conf
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

VOLUME /config
EXPOSE 80
CMD ["run.sh"]
