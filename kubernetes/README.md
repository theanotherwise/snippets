# Kubernetes

## Prepare cluster
```bash
systemctl stop kubelet
systemctl stop docker

kubeadm reset -f

apt-get autoremove --purge -y docker.io kubeadm kubelet kubectl

rm -rf /etc/kubernetes /var/lib/etcd /var/lib/cni/ /etc/cni/ /opt/cni /var/lib/kubelet /usr/libexec/kubernetes

apt-get install -y docker.io kubeadm kubelet kubectl

systemctl enable docker
systemctl enable kubelet

systemctl start docker
systemctl start docker
```

```bash
kubeadm init --pod-network-cidr=10.10.0.0/16

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown root:root $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

## Management
```bash
kubectl get all --all-namespaces
```

```bash
kubectl get nodes
kubectl get pods --all-namespaces -o wide
kubectl get services --all-namespaces -o wide
kubectl get deployments --all-namespaces -o wide
```

```bash
kubectl delete -n NAMESPACE deployment DEPLOYMENT
```

```bash
kubectl taint nodes --all node-role.kubernetes.io/master-
```

# Joine node

```bash
kubeadm token generate
```

```bash
kubeadm join XXX.XXX.XXX.XXX:6443 --token XXX --discovery-token-ca-cert-hash sha256:XXX
```

```bash
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
```
