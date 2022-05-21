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

# bots

```bash
for i in `seq 1 50` ; do
  nohup watch -n 0 curl --connect-timeout 1 --max-time 1 "http://127.0.0.1:8080" -o /dev/null --silent > 2>&1 /dev/null & 
done
```

```bash
for i in `seq 1 100` ; do
  nohup bash -c 'for i in `seq 1 1000` ; do VAR=`date +"%H%M%S%d%m%Y%N"` && touch $VAR && dd if=/dev/urandom of=$VAR bs=1KB count=`echo $RANDOM % 100 + 1 | bc` > /dev/null 2>&1 ; done' > /dev/null 2>&1 &
done
```

```bash
for i in `seq 1 254` ; do 
  ADDR=155.133.21.$i
  ping $ADDR -c 1 -W 1 && echo $ADDR >> found || echo $ADDR >> not_found
done
```

```bash
for i in `docker ps -a | grep -i httpd | awk '{print $1}'` ; do 
  curl  $(docker inspect $i | grep -Po "IPAddress\": \"\K[0-9\.]*")
done
```

