```bash
kubectl auth can-i \
  --as=system:serviceaccount:NAMESPACE:SERVICEACCOUNT \
  get pods
```
