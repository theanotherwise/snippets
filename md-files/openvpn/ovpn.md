```
client
dev tun
proto proto tcp-client
remote XXX.XXX.XXX.XXX 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
verify-x509-name server_rj5GdAW6ZWXw7Bqj name
auth SHA256
auth-nocache
cipher AES-128-GCM
tls-client
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
ignore-unknown-option block-outside-dns
setenv opt block-outside-dns # Prevent Windows 10 DNS leak
verb 3

# Static DNS
#dhcp-option DNS 8.8.8.8
#dhcp-option DNS 8.8.4.4

# Static route
#route 3.232.242.170 255.255.255.255
#route 52.20.78.240 255.255.255.255
#route 3.220.57.224 255.255.255.255
#route 54.91.59.199 255.255.255.255
#route 10.100.10.0 255.255.255.0
#route 10.100.20.0 255.255.255.0

<ca>
</ca>
<cert>
</cert>
<key>
</key>
<tls-crypt>
</tls-crypt>
```
