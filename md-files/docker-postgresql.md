```bash
docker run --detach \
    --rm --name postgres \
    --hostname postgres \
    --publish 5432:5432/tcp \
    --env POSTGRES_DB=example \
    --env POSTGRES_USER=example \
    --env POSTGRES_PASSWORD=example \
    --env POSTGRES_HOST_AUTH_METHOD=md5 \
    --env PGDATA=/var/lib/postgresql/data \
    --volume /var/lib/postgresql/data \
    postgres:12
```
