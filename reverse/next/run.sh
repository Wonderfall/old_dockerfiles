#!/bin/sh
addgroup -g $GID nginx && adduser -H -s /bin/sh -D -G nginx -u $UID nginx
touch /var/run/nginx.pid
chown -R nginx:nginx /sites-enabled /conf.d /etc/nginx /var/log/nginx /var/run/nginx.pid
gosu nginx:nginx nginx
