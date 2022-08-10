```bash
# Reference
# https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf

local 10.100.255.2
port 1194
proto tcp
dev tun

ca ca.crt
key server.key
cert server.crt
tls-crypt tc.key
dh dh.pem
crl-verify crl.pem

client-config-dir /etc/openvpn/ccd
ifconfig-pool-persist ipp.txt

auth SHA512
cipher AES-256-CBC

server 10.8.0.0 255.255.255.0
topology subnet

user nobody
group nogroup

keepalive 10 120

persist-key
persist-tun

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
