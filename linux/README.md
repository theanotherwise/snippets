# Linux

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

## Certificates

```bash
/etc/ca-certificates.conf
/etc/ssl/certs/ca-certificates.crt
```

```bash
ls -d /etc/ssl/certs/
ls -d /usr/share/ca-certificates/
ls -d /usr/local/share/ca-certificates/
```

```bash
dpkg-reconfigure ca-certificates

update-ca-certificates --verbose --fresh
```
