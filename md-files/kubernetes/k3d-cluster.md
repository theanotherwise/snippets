```bash
CLUSTER_NAME="seems"

k3d cluster delete "${CLUSTER_NAME}"

k3d cluster create \
  --servers 3 \
  --agents 3 \
  --k3s-arg "--cluster-cidr=10.100.0.0/16@server:*" \
  --k3s-arg "--service-cidr=10.200.0.0/16@server:*" \
  --k3s-arg "--disable=traefik@server:*" \
  --k3s-arg "--disable=servicelb@server:*" \
  --k3s-arg "--disable=metrics-server@server:*" \
  --no-lb
  ${CLUSTER_NAME}
  
#  -v /tmp/longhorn:/var/lib/longhorn:shared \
#  -v /etc/iscsi:/etc/iscsi \
#  -v /sbin/iscsiadm:/sbin/iscsiadm \
```

```bash
kubectl create namespace workspace

kubectl config set-context k3d-${CLUSTER_NAME}-workspace \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace workspace

kubectl config use-context k3d-${CLUSTER_NAME}-workspace

kubectl config delete-context k3d-${CLUSTER_NAME}

kubectl config set-context k3d-${CLUSTER_NAME}-default \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace kube-default
                
kubectl config set-context k3d-${CLUSTER_NAME}-kube-system \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace kube-system

kubectl config set-context k3d-${CLUSTER_NAME}-metallb-system \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace metallb-system
                
kubectl config set-context k3d-${CLUSTER_NAME}-cert-manager-system \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace cert-manager-system
                
kubectl config set-context k3d-${CLUSTER_NAME}-longhorn-system \
                --cluster k3d-${CLUSTER_NAME} \
                --user admin@k3d-${CLUSTER_NAME} \
                --namespace longhorn-system
```

```bash
helm repo add metallb https://metallb.github.io/metallb
helm repo update

kubectl create namespace metallb-system

METALLB_CIDR=`docker network inspect k3d-${CLUSTER_NAME} | jq -r ".[0].IPAM.Config[0].Subnet" | awk -F'.' '{print $1"."$2"."$3"."240"/"29}'`

helm upgrade --install metallb metallb/metallb \
  --set configInline.address-pools\[0\].name=default,\
  --set configInline.address-pools\[0\].protocol=layer2 \
  --set configInline.address-pools\[0\].addresses\[0\]=${METALLB_CIDR} \
  --namespace metallb-system
```

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cert-manager-system

helm upgrade --install cert-manager jetstack/cert-manager \
  --version v1.7.2 \
  --namespace cert-manager-system \
  --set installCRDs=true
```

#### Not Working with K3d

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update

kubectl create namespace longhorn-system

helm upgrade --install longhorn longhorn/longhorn \
  --version 1.3.0 \
  --namespace longhorn-system \
  --set service.ui.type=LoadBalancer \
  --set service.manager.type=LoadBalancer
```
