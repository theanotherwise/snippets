## General

| Type                         | Operator Namespace                               | Managed by Operator                     | 
|------------------------------|--------------------------------------------------|-----------------------------------------|
| Service CA                   | openshift-service-ca-operator                    | openshift-service-ca                    |
| DNS                          | openshift-dns-operator                           | openshift-dns                           |
| ETCD                         | openshift-etcd-operator                          | openshift-etcd                          |
| Ingress                      |                        |                        |
| Console                      | openshift-console-operator                       | openshift-console                       |
| Kube Scheduler               | openshift-kube-scheduler-operator                | openshift-kube-scheduler                |
| Kube Storage Version Migrate | openshift-kube-storage-version-migrator-operator | openshift-kube-storage-version-migrator |

## Authentication

| openshift-authentication-operator |
|-----------------------------------|
| openshift-authentication          |
| openshift-oauth-apiserver         |

## API Server

| Operator Namespace                | Managed by Operator      |
|-----------------------------------|--------------------------|
| openshift-apiserver-operator      | openshift-apiserver      |
| openshift-kube-apiserver-operator | openshift-kube-apiserver |

## Controll Manager

| Operator Namespace                         | Managed by Operator               |
|--------------------------------------------|-----------------------------------|
| openshift-controller-manager-operator      | openshift-controller-manager      |
| openshift-kube-controller-manager-operator | openshift-kube-controller-manager | 

## Ingress

| Operator Namespace         | Managed by Operator                        |
|----------------------------|--------------------------------------------|
| openshift-ingress-operator | openshift-ingress openshift-ingress-canary |
