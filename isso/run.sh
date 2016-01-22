#!/bin/sh
addgroup -g ${GID} isso && adduser -H -s /bin/sh -D -G isso -u ${UID} isso
chown -R isso:isso /db /config
su isso -c "isso -c /config/isso.conf run"
