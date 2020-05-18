```bash
HTTPD1_ADDR=127.0.0.1:80

for i in `seq 1 50` ; do nohup watch -n 0 curl http://$HTTPD1_ADDR/ -o /dev/null --silent &  done
```


```bash
for i in `seq 1 100` ; do
        nohup bash -c 'for i in `seq 1 1000` ; do VAR=`date +"%H%M%S%d%m%Y%N"` && touch $VAR && dd if=/dev/urandom of=$VAR bs=1KB count=`echo $RANDOM % 100 + 1 | bc` > /dev/null 2>&1 ; done' > /dev/null 2>&1 &
done
```
