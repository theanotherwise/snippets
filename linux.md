# Linux

## Locales

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
