```bash
# jq '.spec.replicas = 3'
kubectl get statefulsets -o json NAME

kubectl patch statefulsets --patch-file patch.json NAME
```

```
kubectl patch statefulsets -p '{"spec":{"replicas":3}}' NAME
```