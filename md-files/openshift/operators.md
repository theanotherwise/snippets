## General

| Type                         | Operator Namespace                               | Managed by Operator                     | 
|------------------------------|--------------------------------------------------|-----------------------------------------|
| Service CA                   | openshift-service-ca-operator                    | openshift-service-ca                    |
| DNS                          | openshift-dns-operator                           | openshift-dns                           |
| ETCD                         | openshift-etcd-operator                          | openshift-etcd                          |
| Ingress                      | openshift-ingress-operator                       | openshift-ingress                       |
| Console                      | openshift-console-operator                       | openshift-console                       |
| Kube Scheduler               | openshift-kube-scheduler-operator                | openshift-kube-scheduler                |
| Kube Storage Version Migrate | openshift-kube-storage-version-migrator-operator | openshift-kube-storage-version-migrator |

## Authentication

| openshift-authentication-operator |
|-----------------------------------|
| openshift-authentication          |
| openshift-oauth-apiserver         |

## API Server

| openshift-apiserver-operator | openshift-kube-apiserver-operator |
|------------------------------|-----------------------------------|
| openshift-apiserver          | openshift-kube-apiserver          |

## Controll Manager

| openshift-controller-manager-operator | openshift-kube-controller-manager-operator |
|---------------------------------------|--------------------------------------------|
| openshift-controller-manager          | openshift-kube-controller-manager          |
