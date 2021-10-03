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

```bash
find /var/log -mindepth 1 -maxdepth 1 -type f -exec grep -Iq . {} 2>/dev/null \; -print
```

`CPU / Devices`
```bash
iostat -c                     # `CPU`
iostat -c                     # `CPU`

iostat -d -m 1 10             # Device stat (megabytes)
iostat -d -k 1 10             # Device stat (kilobytes)
```

`Memory`
```bash
vmstat
```

`Processors`
```bash
mpstat
```

`blockdev`
```bash
blockdev --getsz /dev/sda     # Size (in sectors)
blockdev --getbsz /dev/sda    # Block Size
blockdev --getss /dev/sda     # Logical sector size
blockdev --getpbsz /dev/sda   # Physical sector size
```

`iperf3`
```bash
iperf3 --server --port 10000 --format M --verbose --bind 0.0.0.0 --logfile iperf3.log

iperf3 --client 10.10.20.11 --port 10000 --format M --verbose --parallel 1 --time 10
```

`netstat`
```bash
netstat --tcp --udp --numeric --timers --extend --verbose                        # netstat -tunove
netstat --tcp --udp --numeric --programs --listening --timers --extend --verbose # netstat -pltunove

netstat --statistics
netstat --unix
netstat --route
netstat --interfaces
```

`lsof`
```bash
lsof -u root
lsof -p 10000

lsof +d /usr/sibn
lsof -u root -a +D /var/log/ -a +d /usr/bin

lsof -i 4
lsof -i TCP:1-1024
lsof -u ^root -P -i TCP -i UDP
```
