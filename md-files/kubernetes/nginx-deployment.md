```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx
automountServiceAccountToken: true
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  serviceAccountName: nginx
  automountServiceAccountToken: true
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - name: http
          containerPort: 8080
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
          subPath: index.html
          mountPath: /usr/share/nginx/html/index.html
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
  index.html: |
    Hello World!
---
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
```
