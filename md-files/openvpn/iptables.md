```bash
export SERVER_IP=10.100.255.2
export SERVER_NET=10.100.255.2
export VPN_NET=10.8.0.0/24

*filter
cat < EndOfMessage
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i tun0 -s {{VPN_NET}} -p tcp --dport 80 -d {{SERVER_NET}} -j DROP
-A INPUT -s {{VPN_NET}} -d 10.100.255.0/24 -j DROP
-A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s {{VPN_NET}} -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s {{VPN_NET}} ! -d {{VPN_NET}} -j SNAT --to-source {{SERVER_IP}}
COMMIT
EndOfMessage
```
