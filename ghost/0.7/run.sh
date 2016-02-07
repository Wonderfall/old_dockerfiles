#!/bin/bash
cd /ghost/content
mkdir apps data images themes

sed -i "s|my-ghost-blog.com|$DOMAIN|g" /ghost/config.js

if [ "$SSL" == "True" ] && ! grep -q 'urlSSL' /ghost/config.js; then
  sed -i "/url/a \ \ \ \ \ \ \ \ urlSSL: 'https://$DOMAIN'," /ghost/config.js
fi

if [ ! -d /ghost/content/themes/casper ]; then
  cp -r /ghost/casper /ghost/content/themes/casper
else
  CASPER=`md5sum /ghost/casper/package.json | awk '{ print $1 }'`
  INSTALLED_CASPER=`md5sum /ghost/content/themes/casper/package.json | awk '{ print $1 }'`
  if [ "$CASPER" != "$INSTALLED_CASPER" ]; then
    rm -rf /ghost/content/themes/casper
    cp -r /ghost/casper /ghost/content/themes/casper
  fi
fi

chown -R $UID:$GID /ghost
cd /ghost
gosu $UID:$GID npm start --production
