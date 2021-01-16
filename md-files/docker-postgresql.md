```bash
docker run --detach \
    --rm --name psql01 \
    --hostname psql01 \
    --publish 5432:5432/tcp \
    --env POSTGRES_DB=psql_db \
    --env POSTGRES_USER=psql_user \
    --env POSTGRES_PASSWORD=psql_passwd \
    --env POSTGRES_HOST_AUTH_METHOD=md5 \
    --env PGDATA=/var/lib/postgresql/data \
    --volume /var/lib/postgresql/data \
    postgres:12
```
