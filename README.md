# Snippets

* [Password](#Password)
* [Cryptsetup](cryptsetup.md)
* [Kubernetes](kubernetes)
* [Docker](#docker)
* [Linux](linux)
* [Elasticsearch](elasticsearch)

---

# Password
```bash
echo `pwgen 4 -c -n -y -s -1 -v``xkcdpass -d "-" --min 6 --max 8 -C first -s 1 -n 2``pwgen 4 -c -n -y -s -1 -v`
```

# Cryptsetup

```
cryptsetup -c aes-cbc-essiv:sha256 -s 256 -h sha512 -i 5000 luksFormat <device>

cryptsetup open -i 5000 <device> enc
cryptsetup open enc

cryptsetup luksAddKey <device>
cryptsetup luksRemoveKey <device>
cryptsetup luksKillSlot <device> 1

cryptsetup -vvv benchmark

cryptsetup -vvv isLuks <device>

cryptsetup status <name>
cryptsetup luksDump <device>

cryptsetup -vvv luksSuspend <name>
cryptsetup -vvv luksResume <name>
```

# Docker

```bash
docker build --rm --force-rm --no-cache --tag ubuntu .

docker-compose up -force-recreate --build --remove-orphans \
```

```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`

docker volume rm `docker volume ls | tail -n +2 | awk '{print $2}'`

docker network rm `docker network ls | tail -n +2 | awk '{print $1}'`

docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

```docker
RUN apt-get autoremove --purge -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /etc/ssh/ssh_host_*
```

# Linux

```bash
touch /etc/default/locale
touch /etc/environment

locale
localectl status

locale -av
locale -mv
localectl list-locales
localectl list-keymaps

echo "LC_ALL=\"en_US.UTF-8\"" > /etc/default/locale
echo "LANG=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LANGUAGE=\"en_US.UTF-8\"" >> /etc/default/locale

locale-gen --purge en_US.UTF-8
localectl set-locale en_US.UTF-8
```

```bash
find /var/log -mindepth 1 -maxdepth 1 -type f -exec grep -Iq . {} 2>/dev/null \; -print
```

```bash
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | awk '{print $2}'
```

```bash
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d" " -f1
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d$'\t' -f3
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d$'\t' -f1-2
```

```bash
CONF_PATH=~/configurations
KONS_PATH=$CONF_PATH/konsole
SESS_PATH=$KONS_PATH/sessions

mkdir -p $CONF_PATH
mkdir -p $KONS_PATH
mkdir -p $SESS_PATH

cd $SESS_PATH

for i in `seq 0 7` ; do VAR=1elk$i.localdomain && echo -e '#!/bin/bash '"\n\nssh root@$VAR" > $VAR; done
for i in `seq 0 7` ; do VAR=1ans$i.localdomain && echo -e '#!/bin/bash '"\n\nssh root@$VAR" > $VAR; done
for i in `seq 0 7` ; do VAR=1pup$i.localdomain && echo -e '#!/bin/bash '"\n\nssh root@$VAR" > $VAR; done

cd $KONS_PATH

for i in `seq 0 9` ; do 
  VAR=1elk$i 
  echo "title: $VAR;; workdir: $KONS_PATH;; command: /bin/bash $SESS_PATH/$VAR.localdomain" 
done > konsole.elk-nodes

konsole --tabs-from-file $KONS_PATH/konsole.elk-nodes
```
---
```bash
alias urlencode='python2 -c "import urllib, sys; print urllib.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'
alias urldecode='python2 -c "import urllib, sys; print urllib.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'

alias urlencode='python3 -c "from urllib import parse; import sys; print(parse.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias urldecode='python3 -c "from urllib import parse; import sys; print(parse.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
```
---
```bash
dpkg-reconfigure ca-certificates
update-ca-certificates --verbose --fresh

ls -d /etc/ssl/certs/
ls -d /usr/share/ca-certificates/
ls -d /usr/local/share/ca-certificates/
```
---
```bash
systemctl disable systemd-resolved.service
systemctl stop systemd-resolved
 ```
 
`/etc/NetworkManager/NetworkManager.conf`
```bash
[main]
dns=none
```

```bash
chattr -i etc/resolv.conf

rm /etc/resolv.conf

cat > /etc/resolv.conf << "EndOfMessage"
nameserver 10.10.10.10
nameserver 8.8.8.8
nameserver 8.8.4.4
EndOfMessage

chmod 644 /etc/resolv.conf

systemctl restart network-manager
```
