# Snippets

* [Cryptsetup](cryptsetup.md)
* [Docker](docker.md)
* [Linux](linux.md)
* [Text Processing](text-processing.md)
* [Encoding / Decoding](encoding-decoding.md)
* [Elasticsearch](elasticsearch.md)

---

# Password
```bash
sudo -i apt-get install pwgen xkcdpass -y

echo "`pwgen 4 -c -n -y -s -1 -v``xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1``pwgen 4 -c -n -y -s -1 -v`"
```
