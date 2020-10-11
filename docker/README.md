# Docker

## Build & Run
```bash
docker network create --ipam-driver default --subnet 172.20.0.0/16 test

docker build --rm --force-rm --no-cache --tag test .

docker run --interactive --tty --rm --network test --hostname hostname --name test --detach test
```

## Docker Compose
```bash
docker-compose up --force-recreate --build --remove-orphans --detach
```

## Clean
```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`

docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

## Dockerfile Clean

```docker
RUN apt-get autoremove --purge -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/log/* &&  \
    rm -rf /var/log/* && \
    rm -rf /var/tmp/* && \
    rm -rf /etc/ssh/ssh_host_*
```
