![image](https://user-images.githubusercontent.com/9096064/206935411-e64a22c4-0cb5-411a-ad35-20f266568472.png)

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: app
  labels:
    istio-injection: enabled
---
apiVersion: v1
kind: Service
metadata:
  name: backend
  namespace: app
spec:
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-v1
  namespace: app
  labels:
    app: backend
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
      version: v1
  template:
    metadata:
      labels:
        app: backend
        version: v1
    spec:
      initContainers:
        - name: init
          image: seemscloud/debug
          command: [ "/bin/bash", "-c" ]
          env:
            - name: VERSION
              value: "v1"
          args:
            - |-
              echo "${VERSION}" >/html/index.html;
          volumeMounts:
            - mountPath: /html
              name: html
      containers:
        - name: backend
          image: nginx:latest
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
      volumes:
        - name: html
          emptyDir: { }
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-v2
  namespace: app
  labels:
    app: backend
    version: v2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
      version: v2
  template:
    metadata:
      labels:
        app: backend
        version: v2
    spec:
      initContainers:
        - name: init
          image: seemscloud/debug
          command: [ "/bin/bash", "-c" ]
          env:
            - name: VERSION
              value: "v2"
          args:
            - |-
              echo "${VERSION}" >/html/index.html;
          volumeMounts:
            - mountPath: /html
              name: html
      containers:
        - name: backend
          image: nginx:latest
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
      volumes:
        - name: html
          emptyDir: { }
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
  namespace: app
spec:
  selector:
    app: frontend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend-v1
  namespace: app
  labels:
    app: frontend
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
      version: v1
  template:
    metadata:
      labels:
        app: frontend
        version: v1
    spec:
      containers:
        - name: curl
          image: seemscloud/debug:latest
          workingDir: /tmp
          command: [ "/bin/bash", "-c" ]
          env:
            - name: VERSION
              value: v1
          args:
            - |-
              cat >format.txt <<EndOfMessage
              Statistics:\n
                       http_code:  %{http_code}\n
                 time_namelookup:  %{time_namelookup}s\n
                    time_connect:  %{time_connect}s\n
                 time_appconnect:  %{time_appconnect}s\n
                time_pretransfer:  %{time_pretransfer}s\n
                   time_redirect:  %{time_redirect}s\n
              time_starttransfer:  %{time_starttransfer}s\n
                                   ----------\n
                      time_total:  %{time_total}s\n
              ----------\n\n
              EndOfMessage
              
              while true ; do
                BACKEND="$(curl http://backend:80/ -w "@format.txt" --silent)"
              
                echo -e "Backend:\t${BACKEND}" > index.html;
                echo -e "Frontend:\t${VERSION}" >> index.html;
              
                mv index.html /usr/share/nginx/html/index.html;
                sleep 1;
              done
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
        - name: frontend
          image: nginx:latest
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
      volumes:
        - name: html
          emptyDir: { }
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend-v2
  namespace: app
  labels:
    app: frontend
    version: v2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
      version: v2
  template:
    metadata:
      labels:
        app: frontend
        version: v2
    spec:
      containers:
        - name: curl
          image: seemscloud/debug:latest
          workingDir: /tmp
          command: [ "/bin/bash", "-c" ]
          env:
            - name: VERSION
              value: v2
          args:
            - |-
              cat >format.txt <<EndOfMessage
              Statistics:\n
                       http_code:  %{http_code}\n
                 time_namelookup:  %{time_namelookup}s\n
                    time_connect:  %{time_connect}s\n
                 time_appconnect:  %{time_appconnect}s\n
                time_pretransfer:  %{time_pretransfer}s\n
                   time_redirect:  %{time_redirect}s\n
              time_starttransfer:  %{time_starttransfer}s\n
                                   ----------\n
                      time_total:  %{time_total}s\n
              ----------\n\n
              EndOfMessage
              
              while true ; do
                BACKEND="$(curl http://backend:80/ -w "@format.txt" --silent)"
              
                echo -e "Backend:\t${BACKEND}" > index.html;
                echo -e "Frontend:\t${VERSION}" >> index.html;
              
                mv index.html /usr/share/nginx/html/index.html;
                sleep 1;
              done
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
        - name: frontend
          image: nginx:latest
          volumeMounts:
            - mountPath: /usr/share/nginx/html
              name: html
      volumes:
        - name: html
          emptyDir: { }
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: user
  namespace: app
  labels:
    app: user
spec:
  replicas: 1
  selector:
    matchLabels:
      app: user
  template:
    metadata:
      labels:
        app: user
    spec:
      containers:
        - name: user
          image: seemscloud/debug:latest
          workingDir: /tmp/debug
          command: [ "/bin/bash", "-c" ]
          args:
            - |-
              cat >format.txt <<EndOfMessage
              Statistics:\n
                       http_code:  %{http_code}\n
                 time_namelookup:  %{time_namelookup}s\n
                    time_connect:  %{time_connect}s\n
                 time_appconnect:  %{time_appconnect}s\n
                time_pretransfer:  %{time_pretransfer}s\n
                   time_redirect:  %{time_redirect}s\n
              time_starttransfer:  %{time_starttransfer}s\n
                                   ----------\n
                      time_total:  %{time_total}s\n
              ----------\n\n
              EndOfMessage
              
              while true ; do
                DATETIME="$(date +"%Y-%m-%d %H:%M:%S")"

                curl "http://frontend:80" -w "@format.txt" -sS > response.txt 2>&1;
                echo -e "${DATETIME}\n\n" >> response.txt 
                cat response.txt > /proc/1/fd/1
                sleep 1;
              done
```
