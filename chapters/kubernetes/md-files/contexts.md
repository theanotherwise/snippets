```bash
# Clusters
kubectl config get-clusters
kubectl config delete-cluster
```

```bash
kubectl config current-context
kubectl config get-contexts

kubectl config set current-context es

kubectl config set-context --current --namespace=example

kubectl config rename-context foo bar
kubectl config delete-context foo
```
