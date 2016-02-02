## wonderfall/reverse
**SIZE : ±19MB**

![](https://i.goopics.net/lv.jpg) ![](https://i.goopics.net/lL.png) ![](https://upload.wikimedia.org/wikipedia/en/2/25/LibreSSL_logo.jpg)

#### What is this?
Basically, it's just nginx statically linked against LibreSSL. Both are compiled from source.

#### Tags
- Latest nginx **1.9.10** + LibreSSL **2.3.2** : `latest`
- Stable nginx **1.8.1** + LibreSSL **2.2.6** : `stable`
- Nginx 1.9.10 + LibreSSL 2.3.2 + ngx_brotli **(testing)** : `brotli`

You may prefer `stable` for production.

#### Features
- Based on Alpine Linux (3.3).
- **Latest :** nginx mainline + LibreSSL snapshot
- **Stable :** nginx stable + LibreSSL stable
- **Latest :** HTTP/2 support.
- **Brotli :** Brotli compression support.
- AIO Threads support.
- No unnessary modules.
- Optimized nginx configuration.

#### Volumes
- **/sites-enabled** : should contain your vhosts files (.conf)
- **/conf.d** : additional configuration files if you want
- **/certs** : SSL/TLS certificates
- **/var/log/nginx** : nginx logs (access and error)

#### Environment variables
- **GID** : nginx group id *(default : 1000)*
- **UID** : nginx user id *(default : 1000)*

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
  environment:
    - GID=1000
    - UID=1000
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
  include /conf.d/headers.conf;
  #client_max_body_size 10M; #(M = Megabytes / G = Gigabytes)

  location / {
      proxy_pass http://container_n:$PORT;
      proxy_set_header        Host                 $host;
      proxy_set_header        X-Real-IP            $remote_addr;
      proxy_set_header        X-Forwarded-For      $proxy_add_x_forwarded_for;
      proxy_set_header        X-Remote-Port        $remote_port;
      proxy_set_header        X-Forwarded-Proto    $scheme;
      proxy_redirect          off;
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
```

```
# /mnt/docker/conf/headers.conf
add_header Strict-Transport-Security "max-age=31536000";
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
```
