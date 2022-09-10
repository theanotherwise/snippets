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

# DNS Leaks
#setenv opt block-outside-dns # Windows
#dhcp-option DOMAIN-ROUTE . # Linux

# Static DNS Servers
#dhcp-option DNS 8.8.8.8
#dhcp-option DNS 8.8.4.4

# Static Routes
#route 3.232.242.170 255.255.255.255
#route 52.20.78.240 255.255.255.255
#route 3.220.57.224 255.255.255.255
#route 54.91.59.199 255.255.255.255
#route 10.100.10.0 255.255.255.0
#route 10.100.20.0 255.255.255.0

dhcp-option DOMAIN-ROUTE .
verb 3

<ca>
</ca>
<cert>
</cert>
<key>
</key>
<tls-crypt>
</tls-crypt>
```

## Linux raw connection workaround

`required`
```bash
apt-get install -y openvpn-systemd-resolved
```

```bash
script-security 2
up /etc/openvpn/update-systemd-resolved
down /etc/openvpn/update-systemd-resolved
down-pre
```
