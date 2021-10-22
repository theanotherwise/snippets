# Snippets

## General
* [ip](md-files/ip.md)
* Linux
  * [General](md-files/linux.md)
  * [systemd](md-files/linux-systemd.md)
* [Cryptsetup](md-files/cryptsetup.md)
* [git](md-files/git.md)
* Docker
  * [General](md-files/docker-general.md)
  * [PostgreSQL](md-files/docker-postgresql.md)
  * [Drupal](md-files/docker-drupal.md)
* [bitcoin-cli](md-files/bitcoin-cli.md)
* Kubernetes
  * [Contexts](md-files/kubernetes/contexts.md)
  * [Affinity](md-files/kubernetes/affinity.md)
  * [Namespace Stuck on Termintaing](md-files/kubernetes/namespace-stuck-on-termintaing.md)
* [Text Processing](md-files/text-processing.md)
* [Encoding / Decoding](md-files/encoding-decoding.md)
* Jenkins
  * [API Usage](md-files/jenkins-api-usage.md)
* Elasticsearch
  * [Convention](md-files/elasticsearch-convention.md)
  * [General](md-files/elasticsearch.md)
  * [Fetch Parse](md-files/elasticsearch-fetch-parse.md)
* [OpenVPN](md-files/openvpn.md)
* Ruby on Rails
  * [General](md-files/ruby-on-rails-general.md)
  * [Database](md-files/ruby-on-rails-database.md)
  * [Active Record Migration](md-files/ruby-on-rails-active-record-migration.md)
  * [Logger](md-files/ruby-on-rails-logger.md)
  * [API](md-files/ruby-on-rails-api.md)
  * [Page Fix](md-files/ruby-on-rails-page-fix.md)
* Red Hat Enterprise Linux
  * [Subscription Manager](md-files/rhel-subscription-manager.md)
* Windows
  * [Windows Subsystem for Linux](md-files/windows-wsl.md)
* Apache2
  * [MPM](md-files/apache2-mpm.md)
* [Internal DNS](md-files/internal-dns.md)
* Wordlists
  * [Log Keyworlds](md-files/log-keywords.md)

## Firewall

* [iptables](md-files/iptables.md)
* [firewalld](md-files/firewalld.md)
* [iptables Diagram](md-files/iptables-diagram.md)
* [MikroTik Firewall Diagram](md-files/mikrotik-firewall-diagram.md)

# Password
```bash
sudo -i apt-get install pwgen xkcdpass -y

echo "`pwgen 4 -c -n -y -s -1 -v``xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1``pwgen 4 -c -n -y -s -1 -v`"
```
