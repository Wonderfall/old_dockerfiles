FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV VERSION=1.6.2

RUN adduser -D -H -s /bin/sh h2o h2o \
 && touch /var/run/h2o.pid \
 && chown h2o:h2o /var/run/h2o.pid

RUN apk -U add \
    grep \
    build-base \
    cmake \
    zlib \
    zlib-dev \
    openssl \
    perl \
    linux-headers \
 && NB_CORES=`grep -c "processor" /proc/cpuinfo` \
 && cd /tmp \
 && wget -q https://github.com/h2o/h2o/archive/v$VERSION.tar.gz \
 && tar zxf v$VERSION.tar.gz && cd h2o-$VERSION \
 && cmake -DWITH_BUNDLED_SSL=on \
 && make -j $NB_CORES\
 && make install \
 && apk del \
    grep \
    build-base \
    cmake \
    zlib-dev \
    linux-headers \
 && cd / && rm -rf /tmp/* && rm -f /var/cache/apk/*
 
VOLUME /config /certs /log
EXPOSE 80 443
CMD ["h2o", "-c", "/config/h2o.conf"]
