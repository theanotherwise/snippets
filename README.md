# Snippets

* [Cryptsetup](cryptsetup.md)
* [Docker](docker.md)
* [Linux](linux.md)
* [Text Processing](text-processing.md)
* [Encoding / Decoding](encoding-decoding.md)
* [Elasticsearch](elasticssearch.md)

---

# Password
```bash
sudo -i apt-get install pwgen xkcdpass -y

PW0="`pwgen 4 -c -n -y -s -1 -v`"
PW1="`xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1`"
PW2="`pwgen 4 -c -n -y -s -1 -v`"

echo "${PW0}${PW1}${PW2}"
```
