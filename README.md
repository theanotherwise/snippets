# Snippets

* [Cryptsetup](cryptsetup.md)
* [Kubernetes](kubernetes)
* [Docker](docker.md)
* [Linux](linux.md)
* [Text Processing](text-processing.md)
* [Encoding / Decoding](encoding-decoding.md)

---

# Password
```bash
sudo -i apt-get install pwgen xkcdpass
PW0="`pwgen 4 -c -n -y -s -1 -v`"
PW1="`xkcdpass -d "-" --min 6 --max 8 -C first -s 1 -n 2`"
PW2="`pwgen 4 -c -n -y -s -1 -v`"

echo "${PW0}${PW1}${PW2}"
```
