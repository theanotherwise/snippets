### Node Port
```bash
export CLUSTERHTTP="`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[0].nodePort'`"
export CLUSTERHTTPS="`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[1].nodePort'`"

echo -e "HTTP (Node Port):\t${CLUSTERHTTP}"
echo -e "HTTPS (Node Port):\t${CLUSTERHTTPS}"
```

### Traefik Dashboard
```bash
kubectl -n kube-system delete svc traefik-dashboard
kubectl -n kube-system delete ingress traefik-dashboard

kubectl -n kube-system expose deploy/traefik \
                       --port=9000 \
                       --target-port=9000 \
                       --name=traefik-dashboard

kubectl -n kube-system create ingress traefik-dashboard \
                              --rule="dashboard.traefik.127.0.0.1.sslip.io/*=traefik-dashboard:9000"
```
