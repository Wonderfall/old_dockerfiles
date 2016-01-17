## wonderfall/reverse
**SIZE : ±19MB**

![](https://i.goopics.net/lv.jpg) ![](https://i.goopics.net/lL.png) ![](https://upload.wikimedia.org/wikipedia/en/2/25/LibreSSL_logo.jpg)

#### What is this?
Basically, it's just nginx statically linked against LibreSSL. Both are compiled from source.

#### Features
- Based on Alpine Linux (3.3).
- Latest nginx mainline available (1.9.9).
- Latest LibreSSL snapshot available (1.3.2).
- HTTP/2 support.
- AIO Threads support.
- No unnessary modules.
- Optimized nginx configuration.

#### Source (Dockerfile)
https://github.com/Wonderfall/dockerfiles/tree/master/reverse

#### Examples : compose, vhost, TLS conf
```
# docker-compose.yml
nginx:
  image: wonderfall/reverse
  ports:
    - "80:80"
    - "443:443"
  links:
    - container_1:container_1
    - container_2:container_2
    - container_n:container_n
  volumes:
    - /mnt/docker/nginx/sites:/sites-enabled
    - /mnt/docker/nginx/conf:/conf.d
    - /etc/letsencrypt:/certs
    - /mnt/docker/nginx/log:/var/log/nginx
```

```
# /mnt/docker/nginx/sites/service.conf
server {
  listen 80;
  server_name service.domain.tld;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http2;
  server_name service.domain.tld;
  ssl_certificate /certs/live/service.domain.tld/fullchain.pem;
  ssl_certificate_key /certs/live/service.domain.tld/privkey.pem;
  include /conf.d/ssl_params.conf;

  location / {
      proxy_pass http://container_n:$PORT;
      proxy_set_header        X-Real-IP       $remote_addr;
      proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header        X-Forwarded-Proto $remote_addr;
      proxy_set_header        X-Forwarded-Protocol $scheme;
  }
}
```

```
# /mnt/docker/conf/ssl_params.conf
ssl_protocols TLSv1.2;
ssl_ciphers "ECDHE-RSA-CHACHA20-POLY1305:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256";
ssl_prefer_server_ciphers on;
ssl_ecdh_curve secp384r1;

ssl_session_cache shared:SSL:10m;
ssl_session_timeout 10m;
ssl_session_tickets off;

add_header Strict-Transport-Security "max-age=31536000";
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
```
