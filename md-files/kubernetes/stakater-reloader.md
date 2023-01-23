```bash
kubectl label namespace default "stakaterReloader=enabled"

helm upgrade --install reloader stakater/reloader \
  --set fullnameOverride="reloader" \
  --set reloader.watchGlobally="true" \
  --set reloader.reloadOnCreate="true" \
  --set reloader.isOpenshift="false" \
  --set namespaceSelector="stakaterReloader=enabled"
```

```bash
kubectl apply -f - << "EndOfMessage"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    app: nginx
  annotations:
    configmap.reloader.stakater.com/reload: "nginx"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          volumeMounts:
            - mountPath: /etc/nginx/conf.d/default.conf
              name: config
              subPath: default.conf
      volumes:
        - name: config
          configMap:
            name: nginx
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx
data:
  default.conf: |
    server {
        listen       8081;

        location / {
            root   /usr/share/nginx/html;
            index  index.html;
        }
    }
EndOfMessage
```
