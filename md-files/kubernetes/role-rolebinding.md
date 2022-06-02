```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: demo-sa
  namespace: nginx
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo-role
rules:
  - apiGroups: [ "*" ]
    resources: [ "*" ]
    verbs: [ "*" ]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo-rolebinding
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
