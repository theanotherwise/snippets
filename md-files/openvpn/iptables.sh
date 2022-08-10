iptables-restore << EndOfMessage
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:vpn-aaa - [0:0]
-A INPUT -s 10.8.0.0/24 -j vpn-aaa
-A INPUT -s 10.8.0.0/24 -d 10.100.255.0/24 -j DROP
-A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT

-A vpn-aaa -s 10.8.0.0/24 -p tcp --dport 22 -d 10.100.255.2 -j ACCEPT
-A vpn-aaa -s 10.8.0.0/24 -p tcp --dport 80 -d 10.100.255.2 -j ACCEPT
-A vpn-aaa -j DROP

-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s 10.8.0.0/24 -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s 10.8.0.0/24 ! -d 10.8.0.0/24 -j SNAT --to-source 10.100.255.2
COMMIT
EndOfMessage
