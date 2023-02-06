## General

| Type                         | Operator Namespace                               | Managed by Operator                     | 
|------------------------------|--------------------------------------------------|-----------------------------------------|
| Service CA                   | openshift-service-ca-operator                    | openshift-service-ca                    |
| API Server                   | openshift-apiserver-operator                     | openshift-apiserver                     |
| DNS                          | openshift-dns-operator                           | openshift-dns                           |
| ETCD                         | openshift-etcd-operator                          | openshift-etcd                          |
| Ingress                      | openshift-ingress-operator                       | openshift-ingress                       |
| Console                      | openshift-console-operator                       | openshift-console                       |
| Controller Manager           | openshift-controller-manager-operator            | openshift-controller-manager            |
| Kube API Server              | openshift-kube-apiserver-operator                | openshift-kube-apiserver                |
| Kube Scheduler               | openshift-kube-scheduler-operator                | openshift-kube-scheduler                |
| Kube Controller Manager      | openshift-kube-controller-manager-operator       | openshift-kube-controller-manager       |
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
