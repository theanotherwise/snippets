# Snippets

* [Cryptsetup](md-files/cryptsetup.md)
* [Docker](md-files/docker.md)
* [Linux](md-files/linux.md)
* [Text Processing](md-files/text-processing.md)
* [Encoding / Decoding](md-files/encoding-decoding.md)
* [Elasticsearch](md-files/elasticsearch.md)
* [OpenVPN](md-files/openvpn.md)
* [Ruby on Rails](md-files/ruby-on-rails.md)
* [iptables](md-files/iptables.md)
* [firewalld](md-files/firewalld.md)
* ![iptables Diagram](images/iptables-diagram.jpg)
* ![MikroTik Firewall Diagram](images/mikrotik-firewall-diagram.jpg)

---

# Password
```bash
sudo -i apt-get install pwgen xkcdpass -y

echo "`pwgen 4 -c -n -y -s -1 -v``xkcdpass --min 6 --max 8 -d '-' -C first -n 2 -c 1``pwgen 4 -c -n -y -s -1 -v`"
```
