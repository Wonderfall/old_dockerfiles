## wonderfall/wallabag
![](https://www.wallabag.org/images/logo.png)

#### What is wallabag?
wallabag is a self hostable application for saving web pages. Unlike other services, wallabag is **free (as in freedom) and open source**. With this application you will not miss content anymore. **Click, save, read it when you want.** It saves the content you select so that you can read it when you have time. More info at the [offical website](https://www.wallabag.org/).

#### Features (of this build)
- Based on Alpine Linux 3.3
- Extremely lightweight
- Compatible with MySQL (server not built-in)
- Configuration persistance through updates

#### Notes
As php-tidy is not available in Alpine Linux (and not enabled in alpine's php package), deal with it. Most of the time, everything should work fine.

#### Docker Compose (example)
```
wallabag:
  image: wonderfall/wallabag
  links:
    - db_wallabag:db_wallabag
  environment:
    - GID=1000
    - UID=1000
  volumes:
    - /mnt/wallabag:/config

db_wallabag:
  image: mariadb:10
  volumes:
    - /mnt/wallabag/db:/var/lib/mysql
  environment:
    - MYSQL_ROOT_PASSWORD=supersecretpassword
    - MYSQL_DATABASE=wallabag
    - MYSQL_USER=wallabag
    - MYSQL_PASSWORD=supersecretpassword
```
