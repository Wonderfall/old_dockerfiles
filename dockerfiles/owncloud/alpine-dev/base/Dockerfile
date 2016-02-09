FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@opmbx.org>

ENV PHP_VER=7.0.2 PHP_IMAGICK=3.4.0RC4 PHP_APCU=5.1.2 PHP_APCBC=1.0.1 NGINX_VER=1.9.9
CMD ["php","-v"]

RUN adduser -D -H -s /bin/sh ocwww ocwww

RUN PKG_BUILD="build-base curl-dev openssl-dev libxml2-dev readline-dev zlib-dev imagemagick-dev \
    libmcrypt-dev jpeg-dev libpng-dev icu-dev pcre-dev linux-headers tar autoconf libtool grep" \
 && NB_CORES=`grep -c "processor" /proc/cpuinfo` \
 && apk -U add \
    libmcrypt \
    imagemagick \
    jpeg \
    libpng \
    icu-libs \
    curl \
    openssl \
    libxml2 \
    pcre \
    zlib \
    readline \
    $PKG_BUILD \
 && wget -q http://fr2.php.net/distributions/php-$PHP_VER.tar.gz -P /tmp \
 && cd /tmp && tar xzf /tmp/php-$PHP_VER.tar.gz \
 && cd php-$PHP_VER && mkdir -p /usr/local/etc/php/conf.d \
 && ./configure --with-config-file-path="/usr/local/etc/php" \
                --with-config-file-scan-dir="/usr/local/etc/php/conf.d" \
                --with-fpm-user=ocwww \
                --with-fpm-group=ocwww \
                --with-curl \
                --with-openssl \
                --with-readline \
                --with-zlib \
                --with-mcrypt \
                --with-gd \
                --with-mysqli \
                --with-pdo-mysql=mysqlnd \
                --without-pear \
                --without-pdo-sqlite \
                --without-sqlite3 \
                --disable-cgi \
                --enable-fpm \
                --enable-mysqlnd \
                --enable-exif \
                --enable-intl \
                --enable-zip \
                --enable-mbstring \
                --enable-opcache \
 && make -j$NB_CORES && make install \
 && mkdir -p /tmp/php-modules/apc/ext/apcu && cd /tmp/php-modules/apc \
 && wget -qO- https://pecl.php.net/get/apcu_bc-$PHP_APCBC.tgz | tar xz --strip 1 \
 && wget -qO- https://pecl.php.net/get/apcu-$PHP_APCU.tgz | tar xz --strip 1 -C ext/apcu \
 && phpize && ./configure && make -j$NB_CORES \
 && mv modules/apc.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012/ \
 && cd ext/apcu \
 && phpize && ./configure && make -j$NB_CORES \
 && mv modules/apcu.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012/ \
 && mkdir /tmp/php-modules/imagick && cd /tmp/php-modules/imagick \
 && wget -qO- https://pecl.php.net/get/imagick-$PHP_IMAGICK.tgz | tar xz --strip 1 \
 && phpize && ./configure && make -j$NB_CORES \
 && mv modules/imagick.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012/ \
 && wget -q http://nginx.org/download/nginx-$NGINX_VER.tar.gz -P /tmp \
 && cd /tmp && tar xzf /tmp/nginx-$NGINX_VER.tar.gz \
 && cd nginx-$NGINX_VER \
 && ./configure --with-http_gzip_static_module \
                --with-http_stub_status_module \
                --with-file-aio \
                --with-threads \
                --without-http_scgi_module \
                --without-http_uwsgi_module \
                --prefix=/usr/local/etc/nginx \
                --http-log-path=/var/log/nginx/access.log \
                --error-log-path=/var/log/nginx/error.log \
                --sbin-path=/usr/local/sbin/nginx \
                --user=ocwww \
                --group=ocwww \
 && make -j$NB_CORES && make install \
 && apk del $PKG_BUILD && rm -rf /var/cache/apk/* /tmp/*

RUN touch /run/php-fpm.sock && chown ocwww:ocwww /run/php-fpm.sock \
 && mkdir /usr/local/etc/nginx/sites-enabled

COPY nginx.conf /usr/local/etc/nginx/conf/nginx.conf
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY phpexts /usr/local/etc/php/conf.d/
