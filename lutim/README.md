## wonderfall/lutim
![](https://i.goopics.net/rf.png)

#### What is this?
LUTIM means Let's Upload That Image.
It stores images and allows you to see them, download them or share them on social networks. From version 0.5, the gif images can be displayed as animated gifs in Twitter, but you need a HTTPS server (Twitter requires that. Lutim detects if you have a HTTPS server and displays an static image twitter card if you don't);

Images are indefinitly stored unless you request that they will be deleted at first view or after 24 hours / one week / one month / one year.

#### Environment variables
- **GROUPID** : lutim group id.
- **USERID** : lutim user id.
- **CONTACT** : lutim contact.
- **MAX_FILE_SIZE** : maximum file size of an uploaded file.
- **WEBROOT** : webroot of lutim.
- **HTTPS** : deprecated, can force HTTPS if set to 1.

#### Volumes
- **/data** : where lutim's database is stored.
- **/lutim/files** : location of uploaded files.

#### Docker compose (example)
```
lutim:
  image: wonder/lutim
  environment:
    - GROUPID=1000
    - USERID=1000
    - CONTACT=user@domain.tld
    - MAX_FILE_SIZE=100000000
    - WEBROOT=/
    - HTTPS=1
  volumes:
    - /mnt/docker/lutim/data:/data
    - /mnt/docker/lutim/files:/lutim/files
```
```
# REVERSE PROXY
  location / {
      try_files $uri @lutim;
  }

  location @lutim {
      proxy_pass http://lutim:8181;
      proxy_set_header        Host                 $host;
      proxy_set_header        X-Real-IP            $remote_addr;
      proxy_set_header        X-Forwarded-For      $proxy_add_x_forwarded_for;
      proxy_set_header        X-Forwarded-Proto    $remote_addr;
      proxy_set_header        X-Remote-Port        $remote_port;
      proxy_set_header        X-Forwarded-Protocol $scheme;
      proxy_redirect          off;
  }
}
```
