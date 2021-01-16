```bash
docker run \
    --tty --interactive --rm \
    --name postgres \
    --env POSTGRES_DB=example \
    --env POSTGRES_USER=example \
    --env POSTGRES_PASSWORD=example \
    --env POSTGRES_HOST_AUTH_METHOD=md5 \
    --env PGDATA=/var/lib/postgresql/data \
    --volume /var/lib/postgresql/data \
    postgres:12
```
