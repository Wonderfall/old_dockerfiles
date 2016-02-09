FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV DOCKER_COMPOSE=1.6.0

RUN apk -U add \
    py-pip \
    py-setuptools \
 && pip install --no-cache docker-compose==$DOCKER_COMPOSE \
 && apk del py-pip \
 && rm -f /var/cache/apk/*

VOLUME /dockerfiles
ENTRYPOINT ["docker-compose"]
CMD ["-v"]
