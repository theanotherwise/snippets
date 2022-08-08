```bash
# Network configuration
local 10.100.255.2
port 1194
proto tcp
dev tun

# Server RSA
ca ca.crt
cert server.crt
key server.key
dh dh.pem
tls-crypt tc.key
crl-verify crl.pem

# Algorithms
auth SHA512
cipher AES-256-CBC

topology subnet

server 10.8.0.0 255.255.255.0

# Force all traffic via VPN 
#push "redirect-gateway def1 bypass-dhcp"

# Push only specified IP ( only theses addresses will go through via VPN)
push "route 3.232.242.170"
push "route 52.20.78.240"
push "route 3.220.57.224"
push "route 54.91.59.199"

# Push DNS Server
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"

client-config-dir ccd           # Client config
ifconfig-pool-persist ipp.txt   # Assign IP to client
persist-key                     # Dont read key again on restart
persist-tun                     # Dont remove interface on restart

user nobody
group nogroup

keepalive 10 120

verb 3
```
