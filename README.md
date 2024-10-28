# Snippets

## Password

```bash
apt-get install pwgen xkcdpass -y

echo "$(pwgen 4 -c -n -y -s -1 -v)$(xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1)$(pwgen 4 -c -n -y -s -1 -v)"
```

## Content Table

| Group            | Name            | Documentation                                                     |
|------------------|-----------------|-------------------------------------------------------------------|
| Linux            | Networking      | - [IP](md-docs/Linux/Networking/1000.md)                          |
|                  |                 | - [iptables](md-docs/Linux/Networking/1001.md)                    |
|                  |                 | - [Firewalld](md-docs/Linux/Networking/1002.md)                   |
|                  | General         | - [General](md-docs/Linux/General/1000.md)                        |
|                  | Parsing         | - [Here Doc](md-docs/Linux/Parsing/1000.md)                       |
|                  | Setup           | - [CoreOS Ignition](md-docs/Linux/Setup/1000.md)                  |
|                  |                 | - [Luks Setup](md-docs/Linux/General/1001.md)                     |
|                  | RedHat          | - [Subscription Manager](md-docs/Linux/RedHat/1000.md)            |
| Cloud CLI        | Azure           | - [Storage Container SAS Token](md-docs/Cloud-CLI/Azure/1000.md)  |
|                  | Google          | - [Project / Account](md-docs/Cloud-CLI/Google/1000.md)           |
|                  |                 | - [Service Account](md-docs/Cloud-CLI/Google/1001.md)             |
|                  |                 | - [GKE Cluster](md-docs/Cloud-CLI/Google/1002.md)                 |
| Containerization | Docker          | - [General](md-docs/Containerization/Docker/1002.md)              |
|                  |                 | - [Cleanup](md-docs/Containerization/Docker/1000.md)              |
|                  |                 | - [Docker Compose Start](md-docs/Containerization/Docker/1001.md) |
|                  |                 | - [Docker Engine](md-docs/Containerization/Docker/1003.md)        |
| Virtualization   | KVM             | - [General](md-docs/Virtualization/KVM/1000.md)                   |
|                  | VMware          | - [General](md-docs/Virtualization/VMware/1000.md)                |
| IaC              | Terraform       | - [Usage](md-docs/IaC/Terraform/1000.md)                          |
| Kubernetes       | HashiCorp Vault | - [HashiCorp Vault](md-docs/Kubernetes/HashiCorpVault/1000.md)    |
| HTTP Servers     | Nginx           | - [Nginx Rewerite to Proxy](md-docs/HTTP-Servers/Nginx/1000.md)   |
|                  | Speedup         | - [Cleanup Pods](md-docs/Kubernetes/Speedup/1000.md)              |
|                  |                 | - [Patch](md-docs/Kubernetes/Speedup/1001.md)                     |
|                  | Openshift       | - [Debugging](md-docs/Kubernetes/Openshift/1000.md)               |
| Logging          | Logstash        | - [Detect Field Type](md-docs/Logging/Logstash/1000.md)           |
| Queues           | Kafka           | - [Performance tests](md-docs/Queues/Kafka/1000.md)               |
| YAML Templating  | Helm            | - [Double Range](md-docs/YAML-Templating/Helm/1000.md)            |
| Programming      | Ruby On Rails   | - [Comparison Functions](md-docs/Programming/RubyOnRails/1000.md) |
| Cracking         | TLS             | - [Browser TLS](md-docs/Cracking/TLS/1000.md)                     |
|                  | Passwords       | - [Hashcat Examples](md-docs/Cracking/Passwords/1000.md)          |
