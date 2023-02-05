```bash
kubectl get pods -A | grep -Ev "Completed" | grep -Eiv "1/1|2/2|5/5|3/3|4/4|6/6"
```

```bash
kubectl delete pods --field-selector status.phase=Succeeded -A
```

### GET

```bash
kubectl delete pods --field-selector status.phase=Pending -A
kubectl delete pods --field-selector status.phase=Failed -A
kubectl delete pods --field-selector status.phase=Unknown -A
```

### Delete 

```bash
kubectl delete pods --field-selector status.phase=Pending -A
kubectl delete pods --field-selector status.phase=Failed -A
kubectl delete pods --field-selector status.phase=Unknown -A
```
