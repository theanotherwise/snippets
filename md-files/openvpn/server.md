```bash
port 1194
proto tcp
dev tun

user nobody
group nogroup

persist-key
persist-tun

keepalive 10 120

topology subnet
server 10.8.0.0 255.255.255.0

# Certificates
ca ca.crt
key server.key
cert server.crt
crl-verify crl.pem

# Auth
auth SHA512
cipher AES-256-CBC
ncp-ciphers AES-128-GCM

# TLS
tls-server
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
# openvpn --genkey --secret tls-[auth|crypt].key
# tls-auth tls-auth.key 0   # 0 server, 1 client
tls-crypt tls-crypt.key

# Exchange
# openssl dhparam -out dh.pem 2048
dh dh.pem
ecdh-curve prime256v1

# Input / Output Files
ifconfig-pool-persist ipp.txt
client-config-dir /etc/openvpn/ccd
status /var/log/openvpn/status.log
log /var/log/openvpn/openvpn.log

#push "redirect-gateway def1 bypass-dhcp"
#push "dhcp-option DNS 8.8.8.8"
#push "dhcp-option DNS 8.8.4.4"
push "route 169.254.169.254 255.255.255.255"
#push "route 3.232.242.170 255.255.255.255"
#push "route 52.20.78.240 255.255.255.255"
#push "route 3.220.57.224 255.255.255.255"
#push "route 54.91.59.199 255.255.255.255"

verb 3
```
