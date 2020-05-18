```bash
HTTPD1_ADDR=$(docker inspect `docker ps -a  | grep -i httpd | head -1 | awk '{print $1}'` | grep -Po "IPAddress\": \"\K[0-9\.]*")
for i in `seq 1 50` ; do nohup watch -n 0 curl http://$HTTPD1_ADDR/ -o /dev/null --silent &  done
```

```bash
HTTPD2_ADDR=$(docker inspect `docker ps -a  | grep -i httpd | tail -1 | awk '{print $1}'` | grep -Po "IPAddress\": \"\K[0-9\.]*")
for i in `seq 1 50` ; do nohup watch -n 0 curl http://$HTTPD2_ADDR/ -o /dev/null --silent &  done
```
