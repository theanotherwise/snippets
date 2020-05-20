# Kubernetes

```bash
apt-get autoremove --purge -y docker.io kubeadm kubelet kubectl

apt-get install -y docker.io kubeadm kubelet kubectl

systemctl enable docker && systemctl restart docker
```

```bash
kubeadm init --pod-network-cidr=10.10.0.0/16
```

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
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
```
