```bash
kubectl config current-context
kubectl config get-contexts

# Set Context Namespace
kubectl config set-context --current --namespace=example

# Switch Context
kubectl config set current-context es

kubectl config rename-context foo bar
kubectl config delete-context foo
```
