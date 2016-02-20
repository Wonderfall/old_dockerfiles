FROM wonderfall/mono
MAINTAINER xataz <https://github.com/xataz>
MAINTAINER Wonderfall <wonderfall@schrodinger.io>

ENV GID=991 UID=991

RUN echo "@testing http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "@commuedge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U add \
    libmediainfo@testing \
    imagemagick \
    sqlite \
    ffmpeg \
    unzip \
    supervisor \
    tini@commuedge \
 && rm -f /var/cache/apk/* \
 && mkdir /embyServer /embyData

ADD https://github.com/MediaBrowser/Emby.Releases/raw/master/Server/Emby.Mono.zip /tmp

RUN unzip -q /tmp/Emby.Mono.zip -d /embyServer \
 && rm /tmp/Emby.Mono.zip

EXPOSE 8096
VOLUME /embyData /data
COPY rootfs /
RUN chmod +x /usr/local/bin/run.sh

CMD ["tini","--","run.sh"]
