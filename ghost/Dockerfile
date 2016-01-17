FROM wonderfall/node:4.2
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV VERSION=0.7.5 DOMAIN=my-ghost-blog.com SSL=False GID=1000 UID=1000
VOLUME /ghost/content

RUN apk -U add ca-certificates bash grep \
 && wget -q https://ghost.org/zip/ghost-$VERSION.zip -P /tmp \
 && unzip -q /tmp/ghost-$VERSION.zip -d /ghost \
 && cd /ghost \
 && npm install --production \
 && mv content/themes/casper casper \
 && mv config.example.js config.js \
 && sed -i 's/127.0.0.1/0.0.0.0/g' config.js \
 && npm cache clean \
 && apk del ca-certificates \
 && rm -rf /tmp/* /var/cache/apk/*

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 2368
CMD ["run.sh"]
