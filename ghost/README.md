## wonderfall/ghost
[![](https://badge.imagelayers.io/wonderfall/ghost:latest.svg)](https://imagelayers.io/?images=wonderfall/ghost:latest 'Get your own badge on imagelayers.io')

![](https://i.goopics.net/lt.png)

#### What is this?
- A **simple** Ghost CMS build made for production.
- It is based on Alpine Linux so it's lightweight.
- It uses node.js 4.x (LTS).
- Environment variables for basic flexibility.

#### Tags
- Latest, 0.7.x : `latest`, `0.7`

#### Where's my config file?
You shouldn't modify the config file. Use environment variables such as `DOMAIN` (your domain without http://) and `SSL` (True or False). Ghost is already listening to 0.0.0.0, using sqlite3 and running in production mode.

#### About Casper (the default theme)
Whenever casper is updated, your local changes are lost. I can't do anything about it. You have to handle it manually, I advice you to :
- Backup your local changes
- Use tags (versioning is always safer)
- Check your changes each time casper is updated by running another container.

#### Docker Compose (example)

```
ghost:
  image: wonderfall/ghost:0.7
  environment:
    - SSL=True
    - DOMAIN=my-ghost-blog.com
    - GID=1000
    - UID=1000
  volumes:
    - /mnt/ghost:/ghost/content
```
