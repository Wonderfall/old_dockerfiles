#!/bin/sh
addgroup -g ${GID} deluge && adduser -H -s /bin/sh -D -G deluge -u ${UID} deluge

if [ -e /config/core.conf ]
then
  mkdir -p /config/state
  chown -R deluge:deluge /config
  echo "Config OK"
else
  cp /config-bkp/* /config/
  mkdir -p /config/state
  chown -R deluge:deluge /config
fi

sed -i "s|\"base\": \"/\"|\"base\": \"$WEBROOT\"|g" /config/web.conf

mkdir -p /data/.torrents
mkdir -p /data/torrents/.in_progress
mkdir -p /data/watch
mkdir -p /data/media

chown -R deluge:deluge /data

supervisord -c /etc/supervisor/supervisord.conf
