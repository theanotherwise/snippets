```bash
docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
docker system prune -f

docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`
docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`
docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`
```
