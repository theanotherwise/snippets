```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - name: http
          containerPort: 8080
      securityContext:
        runAsUser: 101
        runAsGroup: 101
        runAsNonRoot: true
        privileged: false
        allowPrivilegeEscalation: false
      volumeMounts:
        - name: entrypointd
          mountPath: /docker-entrypoint.d/
        - name: cache
          mountPath: /var/cache/nginx
        - name: run
          mountPath: /var/run/nginx
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
        - chown 101:101 -R /var/cache/nginx /var/log/nginx /var/run/nginx
      volumeMounts:
        - name: cache
          mountPath: /var/cache/nginx
        - name: run
          mountPath: /var/run/nginx
        - name: log
          mountPath: /var/log/nginx
  volumes:
    - name: cache
      emptyDir: { }
    - name: run
      emptyDir: { }
    - name: log
      emptyDir: { }
    - name: entrypointd
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
            index  index.html;
        }
    }
  nginx.conf: |
    worker_processes  1;

    error_log /dev/stdout info;
    pid       /var/run/nginx/nginx.pid;

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
