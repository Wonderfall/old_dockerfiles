## wonderfall/lutim
[![](https://badge.imagelayers.io/wonderfall/lutim:latest.svg)](https://imagelayers.io/?images=wonderfall/lutim:latest 'Get your own badge on imagelayers.io')

![](https://i.goopics.net/rf.png)

#### What is this?
LUTIM means Let's Upload That Image.
It stores images and allows you to see them, download them or share them on social networks. From version 0.5, the gif images can be displayed as animated gifs in Twitter, but you need a HTTPS server (Twitter requires that. Lutim detects if you have a HTTPS server and displays an static image twitter card if you don't);

Images are indefinitly stored unless you request that they will be deleted at first view or after 24 hours / one week / one month / one year.

#### Environment variables
- **GROUPID** : lutim group id.
- **USERID** : lutim user id.
- **SECRET** : random string used to encrypt cookies.
- **CONTACT** : lutim contact.
- **MAX_FILE_SIZE** : maximum file size of an uploaded file in bytes.
- **WEBROOT** : webroot of lutim.
- **HTTPS** : deprecated, can force HTTPS if set to 1.

*Tip : you can use the following command to generate SECRET.*
`cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 20 | head -n 1`

#### Volumes
- **/data** : where lutim's database is stored.
- **/lutim/files** : location of uploaded files.

#### Docker compose (example)
```
lutim:
  image: wonderfall/lutim
  environment:
    - GROUPID=1000
    - USERID=1000
    - SECRET=ZyCnLAhYKBIJrukuKZZJ
    - CONTACT=user@domain.tld
    - MAX_FILE_SIZE=100000000
    - WEBROOT=/
    - HTTPS=1
  volumes:
    - /mnt/docker/lutim/data:/data
    - /mnt/docker/lutim/files:/lutim/files
```

#### Reverse proxy
https://github.com/Wonderfall/dockerfiles/tree/master/reverse
