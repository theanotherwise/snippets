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
    --tag example/example:latest .
```

```bash
docker build \
    --rm --force-rm \
    --pull --no-cache \
    --tag example/example:latest .
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

```bash
docker build --no-cache --force-rm -<< "EndOfMessage"
FROM ubuntu:focal

ARG ABC=test

RUN echo ${ABC} &&\
	var=${ABC:0:1} && \
	echo $var
EndOfMessage
```
