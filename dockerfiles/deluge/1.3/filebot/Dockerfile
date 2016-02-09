FROM wonderfall/deluge:1.3
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV FB_VER=4.6.1 FB_LINK=hardlink

RUN echo "@community http://nl.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories \
 && apk -U add openjdk8-jre@community \
 && rm -f /var/cache/apk/*

RUN mkdir /filebot \
 && wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_$FB_VER/FileBot_$FB_VER-portable.zip -P /tmp \
 && unzip /tmp/FileBot_$FB_VER-portable.zip -d /filebot \
 && ln -s /filebot/filebot.sh /usr/local/bin/filebot \
 && rm -rf /tmp/*

COPY run.sh /usr/local/bin/run.sh 
COPY post-filebot.sh /usr/local/bin/post-filebot
COPY execute.conf /config/execute.conf
COPY web.conf /config/web.conf

RUN chmod +x /usr/local/bin/*
