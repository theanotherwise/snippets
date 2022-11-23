```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: wide
  namespace: "${NAMESPACE}"
---
apiVersion: v1
kind: Pod
metadata:
  name: wide
  namespace: "${NAMESPACE}"
spec:
  serviceAccount: wide
  securityContext:
    runAsNonRoot: true
    runAsUser: 1000
    runAsGroup: 1000
  containers:
    - name: wide
      image: alpine:latest
      command: [ "/bin/sh", "-c" ]
      securityContext:
        runAsUser: 1000
        runAsGroup: 1000
        runAsNonRoot: true
        allowPrivilegeEscalation: false
        privileged: false
      args:
        - |
          while true ; do
            true
          done
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: wide
rules:
  - apiGroups: [ "*" ]
    resources: [ "*" ]
    verbs: [ "*" ]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: wide
subjects:
  - kind: ServiceAccount
    name: wide
    namespace: workspace
roleRef:
  kind: ClusterRole
  name: wide
  apiGroup: rbac.authorization.k8s.io
```
