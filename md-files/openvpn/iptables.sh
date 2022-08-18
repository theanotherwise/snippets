export HOST_IP="10.100.255.2"
export HOST_NET="10.100.255.0/24"

export VPN_AAA_NET="10.8.0.0/24"
export VPN_BBB_NET="10.9.0.0/24"

export A_CLASS_NETWORK="10.0.0.0/8"
export B_CLASS_NETWORK="172.16.0.0/12"
export C_CLASS_NETWORK="192.168.0.0/16"

iptables-restore << EndOfMessage
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:vpn-aaa-input - [0:0]
:vpn-aaa-forward - [0:0]
:vpn-bbb-input - [0:0]
:vpn-bbb-forward - [0:0]
:drop-private-networks - [0:0]

# INPUT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -s ${VPN_AAA_NET} -j vpn-aaa-input
-A INPUT -s ${VPN_BBB_NET} -j vpn-bbb-input
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p udp --dport 53 -j ACCEPT
-A INPUT -p tcp --dport 1194 -j ACCEPT
-A INPUT -j DROP

# INPUT (VPN AAA -> Host)
-A vpn-aaa-input -d ${HOST_IP} -p tcp --dport 22 -j ACCEPT
-A vpn-aaa-input -j DROP

# INPUT (VPN BBB -> Host)
-A vpn-bbb-input -d ${HOST_IP} -p tcp --dport 22 -j ACCEPT
-A vpn-bbb-input -j DROP

# FORWARD
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s ${VPN_AAA_NET} -j vpn-aaa-forward
-A FORWARD -s ${VPN_BBB_NET} -j vpn-aaa-forward
-A FORWARD -j DROP

# FORWARD (VPN AAA -> Private Access)
-A vpn-aaa-forward -d 10.100.10.2/32 -p tcp --dport 22 -j ACCEPT
-A vpn-aaa-forward -j drop-private-networks

# FORWARD (VPN BBB -> Private Access)
-A vpn-bbb-forward -d 10.100.10.2/32 -p tcp --dport 22 -j ACCEPT
-A vpn-bbb-forward -j drop-private-networks

# FORWARD (Drop Private Networks)
-A drop-private-networks -d ${A_CLASS_NETWORK} -j DROP
-A drop-private-networks -d ${B_CLASS_NETWORK} -j DROP
-A drop-private-networks -d ${C_CLASS_NETWORK} -j DROP
-A drop-private-networks -j ACCEPT

COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s ${VPN_AAA_NET} ! -d ${VPN_AAA_NET} -j SNAT --to-source ${HOST_IP}
-A POSTROUTING -s ${VPN_BBB_NET} ! -d ${VPN_BBB_NET} -j SNAT --to-source ${HOST_IP}
COMMIT
EndOfMessage
