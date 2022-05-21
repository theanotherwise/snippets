```bash
kubectl config get-clusters
kubectl config delete-cluster

kubectl config get-users
kubectl config delete-user

kubectl config get-contexts
kubectl config delete-user

kubectl config use-context <context_name>
```

```bash
kubectl config set-context <context_name> \
                --cluster <cluster_name> \
                --user <user_name> \
                --namespace <namespace_name>

kubectl config set-context --current --namespace=<namespace_name>
```

```bash
kubectl config rename-context foo bar
kubectl config delete-context foo
```

```bash
kubectl config view --minify -o json
kubectl config view --minify -o yaml

kubectl config view --minify -o jsonpath='{}'
kubectl config view --minify -o jsonpath='{.clusters[].name}'
kubectl config view --minify -o jsonpath-as-json='{.clusters[].name}'
```
