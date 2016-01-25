## wonderfall/isso
[![](https://badge.imagelayers.io/wonderfall/isso:latest.svg)](https://imagelayers.io/?images=wonderfall/isso:latest 'Get your own badge on imagelayers.io')

![](https://i.goopics.net/pq.png)


#### What is this?
Isso is a ~~Pokémon~~ commenting server similar to Disqus. More info on the [official website](https://posativ.org/isso/).

#### Features
- Based on Alpine Linux 3.3.
- Latest Isso installed via pip.

#### Environment variables
- **GID** : isso group id.
- **UID** : isso user id.

#### Example of simple configuration
```
# /mnt/docker/isso.conf
[general]
dbpath = /db/comments.db
host = https://cats.schrodinger.io/
[server]
listen = http://0.0.0.0:8080/

# docker-compose.yml
isso:
  image: wonderfall/isso
  environment:
    - GID=1000
    - UID=1000
  volumes:
    - /mnt/docker/isso/config:/config
    - /mnt/docker/isso/db:/db
```
