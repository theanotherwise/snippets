```bash
kubectl proxy

kubectl get namespace example -o json > example.json
```

`}, "spec": { "finalizers": [ "kubernetes" ] },` -> `}, "spec": { "finalizers": [ ] },`

```bash
curl --insecure \
     --header "Content-Type: application/json" \
     --request PUT \
     --data-binary @example.json \
     http://127.0.0.1:8001/api/v1/namespaces/example/finalize
```
