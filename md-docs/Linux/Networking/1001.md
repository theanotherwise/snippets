```bash
iptables -L -n -v

iptables -t nat -L -n -v
iptables -t filter -L -n -v
iptables -t mangle -L -n -v
```

```bash
iptables -F

iptables -t nat -F PREROUTING
iptables -t nat -F INPUT
iptables -t nat -F OUTPUT
iptables -t nat -F POSTROUTING

iptables -t filter -F INPUT
iptables -t filter -F FORWARD
iptables -t filter -F OUTPUT

iptables -t mangle -F PREROUTING
iptables -t mangle -F INPUT
iptables -t mangle -F FORWARD
iptables -t mangle -F OUTPUT
iptables -t mangle -F POSTROUTING
```

```bash
iptables-save

iptables-restore < iptables.conf
```

#

```
# -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j LOG --log-prefix "INPUT (INPUT) "
-A INPUT -j DROP
 
# -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -j LOG --log-prefix "INPUT (DROP) "
-A OUTPUT -j DROP
```

#

```bash
sysctl -w net.ipv4.ip_forward=1                   # /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.conf.all.route_localnet=1      # /bin/echo 1 > /proc/sys/net/ipv4/conf/all/route_localnet
```

```bash
ip a add 10.10.170.104/16 dev ens32
ip a add 10.10.170.105/16 dev ens32
```

```bash
-A PREROUTING -p tcp -d 10.10.170.104 --dport 80 -j DNAT --to-destination 10.10.170.11:80
-A PREROUTING -p tcp -d 10.10.170.105 --dport 80 -j DNAT --to-destination 212.77.98.9:80
-A PREROUTING -p tcp -d 10.10.170.105 --dport 443 -j DNAT --to-destination 212.77.98.9:443

-A OUTPUT -o lo -p tcp -d 127.0.0.1 --dport 443 -j DNAT --to-destination 212.77.98.9:443

-A POSTROUTING -j MASQUERADE
```
