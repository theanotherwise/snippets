```bash
k3d cluster create seems --k3s-arg "--kube-apiserver-arg=enable-admission-plugins=NodeRestriction,PodSecurityPolicy,ServiceAccount" --no-lb
```
