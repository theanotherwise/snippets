# iptables.md

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

# Template

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
