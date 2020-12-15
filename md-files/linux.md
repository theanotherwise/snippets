```bash
touch /etc/default/locale
touch /etc/environment
```

```bash
locale
localectl status

locale -av
locale -mv
localectl list-locales
localectl list-keymaps
```

```bash
echo "LC_ALL=\"en_US.UTF-8\"" > /etc/default/locale
echo "LANG=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LANGUAGE=\"en_US.UTF-8\"" >> /etc/default/locale
```

```bash
locale-gen --purge en_US.UTF-8
localectl set-locale en_US.UTF-8
```

---

```bash
dpkg-reconfigure ca-certificates
update-ca-certificates --verbose --fresh
```

```bash
ls -d /etc/ssl/certs/
ls -d /usr/share/ca-certificates/
ls -d /usr/local/share/ca-certificates/
```

#

```bash
find /var/log -mindepth 1 -maxdepth 1 -type f -exec grep -Iq . {} 2>/dev/null \; -print
```
