```bash
kubectl auth can-i \
  --as=system:serviceaccount:psp-demo:default \
  get pods
```
