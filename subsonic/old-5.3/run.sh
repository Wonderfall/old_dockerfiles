#!/bin/bash
addgroup --gid ${GROUPID} subsonic
adduser --system --no-create-home --ingroup subsonic --uid ${USERID} subsonic

mkdir -p /opt/subsonic/data/transcode
mkdir -p /opt/music/Podcast
mkdir -p /opt/playlists

ln -s /usr/bin/lame /opt/subsonic/data/transcode/lame
ln -s /usr/bin/avconv /opt/subsonic/data/transcode/ffmpeg

chown -R subsonic:subsonic /opt/subsonic
chown -R subsonic:subsonic /opt/music
chown -R subsonic:subsonic /opt/playlists

supervisord -c /etc/supervisord.conf
