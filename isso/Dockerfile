FROM alpine:3.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV GID=1000 UID=1000

RUN apk -U add \
    python \
    python-dev \
    libffi-dev \
    py-setuptools \
    py-pip \
    sqlite \
    ca-certificates \
    build-base \
 && pip install --no-cache cffi \
 && pip install --no-cache isso \
 && ln -s /opt/isso/bin/isso /usr/local/bin/isso \
 && apk del \
    python-dev \
    libffi-dev \
    py-pip \
    build-base \
 && rm -f /var/cache/apk/*

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080
VOLUME /db /config
CMD ["run.sh"]
