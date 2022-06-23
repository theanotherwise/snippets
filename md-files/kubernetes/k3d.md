#### `PodSecurityPolicy` Enabled

```bash
k3d cluster create \
  --k3s-arg "--kube-apiserver-arg=enable-admission-plugins=NodeRestriction,PodSecurityPolicy,ServiceAccount" \
  --no-lb \
  seems-psp
```

#### Generic

```bash
k3d cluster create \
  --agents 6 \
  --servers 3 \
  --k3s-arg "--disable=traefik@server:*" \
  --k3s-arg "--disable=servicelb@server:*" \
  --k3s-arg "--disable=metrics-server@server:*" \
  --no-lb \
  seems
```
