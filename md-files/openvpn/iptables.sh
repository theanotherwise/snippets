export HOST_IP="10.100.255.2"
export HOST_NET="10.100.255.0/24"
export VPN_NET="10.8.0.0/24"

iptables-restore << EndOfMessage
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:vpn-aaa - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -s ${VPN_NET} -j vpn-aaa 
-A INPUT -p tcp --dport 22      -j ACCEPT
-A INPUT -p udp --dport 53      -j ACCEPT
-A INPUT -p tcp --dport 1194    -j ACCEPT
-A INPUT -j DROP

-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i tun0 -p tcp -s ${VPN_NET} -j ACCEPT
-A FORWARD -j DROP

# -A vpn-aaa -i tun0 -p tcp -s ${VPN_NET} -d ${HOST_IP} --dport 22    -j ACCEPT
# -A vpn-aaa -i tun0 -p tcp -s ${VPN_NET} -d ${HOST_IP} --dport 80    -j ACCEPT
# -A vpn-aaa -i tun0 -p tcp -s ${VPN_NET} -d ${HOST_IP} --dport 443   -j ACCEPT
-A vpn-aaa -i tun0 -s ${VPN_NET} -d ${HOST_IP} -j DROP
-A vpn-aaa -j DROP
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s ${VPN_NET} ! -d ${VPN_NET} -j SNAT --to-source ${HOST_IP}
COMMIT
EndOfMessage
