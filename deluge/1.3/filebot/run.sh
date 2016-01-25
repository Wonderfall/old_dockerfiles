#!/bin/sh
addgroup -g ${GID} deluge && adduser -H -s /bin/sh -D -G deluge -u ${UID} deluge

if [ -e /config/core.conf ]
then
  mkdir -p /config/state
  chown -R deluge:deluge /config
  echo"Config OK"
else
  cp /config-bkp/* /config/
  mkdir -p /config/state
  chown -R deluge:deluge /config
fi

if [ "$FB_LINK" == "symlink" ]
then
  sed -i "s/action hardlink/action symlink/g" /usr/local/bin/post-filebot
elif [ "$FB_LINK" == "hardlink" ]
then
  sed -i "s/action symlink/action hardlink/g" /usr/local/bin/post-filebot
fi

sed -i "s|\"base\": \"/\"|\"base\": \"$WEBROOT\"|g" /config/web.conf

mkdir -p /data/.torrents
mkdir -p /data/torrents/.in_progress
mkdir -p /data/watch
mkdir -p /data/media

chown -R deluge:deluge /data /filebot

supervisord -c /etc/supervisor/supervisord.conf
