```bash
kubectl config get-clusters
kubectl config delete-cluster

kubectl config get-users
kubectl config delete-user

kubectl config get-contexts
kubectl config delete-user
```

```bash
kubectl config use-context <context_name>

kubectl config set-context --current --namespace=<namespace_name>

kubectl config set-context <context_name> \
                --cluster <cluster_name> \
                --user <user_name> \
                --namespace <namespace_name>
```

```bash
kubectl config rename-context foo bar
kubectl config delete-context foo
```

```bash
kubectl config view --minify --output json --raw
kubectl config view --minify --output yaml --raw

kubectl config view --minify --output jsonpath='{}' --raw
kubectl config view --minify --output jsonpath='{.clusters[].name}' --raw
kubectl config view --minify --output jsonpath-as-json='{.clusters[].name}' --raw
```
