```bash
k3d cluster create \
  --k3s-arg "--kube-apiserver-arg=enable-admission-plugins=NodeRestriction,PodSecurityPolicy,ServiceAccount" \
  seems
```

```bash
k3d cluster create \
  --agents 6 \
  --servers 3 \
  --port 8080:80@loadbalancer \
  --port 8443:443@loadbalancer \
  seems
```
