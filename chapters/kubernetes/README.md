* ### [Contexts](md-files/contexts.md)

### Patching

#### patch via file
```bash
# jq '.spec.replicas = 3'
kubectl get statefulsets -o json NAME

kubectl patch statefulsets --patch-file patch.json NAME
```

#### Patch in line
```
kubectl patch statefulsets -p '{"spec":{"replicas":3}}' NAME
```
