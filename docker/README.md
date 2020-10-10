# Docker

## Build & Run
```bash
docker build --rm --force-rm --no-cache -t test .

docker run -it --rm --network $NNAME --ip $NHALF.11 test
```

## Docker Compose UP
```bash
docker-compose up --force-recreate --build --remove-orphans
```

## Clean
```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`

docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```
