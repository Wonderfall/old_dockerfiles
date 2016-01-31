FROM debian:jessie
MAINTAINER Wonderfall <wonderfall@mondedie.fr>

ENV USERID=1000 GROUPID=1000 CONTACT=john.doe@domain.tld MAX_FILE_SIZE=10000000000 WEBROOT=/

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    tar \
    wget \
    perl \
    make \
    gcc \
    ca-certificates \
    libssl-dev \
    shared-mime-info \
 && cpan install Carton \
 && mkdir /lutim && cd /lutim \
 && wget -qO- https://github.com/ldidry/lutim/archive/master.tar.gz | tar xz --strip 1 \
 && carton install \
 && apt-get purge -y \
    tar \
    wget \
    make \
    gcc \
    ca-certificates \
 && apt-get autoremove --purge -y && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY run.sh /usr/local/bin/run.sh
COPY lutim.conf /lutim/lutim.conf

RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8181
VOLUME /data /lutim/files
CMD ["run.sh"]
