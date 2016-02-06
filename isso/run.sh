#!/bin/sh
addgroup -g $GID isso && adduser -H -s /bin/sh -D -G isso -u $UID isso
chown -R isso:isso /db /config
gosu isso:isso isso -c /config/isso.conf run
