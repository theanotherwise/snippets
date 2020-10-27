# Snippets

* [Crypt Setup](#cryptsetup)
* [Kubernetes](kubernetes)
* [Docker](#docker)
* [Linux](linux)
* [Elasticsearch](elasticsearch)

---

```bash
echo `pwgen 4 -c -n -y -s -1 -v``xkcdpass -d "-" --min 6 --max 8 -C first -s 1 -n 2``pwgen 4 -c -n -y -s -1 -v`
```

# Cryptsetup

```
cryptsetup -c aes-cbc-essiv:sha256 -s 256 -h sha512 -i 5000 luksFormat <device>

cryptsetup open -i 5000 <device> enc
cryptsetup open enc

cryptsetup luksAddKey <device>
cryptsetup luksRemoveKey <device>
cryptsetup luksKillSlot <device> 1

cryptsetup -vvv benchmark

cryptsetup -vvv isLuks <device>

cryptsetup status <name>
cryptsetup luksDump <device>

cryptsetup -vvv luksSuspend <name>
cryptsetup -vvv luksResume <name>
```

# Docker

### Build

```bash
docker build --rm --force-rm --no-cache --tag ubuntu .

docker-compose up -force-recreate --build --remove-orphans \
```

### Clean
```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`

docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

### Dockerfile Clean

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
