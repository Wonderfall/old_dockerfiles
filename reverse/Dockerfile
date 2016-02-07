FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ARG NGINX_VER=1.9.10 LIBRESSL_VER=2.3.2 UID=991 GID=991

RUN apk -U add \
    build-base \
    linux-headers \
    ca-certificates \
    automake \
    autoconf \
    grep \
    git \
    tar \
    libtool \
    pcre \
    pcre-dev \
    zlib \
    zlib-dev \
    libgcc \
    libstdc++ \
 && NB_CORES=`grep -c "processor" /proc/cpuinfo` \
 && cd /tmp && git clone https://github.com/bagder/libbrotli && cd libbrotli \
 && ./autogen.sh && ./configure && make -j$NB_CORES && make install \
 && mkdir /tmp/ngx_brotli && cd /tmp/ngx_brotli \
 && wget -qO- https://github.com/google/ngx_brotli/archive/master.tar.gz | tar xz --strip 1 \
 && mkdir /tmp/libressl && cd /tmp/libressl \
 && wget -qO- http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$LIBRESSL_VER.tar.gz | tar xz --strip 1 \
 && ./configure LDFLAGS=-lrt --prefix=/tmp/libressl/.openssl/ \
 && make install-strip -j$NB_CORES \
 && mkdir /tmp/nginx && cd /tmp/nginx \
 && wget -qO- http://nginx.org/download/nginx-$NGINX_VER.tar.gz | tar zxf - \
 && cd nginx-$NGINX_VER \
 && ./configure --with-http_ssl_module \
                --with-http_v2_module \
                --with-http_gzip_static_module \
                --with-http_stub_status_module \
                --with-openssl=/tmp/libressl \
                --with-cc-opt='-g -O2 -fstack-protector-strong -Wformat -Werror=format-security' \
                --with-ld-opt="-lrt" \
                --with-file-aio \
                --with-threads \
                --without-http_scgi_module \
                --without-http_uwsgi_module \
                --without-http_fastcgi_module \
                --prefix=/etc/nginx \
                --http-log-path=/var/log/nginx/access.log \
                --error-log-path=/var/log/nginx/error.log \
                --sbin-path=/usr/local/sbin/nginx \
                --user=nginx \
                --group=nginx \
                --add-module=/tmp/ngx_brotli \
 && make -j$NB_CORES && make install \
 && apk del \
    build-base \
    linux-headers \
    ca-certificates \
    automake \
    autoconf \
    git \
    grep \
    tar \
    libtool \
    pcre-dev \
    zlib-dev \
 && rm -rf /tmp/* /var/cache/apk/*

COPY nginx.conf /etc/nginx/conf/nginx.conf

RUN addgroup -g $GID nginx && adduser -H -s /bin/sh -D -G nginx -u $UID nginx \
 && touch /var/run/nginx.pid \
 && chown -R nginx:nginx /etc/nginx /var/log/nginx /var/run/nginx.pid

USER nginx
EXPOSE 8000 4430
VOLUME /sites-enabled /conf.d /certs /var/log/nginx
LABEL description="Secure reverse proxy using nginx" \
      libressl="LibreSSL v$LIBRESSL_VER" \
      nginx="nginx v$NGINX_VER"
ENTRYPOINT ["nginx"]
