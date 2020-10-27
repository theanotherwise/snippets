# Docker

```bash
docker build --rm --force-rm --no-cache --tag ubuntu .

docker-compose up -force-recreate --build --remove-orphans \
```

```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`

docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

```docker
RUN apt-get autoremove --purge -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /etc/ssh/ssh_host_*
```
