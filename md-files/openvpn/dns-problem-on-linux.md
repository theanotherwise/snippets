```bash
apt-get install -y openvpn-systemd-resolved
```

```bash
script-security 2
up /etc/openvpn/update-systemd-resolved
down /etc/openvpn/update-systemd-resolved
down-pre
```
