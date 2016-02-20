#!/bin/sh
addgroup -g ${GID} emby
adduser -H -h /embyData -s /bin/sh -G emby -u ${UID} -D emby

chown -R emby:emby /embyServer /embyData

supervisord -c /etc/supervisord.conf
