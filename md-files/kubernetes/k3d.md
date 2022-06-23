```bash
k3d cluster create \
  --k3s-arg "--kube-apiserver-arg=enable-admission-plugins=NodeRestriction,PodSecurityPolicy,ServiceAccount" \
  --no-lb \
  seems-psp
```

```bash
k3d cluster create \
  --servers 3 \
  --agents 6 \
  --k3s-arg "--disable=traefik@server:*" \
  --k3s-arg "--disable=servicelb@server:*" \
  --k3s-arg "--disable=metrics-server@server:*" \
  --no-lb \
  seems
```

```bash
kubectl create namespace metallb-system

METALLB_CIDR=`docker network inspect k3d-seems | jq -r ".[0].IPAM.Config[0].Subnet" | awk -F'.' '{print $1"."$2"."$3"."240"/"29}'`

helm upgrade --install metallb metallb/metallb \
  --set configInline.address-pools\[0\].name=default,\
  --set configInline.address-pools\[0\].protocol=layer2 \
  --set configInline.address-pools\[0\].addresses\[0\]=${METALLB_CIDR} \
  --namespace metallb-system
```
