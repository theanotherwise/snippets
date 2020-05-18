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
