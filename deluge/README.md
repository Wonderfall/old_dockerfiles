### wonderfall/deluge
[![](https://badge.imagelayers.io/wonderfall/deluge:latest.svg)](https://imagelayers.io/?images=wonderfall/deluge:latest 'Get your own badge on imagelayers.io') *vanilla*
[![](https://badge.imagelayers.io/wonderfall/deluge:filebot.svg)](https://imagelayers.io/?images=wonderfall/deluge:filebot 'Get your own badge on imagelayers.io') *filebot*

Deluge is a blazing fast BitTorrent client (+ WebUI).
This build was made for my own use in mind, although you can learn how it works by checkings its configuration files. A Deluge + Filebot build is also available.

- Vanilla : `latest`, `1.3`
- With Filebot : `filebot`, `1.3-filebot`

```
deluge:
  image: wonderfall/deluge
  volumes:
    - /mnt/seedbox:/data
    - /mnt/deluge:/config
  environment:
    - UID=1000
    - GID=1000
```
