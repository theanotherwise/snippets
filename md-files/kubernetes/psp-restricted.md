```yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: nginx
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
```
