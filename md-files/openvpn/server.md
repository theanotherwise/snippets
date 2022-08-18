```bash
# Reference
# https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf

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

ecdh-curve prime256v1
tls-crypt tls-crypt.key
crl-verify crl.pem

ca ca.crt
auth SHA512
cipher AES-256-CBC
cert server_rj5GdAW6ZWXw7Bqj.crt
key server_rj5GdAW6ZWXw7Bqj.key
auth SHA256
cipher AES-128-GCM
ncp-ciphers AES-128-GCM
tls-server
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256

client-config-dir /etc/openvpn/ccd
ifconfig-pool-persist ipp.txt
status /var/log/openvpn/status.log

verb 3

# All via VPN
#push "redirect-gateway def1 bypass-dhcp"

# Push DNS
#push "dhcp-option DNS 8.8.8.8"
#push "dhcp-option DNS 8.8.4.4"

# Push routes
#push "route 3.232.242.170 255.255.255.255"
#push "route 52.20.78.240 255.255.255.255"
#push "route 3.220.57.224 255.255.255.255"
#push "route 54.91.59.199 255.255.255.255"
```
