```bash
docker network create \
    --driver bridge \
    --ipam-driver default \
    --subnet 172.18.0.0/24 \
    network18
```

```bash
docker build \
    --rm --force-rm \
    --pull --no-cache \
    --network network18 \
    --tag example .
```

```bash
docker run \
    --tty --interactive --rm \
    --name example --hostname example \
    --network network18 --ip 172.18.0.10 \
    --env EXAMPLE=example \
    --volume /var/lib/postgresql/data \
    example
```

```bash
docker run \
    --tty --interactive --rm \
    --name example \
    logstash:7.14.2
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

```bash
docker build --no-cache --force-rm -<< "EndOfMessage"
FROM ubuntu:focal

ARG ABC=test

RUN echo ${ABC} &&\
	var=${ABC:0:1} && \
	echo $var
EndOfMessage
```

```bash
docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`

docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`
docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`
docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`
```

```bash
docker-compose up --force-recreate --build --remove-orphans --detach
```
