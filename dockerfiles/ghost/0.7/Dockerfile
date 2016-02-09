FROM wonderfall/node:4.2
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ARG VERSION=0.7.6

ENV GID=991 \
    UID=991 \
    DOMAIN=my-ghost-blog.com \
    SSL=False \
    CUSTOM_SMTP=False \
    SMTP_HOST=mail.domain.tld \
    SMTP_PASS=12345 \
    SMTP_USER=user \
    SMTP_PORT=666 \
    ENABLE_ISSO=False \
    ISSO_HOST=isso.domain.tld \
    ISSO_AVATAR=false \
    ISSO_VOTE=false

VOLUME /ghost/content

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "@commuedge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U add \
    ca-certificates \
    bash \
    grep \
    tini@commuedge \
    gosu@testing \
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
COPY smtp.conf /usr/local/etc/smtp.conf
COPY isso.conf /usr/local/etc/isso.conf

RUN chmod +x /usr/local/bin/run.sh

EXPOSE 2368
LABEL description="Ghost CMS ready for production" \
      ghost="Ghost v$VERSION"
CMD ["/usr/bin/tini","--","/usr/local/bin/run.sh"]
