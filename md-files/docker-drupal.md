```bash
docker run --detach \
    --rm --name drupal \
    --hostname drupal \
    --publish 8080:80/tcp \
    --volume /var/www/html/modules \
    --volume /var/www/html/profiles \
    --volume /var/www/html/sites \
    --volume /var/www/html/themes \
    drupal:9.1.2-fpm
```
