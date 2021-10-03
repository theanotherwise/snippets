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

#

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

```bash
iostat -c                     # `CPU`
iostat -c                     # `CPU`

iostat -d -m 1 10             # Device stat (megabytes)
iostat -d -k 1 10             # Device stat (kilobytes)
```

```bash
vmstat      # `memory`
mpstat      # `processors`
```

```bash
blockdev --getsz /dev/sda     # Size (in sectors)
blockdev --getbsz /dev/sda    # Block Size
blockdev --getss /dev/sda     # Logical block size
blockdev --getpbsz /dev/sda   # Physical block size
```
