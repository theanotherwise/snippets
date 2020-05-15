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

```bash
alias urlencode='python2 -c "import urllib, sys; print urllib.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'
alias urldecode='python2 -c "import urllib, sys; print urllib.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'
```

```bash
alias urlencode='python3 -c "from urllib import parse; import sys; print(parse.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias urldecode='python3 -c "from urllib import parse; import sys; print(parse.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
```

```bash
#!/bin/bash
 
for i in `seq 1 100` ; do
        nohup bash -c 'for i in `seq 1 1000` ; do VAR=`date +"%H%M%S%d%m%Y%N"` && touch $VAR && dd if=/dev/urandom of=$VAR bs=1KB count=`echo $RANDOM % 100 + 1 | bc` > /dev/null 2>&1 ; done' > /dev/null 2>&1 &
done
```

```bash
docker container stop `docker ps -a | tail -n +2 | awk '{print $1}'`
docker container rm --force `docker ps -a | tail -n +2 | awk '{print $1}'`
```

```bash
docker image rm --force `docker images -a | tail -n +2 | awk '{print $3}'`
```

```bash
docker build --rm --force-rm --no-cache -t test .
```

```bash
NET_NAME=test

NET_CIDR=172.27.1.0
NET_GW=172.27.1.1
NET_MASK=24

docker rm network $NET_NAME
docker network create --driver=bridge \
                      --subnet $NET_CIDR/$NET_MASK \
                      --gateway=$NET_GW \
                      --ip-range=$NET_CIDR/$NET_MASK \
                      $NET_NAME
```
