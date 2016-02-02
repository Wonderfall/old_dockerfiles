#!/bin/sh
addgroup -g $GID nginx && adduser -H -s /bin/sh -D -G nginx -u $UID nginx
chown -R nginx:nginx /sites-enabled /conf.d /var/log/nginx
nginx
