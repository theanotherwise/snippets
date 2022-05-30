```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx
  namespace: nginx
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: nginx
rules:
  - apiGroups: [ "*" ]
    resources: [ "*" ]
    verbs: [ "*" ]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: nginx
  namespace: nginx
roleRef:
  kind: Role
  name: nginx
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: nginx
    apiGroup: ""
    namespace: nginx
```
