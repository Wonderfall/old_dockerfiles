FROM wonderfall/owncloud-base
MAINTAINER Wonderfall <wonderfall@opmbx.org>

ENV OWNCLOUD_VERSION=8.2.2
VOLUME /config /data 
CMD ["run.sh"]

RUN apk -U add \
    supervisor \
    tar \
    gnupg \
 && mkdir /ocwww && cd /tmp \
 && wget -q https://download.owncloud.org/community/owncloud-$OWNCLOUD_VERSION.tar.bz2 \
 && wget -q https://download.owncloud.org/community/owncloud-$OWNCLOUD_VERSION.tar.bz2.sha256 \
 && wget -q https://download.owncloud.org/community/owncloud-$OWNCLOUD_VERSION.tar.bz2.asc \
 && wget -q https://owncloud.org/owncloud.asc \
 && sha256sum -c owncloud-$OWNCLOUD_VERSION.tar.bz2.sha256 \
 && gpg --import owncloud.asc \
 && gpg --verify owncloud-$OWNCLOUD_VERSION.tar.bz2.asc \
 && tar xjf /tmp/owncloud-$OWNCLOUD_VERSION.tar.bz2 --strip 1 -C /ocwww \
 && apk del \
    tar \
    gnupg \
 && rm -rf /var/cache/apk/* /tmp/*

COPY owncloud.conf /usr/local/etc/nginx/sites-enabled/owncloud.conf
COPY owncron.conf /usr/local/etc/owncron.conf
COPY supervisord.conf /usr/local/etc/supervisord.conf
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh \
 && crontab -u ocwww /usr/local/etc/owncron.conf
