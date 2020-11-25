# Docker

# `docker network create`
```bash
docker network create \
    --driver bridge \
    --ipam-driver default \
    --subnet 172.18.0.0/24 \
    net18
```

## `docker build`
```bash
docker build \
        --rm \
        --force-rm \
        --no-cache \
        --tag ubuntu .
```

## `docker run`
```bash
docker run \
    --tty --interactive --rm \
    --name rails --hostname rails \
    --env POSTGRES_DB=rails \
    --env POSTGRES_USER=rails \
    --env POSTGRES_PASSWORD=rails \
    --env POSTGRES_HOST_AUTH_METHOD=md5 \
    --env PGDATA=/var/lib/postgresql/data/pgdata \
    --volume /var/lib/postgresql/data \
    postgres:latest
```

```bash
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
