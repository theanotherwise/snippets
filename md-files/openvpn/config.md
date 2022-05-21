```bash
client
proto tcp
dev tun
remote 10.255.255.1 1194
cipher AES-256-CBC
nobind
auth SHA1
auth-nocache
auth-retry interact
auth-user-pass
persist-key
persist-tun
redirect-gateway def1
remote-cert-tls server
remote-random
resolv-retry infinite
reneg-sec 43200
verb 3

<ca>

</ca>
<key>

</key>
<cert>

</cert>
auth-user-pass user-pass.auth
```
