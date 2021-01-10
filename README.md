# Snippets

## General
* [ip](md-files/ip.md)
* [Linux](md-files/linux.md)
* [Cryptsetup](md-files/cryptsetup.md)
* [git](md-files/git.md)
* [Docker](md-files/docker.md)
* [bitcoin-cli](md-files/bitcoin-cli.md)
* Kubernetes
  * [Namespace Stuck on Termintaing](md-files/namespace-stuck-on-termintaing.md)
* [Text Processing](md-files/text-processing.md)
* [Encoding / Decoding](md-files/encoding-decoding.md)
* [Elasticsearch](md-files/elasticsearch.md)
* [OpenVPN](md-files/openvpn.md)
* Ruby on Rails
  * [General](md-files/ruby-on-rails-general.md)
  * [Database](md-files/ruby-on-rails-database.md)
  * [Active Record Migration](md-files/ruby-on-rails-active-record-migration.md)
  * [Logger](md-files/ruby-on-rails-logger.md)
  * [API](md-files/ruby-on-rails-api.md)
  * [Page Fix](md-files/ruby-on-rails-page-fix.md)
 * Red Hat Enterprise Linux
  * [Subscription Manager](md-files/subscription-manager.md)

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
