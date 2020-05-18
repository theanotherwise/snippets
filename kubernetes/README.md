# Kubernetes

```bash
kubectl get all --all-namespaces
```

```bash
kubectl get pods --all-namespaces
kubectl get services --all-namespaces
kubectl get deployments --all-namespaces
```

```bash
kubectl delete -n NAMESPACE deployment DEPLOYMENT
```

```bash
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
```
