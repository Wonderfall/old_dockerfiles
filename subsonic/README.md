## wonderfall/subsonic
[![](https://badge.imagelayers.io/wonderfall/subsonic:latest.svg)](https://imagelayers.io/?images=wonderfall/subsonic:latest 'Get your own badge on imagelayers.io')

![](https://i.goopics.net/lr.png)

#### What is Subsonic?
Subsonic is an open-source web-based media streamer and jukebox. Supports MP3, OGG, AAC and other streamable audio and video formats. Indeed, this build comes with **transcoding abilities**.

#### Known issues (only with alpine) :
- Can't retrieve pictures through TLS (although it's not automatic, you have to choose clear-HTTP sources only when picking a cover picture) -> **fixed !**
- "Default covers" (when no cover image is detected) are not generated (not sure it's a problem since I find this feature useless... such ugly fonts/colors)

#### Docker Compose (example)
```
subsonic:
  image: wonderfall/subsonic
  volumes: 
    - /mnt/music:/musics
    - /mnt/subsonic:/data
    - /mnt/playlists:/playlists
  environment:
    - GID=1000
    - UID=1000
```
