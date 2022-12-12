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
  name: debug
spec:
  terminationGracePeriodSeconds: 1
  securityContext:
    runAsNonRoot: false
    runAsUser: 0
    runAsGroup: 0
    fsGroup: 0
  containers:
    - name: debug
      image: seemscloud/debug:latest
      imagePullPolicy: Always
      securityContext:
        runAsNonRoot: false
        runAsUser: 0
        runAsGroup: 0
        allowPrivilegeEscalation: true
        privileged: true
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
