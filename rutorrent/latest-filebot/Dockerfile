FROM wonderfall/rutorrent
MAINTAINER xataz <https://github.com/xataz/dockerfiles>
MAINTAINER Wonderfall <wonderfall@schrodinger.io>

ARG FILEBOT_VER=4.6.1

RUN echo "@community http://nl.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories \
 && apk add -U openjdk8-jre@community \
 && mkdir /filebot \
 && wget -q http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VER}/FileBot_${FILEBOT_VER}-portable.zip -P /tmp \
 && unzip -q /tmp/FileBot_${FILEBOT_VER}-portable.zip -d /filebot \
 && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

RUN chmod +x /usr/bin/*

LABEL filebot="Filebot v$FILEBOT_VER"
