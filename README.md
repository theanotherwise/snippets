# Snippets

* [Docker](chapters/docker)
* [Elasticsearch](chapters/elasticsearch)
* [Firewall](chapters/firewall)
* [Jenkins](chapters/jenkins)
* [KDE Plasma](chapters/kde-plasma)
* [Kubernetes](chapters/kubernetes)
* [Linux](chapters/linux)
* [OpenVPN](chapters/openvpn)
* [Others](chapters/others)
* [PHP](chapters/php)
* [PostgreSQL](chapters/postgresql)
* [Ruby on Rails](chapters/ruby-on-rails)

## Password

```bash
sudo -i apt-get install pwgen xkcdpass -y

echo "`pwgen 4 -c -n -y -s -1 -v``xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1``pwgen 4 -c -n -y -s -1 -v`"
```
