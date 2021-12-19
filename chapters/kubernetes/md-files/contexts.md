```bash
kubectl config get-clusters
kubectl config delete-cluster

kubectl config get-users
kubectl config delete-user

kubectl config get-contexts
kubectl config delete-user

kubectl config use-context context_name
```

```bash
kubectl config set-context CONTEXT --cluster CLUSTER --user USER --namespace NAMESPACE

kubectl config set-context --current --namespace=example
```
```bash
kubectl config rename-context foo bar
kubectl config delete-context foo
```
