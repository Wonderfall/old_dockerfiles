#!/bin/sh
if [ -f "/ocwww/config/config.php" ]; then
  cp -n /ocwww/config/config.php /config/config.php
  mv /ocwww/config/config.php /config/config.php.bkp
fi

if [ -f "/config/config.php" ]; then
  cp /config/config.php /ocwww/config/config.php
fi

chown -R ocwww:ocwww /ocwww
chown -R ocwww:ocwww /data
chown -R ocwww:ocwww /config
supervisord -c /usr/local/etc/supervisord.conf
