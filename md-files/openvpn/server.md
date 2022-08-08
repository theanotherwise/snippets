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

auth SHA512
cipher AES-256-CBC

topology subnet

server 10.8.0.0 255.255.255.0

#push "redirect-gateway def1 bypass-dhcp"

push "route 3.232.242.170"
push "route 52.20.78.240"
push "route 3.220.57.224"
push "route 54.91.59.199"

push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"

client-config-dir /etc/openvpn/ccd  # Client config
ifconfig-pool-persist ipp.txt       # Assign IP to client
persist-key                         # Dont read key again on restart
persist-tun                         # Dont remove interface on restart

user nobody
group nogroup

keepalive 10 120

verb 3
```
