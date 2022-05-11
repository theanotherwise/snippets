* ### [Contexts](md-files/contexts.md)

```bash
kubectl get statefulsets -o json observability-opensearch-master > to_patch.json

cat to_patch.json | jq '.spec.replicas = 3' > patch.json

kubectl patch statefulsets --patch-file patch.json observability-opensearch-master
```

```
kubectl patch deployment -p '{"spec":{"replicas":3}}' nginx 
```
