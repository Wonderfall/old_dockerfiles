FROM java:openjdk-8-jre
MAINTAINER Wonderfall <wonderfall@opmbx.org>

ENV VERSION=5.3 GROUPID=1000 USERID=1000

COPY run.sh /usr/local/bin/
COPY supervisord.conf /etc/

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    libav-tools \
    lame \
    supervisor \
 && mkdir -p /opt/subsonic/data && cd /opt/subsonic \
 && wget -qO- http://subsonic.org/download/subsonic-${VERSION}-standalone.tar.gz | tar zxf - \
 && sed -i "s/ > \${LOG} 2>&1 &//" subsonic.sh \
 && sed -i "s|/var/|/opt/|g" subsonic.sh \
 && sed -i "s|SUBSONIC_HOME=/opt/subsonic|SUBSONIC_HOME=/opt/subsonic/data|g" subsonic.sh \
 && chmod +x /usr/local/bin/run.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 4040
VOLUME /opt/music /opt/playlists /opt/subsonic/data
CMD ["run.sh"]
