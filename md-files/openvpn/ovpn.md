```
client
dev tun
proto tcp
remote XXX.XXX.XXX.XXX
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
auth SHA512
cipher AES-256-CBC
ignore-unknown-option block-outside-dns
block-outside-dns
verb 3

# Static DNS
#dhcp-option DNS 8.8.8.8
#dhcp-option DNS 8.8.4.4

# Static route
#route 3.232.242.170 255.255.255.255
#route 52.20.78.240 255.255.255.255
#route 3.220.57.224 255.255.255.255
#route 54.91.59.199 255.255.255.255

<ca>
</ca>
<cert>
</cert>
<key>
</key>
<tls-crypt>
</tls-crypt>
```
