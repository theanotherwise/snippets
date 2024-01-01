# Openshfit Debugging

## Install Status

#### General

```bash
oc get clusterversion

oc get clusterversion -o json | jq -r '.items[].status.conditions[]'
```

```bash
oc get clusteroperators.config.openshift.io

oc get clusteroperators.config.openshift.io openshift-apiserver -o yaml | grep "not ready"
```

```bash
oc api-resources

oc api-resources 2>&1  | grep -Ei "error.*" | grep -Po "[a-zA-Z0-9]*\.[a-zA-Z0-9]*\.[a-zA-Z0-9]*/[a-zA-Z0-9]*"
```

```bash
oc projects --loglevel=8
```

#### Gahter Logs

```bash
oc adm must-gather
```

```bash
openshift-install gather bootstrap --dir install_dir/

openshift-install gather bootstrap \
  --dir install_dir/ \
  --bootstrap bootstrap-0.seems.cloud \
  --master master-0.seems.cloud \
  --master master-0.seems.cloud \
  --master master-0.seems.cloud
```

#### Ignition Files

```bash
oc get machineconfigpools
oc get machineconfig
```

## Auth via `htpasswd` Provider

```
htpasswd -c -B -b users.htpasswd testuser testpassword

oc create secret generic htpass-secret \
  -n openshift-config \
  --from-file=htpasswd=users.htpasswd

oc apply -f - << EndOfMessage
apiVersion: config.openshift.io/v1
kind: OAuth
metadata:
  name: cluster
spec:
  identityProviders:
  - name: htpasswd_provider 
    mappingMethod: claim 
    type: HTPasswd
    htpasswd:
      fileData:
        name: htpass-secret
EndOfMessage
```

## Openshift Ingress

```bash
kubectl get ingresscontrollers \
  -n openshift-ingress-operator default
```

```bash
kubectl get pods \
  -n openshift-ingress

kubectl delete pods \
  -n openshift-ingress \
  -l ingresscontroller.operator.openshift.io/deployment-ingresscontroller=default \
  --force

kubectl logs \
  -n openshift-ingress \
  -l ingresscontroller.operator.openshift.io/deployment-ingresscontroller=default --follow
```
