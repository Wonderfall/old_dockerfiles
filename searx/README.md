## wonderfall/searx
[![](https://badge.imagelayers.io/wonderfall/searx:latest.svg)](https://imagelayers.io/?images=wonderfall/searx:latest 'Get your own badge on imagelayers.io')

![](https://i.goopics.net/ls.png)

#### What is searx?
Searx is a metasearch engine, inspired by the seeks project.
It provides basic privacy by mixing your queries with searches on other platforms without storing search data. Queries are made using a POST request on every browser (except chrome*). Therefore they show up in neither our logs, nor your url history. In case of Chrome* users there is an exception, Searx uses the search bar to perform GET requests. Searx can be added to your browser's search bar; moreover, it can be set as the default search engine. 

#### Secret key
When the container starts the first time, it generates a new secret key. It doesn't depend on the build, so no one can know your key. 

#### Environment variables
`IMAGE_PROXY` is a boolean value (True or False, False by default), it can enable proxying through the searx instance (useful for public instances because it doesn't break TLS connection). `$BASE_URL` should be used if searx is behind a domain name (http address or False, False by default).

#### Docker Compose (example)
```
searx:
  image: wonderfall/searx:latest
  environment:
    - BASE_URL="https://searx.domain.tld"
    - IMAGE_PROXY=True
```
