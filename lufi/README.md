## wonderfall/lufi
[![](https://badge.imagelayers.io/wonderfall/lufi:latest.svg)](https://imagelayers.io/?images=wonderfall/lufi:latest 'Get your own badge on imagelayers.io')

![](https://pix.schrodinger.io/H1JZuROt/zh7BXdOK.png)

#### What is this?
Lufi means Let's Upload that FIle.
Is that all? No. All the files are encrypted by the browser! It means that your files never leave your computer unencrypted. The administrator of the Lufi instance you use will not be able to see what is in your file, neither will your network administrator, or your ISP.

#### Environment variables
- **GROUPID** : lufi group id.
- **USERID** : lufi user id.
- **SECRET** : random string used to encrypt cookies.
- **CONTACT** : lufi contact.
- **MAX_FILE_SIZE** : maximum file size of an uploaded file in bytes.
- **WEBROOT** : webroot of lufi.
- **DOMAIN** : domain used with lufi.

*Tip : you can use the following command to generate SECRET.*
`cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 20 | head -n 1`

#### Volumes
- **/data** : where lufi's database is stored.
- **/files** : location of uploaded files.

#### Docker-compose (example)
```
lufi:
  image: wonder/lufi
  environment:
    - GID=1000
    - UID=1000
    - SECRET=alpha
    - CONTACT=john.doe@domain.tld
    - WEBROOT=/
    - MAX_FILE_SIZE=1000000000
    - DOMAIN=up.schrodinger.io
  volumes:
    - /mnt/lufi/files:/files
    - /mnt/lufi/data:/data
```

#### Reverse proxy
https://github.com/Wonderfall/dockerfiles/tree/master/reverse
