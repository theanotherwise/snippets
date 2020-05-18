```bash
HTTPD1_ADDR=127.0.0.1:80

for i in `seq 1 50` ; do nohup watch -n 0 curl http://$HTTPD1_ADDR/ -o /dev/null --silent &  done
```
