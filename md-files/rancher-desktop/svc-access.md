```bash
echo -e "HTTP (Node Port):\t`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[0].nodePort'`"
echo -e "HTTPS (Node Port):\t`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[1].nodePort'`"
```

```bash
kubectl -n kube-system delete svc traefik-dashboard
kubectl -n kube-system delete ingress traefik-dashboard

kubectl -n kube-system expose deployment/traefik \
                       --port=9000 --target-port=9000 \
                       --name=traefik-dashboard

kubectl -n kube-system create ingress traefik-dashboard \
                              --rule="dashboard.traefik.127.0.0.1.sslip.io/*=traefik-dashboard:9000"
```
