#!/bin/sh
addgroup -g ${GID} wallabag && adduser -h /wallabag -s /bin/sh -D -G wallabag -u ${UID} wallabag

if [ -f /wallabag/inc/poche/config.inc.php ] && [ ! -f /config/config.inc.php ]; then
  cp /wallabag/inc/poche/config.inc.php /config/config.inc.php
elif [ -f /config/config.inc.php ]; then
  sed -i "s|'BASE_URL', ''|'BASE_URL', '$BASE_URL'|g" /config/config.inc.php
  mv /wallabag/inc/poche/config.inc.php /config/config.inc.php.bkp
  cp /config/config.inc.php /wallabag/inc/poche/config.inc.php
fi

chown -R wallabag:wallabag /wallabag /config /var/run/php-fpm.sock /var/lib/nginx /tmp
supervisord -c /usr/local/etc/supervisord.conf
