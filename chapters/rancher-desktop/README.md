```bash
export CLUSTERIP=127.0.0.1
export CLUSTERHTTP=`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[0].nodePort'`
export CLUSTERHTTPS=`kubectl get service -n kube-system traefik -o json | jq '.spec.ports[1].nodePort'`

kubectl config set-context --current --namespace kube-system

kubectl expose deploy/traefik -n kube-system --port=9000 --target-port=9000 --name=traefik-dashboard
kubectl create ingress traefik-dashboard --rule="dashboard.traefik.$CLUSTERIP.sslip.io/*=traefik-dashboard:9000"
```

```bash
curl -si http://dashboard.traefik.$CLUSTERIP.sslip.io:$CLUSTERHTTP/dashboard/ 
echo http://dashboard.traefik.$CLUSTERIP.sslip.io:$CLUSTERHTTP/dashboard/
```
