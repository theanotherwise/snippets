# Snippets

```bash
apt-get install pwgen xkcdpass -y

echo "`pwgen 4 -c -n -y -s -1 -v``xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1``pwgen 4 -c -n -y -s -1 -v`"
```

## Index

- Azure CLI
  - [Upload to Storage](md-files/azure-cli/upload-to-storage.md)
- KVM
  - [General](md-files/kvm/general.md)
- Google Cloud
  - [Initialize Console](md-files/google-cloud/init-console.md)
- WSL
  - [General](md-files/wsl/general.md)
  - [Enable / Disable](md-files/wsl/enable-disable.md)
  - [Windows C:\Users\<username>\.wslconfig](md-files/wsl/windows-wslconfig.md)
  - [Subsystem /etc/wsl.conf](md-files/wsl/subsystem-wslconf.md)
- Docker
  - [General](md-files/docker/general.md)
  - [Cleanup](md-files/docker/cleanup.md)
  - [Docker Compose](md-files/docker/docker-compose.md)
  - [Docker Engine](md-files/docker/settings.md)
- Firewalls
  - [`iptables`](md-files/firewalls/iptables.md)
  - [Firewalld](md-files/firewalls/firewalld.md)
- TLS
  - [`tls` decrypt](md-files/tls/decrypt.md)
- Helm
  - [Double Range](md-files/helm/double-range.md)
  - [Opensearch Dashboards Reports](md-files/helm/osd-reports.md)
- Logstash
  - [Nested Value in Field NAme Instead Field Value](md-files/logstash/extract-nexted.md)
- Kafka
  - [Performance tests](md-files/kafka/performance-tests.md)
- CSS
  - [Footer on Bottom](md-files/css/footer-on-bottom.md)
- K3d
  - [PSP](md-files/k3d/psp.md)
  - [Export/Import Image](md-files/k3d/export-import-image.md)
- Kubernetes
  - [Fast Track](md-files/kubernetes/fast-track.md)
  - [Contexsts](md-files/kubernetes/contexts.md)
  - [Cluster Wide](md-files/kubernetes/cluster-wide.md)
  - [Patch Resource](md-files/kubernetes/patch-resource.md)
  - [PSP Usage](md-files/kubernetes/psp-usage.md)
  - [Role RoleBinding](md-files/kubernetes/role-rolebinding.md)
  - [Nginx Short Deployment](md-files/kubernetes/nginx-short-deployment.md)
  - [Nginx Custom Deployment](md-files/kubernetes/nginx-custom-deployment.md)
  - [Find Service Account Bindings](md-files/kubernetes/find-service-account-bindings.md)
  - [Test Service Account](md-files/kubernetes/test-service-account.md)
- Maven
  - [Build / Deploy](md-files/maven/build-deploy.md)
- Linux
  - [General](md-files/linux/general.md)
  - [Curl Time details](md-files/linux/curl-time-details.md)
  - [XXD](md-files/linux/xxd.md)
  - [Here Doc](md-files/linux/here-doc.md)
  - [Swap File](md-files/linux/swap.md)
  - [`ip`](md-files/linux/ip.md)
  - [Root CA](md-files/linux/root-ca.md)
  - [Crypto Setup](md-files/linux/crypt-setup.md)
  - [systemd](md-files/linux/systemd.md)
  - [Subscription Manager](md-files/linux/subscription-manager.md)
- Nodejs
   - [Node Mailer](md-files/nodejs/nodemailer.md)
   - [Vue Server](md-files/nodejs/vue-server.md)
- Ruby
   - [Rails Server](md-files/ruby/rails-server.md)
   - [Comparsion Functions](md-files/ruby/comparsion-functions.md)
- VMware
  - [VMware Shrink VMDK](md-files/vmware/shrink-vmdk.md)
- Jenkins
  - [API Usage](md-files/jenkins/api-usage.md)
- Opensearch
  - [ISM Policy](md-files/opensearch/ism-policy.md)
- Apache2
  - [Apache2 MPM](md-files/apache2/mpm.md)
- Rancher Desktop
  - [SVC Access](md-files/rancher-desktop/svc-access.md)
