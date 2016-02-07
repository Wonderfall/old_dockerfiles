## wonderfall/compose
docker-compose running in a simple container.
Add this to you bash profile :
```
alias docker-compose='docker run -v "$(pwd)":"$(pwd)" \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /home/docker/compose/dockerfiles:/dockerfiles \
        -e COMPOSE_PROJECT_NAME=$(basename "$(pwd)") \
        --workdir="$(pwd)" \
        -ti --rm wonderfall/compose:latest'
````
Change `/home/docker/compose/dockerfiles` to the location path containing Dockefiles you eventually want to build.
