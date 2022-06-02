```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: demo
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: demo-sa
  namespace: demo
---
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: psp-restricted
spec:
  privileged: false
  hostIPC: false
  hostNetwork: false
  hostPID: false
  readOnlyRootFilesystem: false
  allowPrivilegeEscalation: false
  seLinux:
    rule: RunAsAny
  runAsUser:
    rule: MustRunAsNonRoot
  runAsGroup:
    rule: MustRunAs
    ranges:
      - min: 1
        max: 65534
  supplementalGroups:
    rule: MustRunAs
    ranges:
      - min: 1
        max: 65535
  fsGroup:
    rule: MustRunAs
    ranges:
      - min: 1
        max: 65535
  volumes:
    - '*'
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo:use:psp-restricted
rules:
  - apiGroups: [ "extensions" ]
    resources: [ "podsecuritypolicies" ]
    verbs: [ "use" ]
    resourceNames: [ "psp-restricted" ]
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo:use:psp-restricted-group:system:authenticated
roleRef:
  kind: ClusterRole
  name: demo:use:psp-restricted
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: Group
    name: system:authenticated
    apiGroup: rbac.authorization.k8s.io
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo:edit-sa:demo-sa
roleRef:
  kind: ClusterRole
  name: edit
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: demo-sa
    namespace: demo
```
