FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

RUN apk -U add \
    nsd \
    bind-tools \
 && rm -f /var/cache/apk/*

VOLUME /zones /etc/nsd
EXPOSE 53 53/udp
CMD ["nsd", "-d"]