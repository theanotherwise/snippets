```bash
# Global
kubectl get ingresses.config.openshift.io/cluster

# Ingress Controller
kubectl get -n openshift-ingress-operator ingresscontrollers.operator.openshift.io
kubectl get -n openshift-ingress-operator deployment
kubectl get -n openshift-ingress-operator pod
kubectl get -n openshift-ingress-operator cm

# Ingress Class
kubectl get ingressclasses.networking.k8s.io
kubectl get -n openshift-ingress deployment
kubectl get -n openshift-ingress pods
kubectl get -n openshift-ingress cm

# Ingress
kubectl get ingress
```
