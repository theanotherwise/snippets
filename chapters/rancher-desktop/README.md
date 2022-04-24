### Node Port
```bash
export CLUSTERHTTP="`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[0].nodePort'`"
export CLUSTERHTTPS="`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[1].nodePort'`"

echo -e "HTTP:\t${CLUSTERHTTP}"
echo -e "HTTPS:\t${CLUSTERHTTPS}"
```

### Traefik Dashboard

#### Delete
```bash
kubectl -n kube-system delete svc traefik-dashboard
kubectl -n kube-system delete ingress traefik-dashboard
```

#### Create
```bash
kubectl expose deploy/traefik -n kube-system --port=9000 --target-port=9000 --name=traefik-dashboard
kubectl create ingress traefik-dashboard --rule="dashboard.traefik.127.0.0.1.sslip.io/*=traefik-dashboard:9000"
```

```bash
curl -si http://dashboard.traefik.127.0.0.1.sslip.io:$CLUSTERHTTP/dashboard/ 
echo http://dashboard.traefik.127.0.0.1.sslip.io:$CLUSTERHTTP/dashboard/
```
