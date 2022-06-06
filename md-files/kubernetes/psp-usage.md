`psp.yaml`
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

`pod.yaml`
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: demo
  namespace: demo
spec:
  serviceAccount: demo-sa
  serviceAccountName: demo-sa
  automountServiceAccountToken: true
  securityContext:
    runAsUser: 0
    runAsGroup: 0
    fsGroup: 0
    runAsNonRoot: false
  containers:
    - name: demo
      image: bitnami/kubectl
      command: [ "/bin/bash", "-c" ]
      args: [ "sleep 3600" ]
      securityContext:
        runAsUser: 0
        runAsGroup: 0
        runAsNonRoot: false
        privileged: false
        readOnlyRootFilesystem: true
        allowPrivilegeEscalation: false
```

```bash
 kubectl  apply -f psp.yaml
 kubectl  apply --as-group=system:authenticated --as=system:serviceaccount:demo:demo-sa -f pod.yaml
```

```yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: permissive
  annotations:
    seccomp.security.alpha.kubernetes.io/allowedProfileNames: '*'
spec:
  privileged: true
  allowPrivilegeEscalation: true
  allowedCapabilities:
  - '*'
  volumes:
  - '*'
  hostNetwork: true
  hostPorts:
  - min: 0
    max: 65535
  hostIPC: true
  hostPID: true
  runAsUser:
    rule: 'RunAsAny'
  seLinux:
    rule: 'RunAsAny'
  supplementalGroups:
    rule: 'RunAsAny'
  fsGroup:
    rule: 'RunAsAny'
---
# A ClusterRole that allows using the permissive PSP above
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: permissive-psp
rules:
- apiGroups:
  - policy
  resourceNames:
  - permissive
  resources:
  - podsecuritypolicies
  verbs:
  - use
---
# Allow all service accounts in kube-system to use the permissive PSP
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: permissive-psp
  namespace: kube-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: permissive-psp
subjects:
- kind: Group
  name: system:serviceaccounts
```
