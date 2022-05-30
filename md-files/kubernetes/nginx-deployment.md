```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: nginx
      image: nginx:1.14.2
      #      command: ["/bin/bash", "-c"]
      #      args:
      #        - cat /etc/nginx/nginx.conf
      ports:
        - containerPort: 80
      securityContext:
        runAsGroup: 101
        runAsNonRoot: true
        runAsUser: 101
      volumeMounts:
        - name: cache
          mountPath: /var/cache/nginx
        - name: run
          mountPath: /var/run
        - name: log
          mountPath: /var/log/nginx
        - name: config
          subPath: default.conf
          mountPath: /etc/nginx/conf.d/default.conf
        - name: config
          subPath: nginx.conf
          mountPath: /etc/nginx/nginx.conf
  initContainers:
    - name: chmod
      image: debian:bullseye-slim
      command: [ "/bin/bash", "-c" ]
      args:
        - chown 101:101 -R /var/cache/nginx /var/log/nginx /var/run
      volumeMounts:
        - name: cache
          mountPath: /var/cache/nginx
        - name: run
          mountPath: /var/run
        - name: log
          mountPath: /var/log/nginx
  volumes:
    - name: cache
      emptyDir: { }
    - name: run
      emptyDir: { }
    - name: log
      emptyDir: { }
    - name: config
      configMap:
        name: nginx-config
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  default.conf: |
    server {
        listen       8080;
        server_name  0.0.0.0;

        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
    }
  nginx.conf: |
    worker_processes  1;

    error_log /dev/stdout info;
    pid        /var/run/nginx.pid;

    events {
        worker_connections  1024;
    }

    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" "$http_x_forwarded_for"';

        access_log /dev/stdout main;
        sendfile        on;
        keepalive_timeout  65;

        include /etc/nginx/conf.d/*.conf;
    }
```
