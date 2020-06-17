# Docker

```bash
docker-compose up --remove-orphans

watch -n 0 "docker ps -a | tail -n +2 |sort -k 2"
```

```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`
```

```bash
docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

# curl to all httpd
```bash
for i in `docker ps -a | grep -i httpd | awk '{print $1}'` ; do curl  $(docker inspect $i | grep -Po "IPAddress\": \"\K[0-9\.]*") ; done
```

# get kibana
```bash
echo http://$(docker inspect `docker ps -a | grep -i kibana | awk '{print $1}'` | grep -Po "IPAddress\": \"\K[0-9\.]*"):5601
```

```bash
docker network rm `docker network ls | awk '{print $1}' | tail -n +2`
NNAME=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
OCT=`shuf -i 1-255 -n 1`

NDRIV=bridge
NCIDR=172.17.$OCT.1
NHALF=172.17.$OCT
NGW=172.17.$OCT.1
NMASK=24

docker network create --driver=$NDRIV \
                      --subnet $NCIDR/$NMASK \
                      --gateway=$NGW \
                      --ip-range=$NCIDR/$NMASK \
                      $NNAME

docker build --rm --force-rm --no-cache -t test .

docker run -it --rm --network $NNAME --ip $NHALF.11 test
```
