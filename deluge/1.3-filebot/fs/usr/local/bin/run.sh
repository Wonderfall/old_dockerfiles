#!/bin/sh
addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u ${UID} torrent

if [ -e /config/core.conf ]
then
  mkdir -p /config/state
  chown -R torrent:torrent /config
  echo"Config OK"
else
  cp /config-bkp/* /config/
  mkdir -p /config/state
  chown -R torrent:torrent /config
fi

mkdir -p /data/.torrents
mkdir -p /data/torrents/.in_progress
mkdir -p /data/watch
mkdir -p /data/media
mkdir -p /home/torrent/.python-eggs

chown -R torrent:torrent /data
chown -R torrent:torrent /home/torrent
chmod +x /home/torrent/post-filebot.sh

supervisord -c /etc/supervisord.conf
