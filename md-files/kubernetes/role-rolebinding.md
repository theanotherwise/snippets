```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: demo-sa
  namespace: demo
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo-role
  namespace: demo
rules:
  - apiGroups: [ "*" ]
    resources: [ "*" ]
    verbs: [ "*" ]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo-rolebinding
  namespace: demo
roleRef:
  kind: Role
  name: demo-role
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: demo-sa
    apiGroup: ""
    namespace: demo
```
