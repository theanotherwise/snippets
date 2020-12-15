```bash
firewall-cmd --runtime-to-permanent
firewall-cmd --get-zones
firewall-cmd --list-all
firewall-cmd --list-all-zones
firewall-cmd --list-all --zone=public
```

```bash
firewall-cmd --get-log-denied
firewall-cmd --set-log-denied=all
firewall-cmd --set-log-denied=off
``` 

```bash
firewall-cmd --permanent --new-zone=example
firewall-cmd --permanent --delete-zone=example
```

```bash
firewall-cmd --permanent --zone=public --get-target
firewall-cmd --permanent --zone=public --set-target=DROP
``` 

```bash
firewall-cmd --get-default-zone
firewall-cmd --set-default-zone=example
``` 

```bash
firewall-cmd --get-active-zones
firewall-cmd --permanent --zone=public --add-interface=ens192
firewall-cmd --permanent --zone=public --remove-interface=ens192
```

```bash
firewall-cmd --zone=public --list-services
firewall-cmd --permanent --zone=public --add-service=
firewall-cmd --permanent --zone=public --remove-service=
```

```bash
firewall-cmd --zone=public --list-ports
firewall-cmd --permanent --zone=public --add-port=
firewall-cmd --permanent --zone=public --remove-port=
```

```bash
firewall-cmd --zone=public --list-sources
firewall-cmd --permanent --zone=public --add-source=
firewall-cmd --permanent --zone=public --remove-source=
```

```bash
# rule family="ipv4" source address="10.128.83.0/25" port port="80" protocol="tcp" log prefix="HTTP 80 Apache" level="notice" accept
firewall-cmd --zone=public --list-rich-rules
firewall-cmd --permanent --zone=public --query-rich-rule=''
firewall-cmd --permanent --zone=public --add-rich-rule=''
firewall-cmd --permanent --zone=public --remove-rich-rule=''
```

```bash
firewall-cmd --permanent --direct --get-all-rules
firewall-cmd --permanent --direct --add-rule
firewall-cmd --permanent --direct --remove-rule
```

```bash
firewall-cmd --permanent --new-service=example
firewall-cmd --permanent --delete-service=example
firewall-cmd --permanent --info-service=example
```

```bash
firewall-cmd --permanent --service=example --set-description=
firewall-cmd --permanent --service=example --get-description
```

```bash
firewall-cmd --permanent --service=example --set-short=
firewall-cmd --permanent --service=example --get-short
```

```bash
firewall-cmd --permanent --service=example --get-ports
firewall-cmd --permanent --service=example --add-port=
firewall-cmd --permanent --service=example --remove-port=
firewall-cmd --permanent --service=example --query-port=
```

```bash
firewall-cmd --permanent --service=example --get-protocols
firewall-cmd --permanent --service=example --add-protocol=tcp
firewall-cmd --permanent --service=example --remove-protocol=tcp
firewall-cmd --permanent --service=example --query-protocol=tcp
```

```bash
firewall-cmd --permanent --service=example --get-source-ports
firewall-cmd --permanent --service=example --add-source-port=
firewall-cmd --permanent --service=example --remove-source-port=
firewall-cmd --permanent --service=example --query-source-port=
```

```bash
firewall-cmd --permanent --service=example --get-modules
firewall-cmd --permanent --service=example --add-module=
firewall-cmd --permanent --service=example --remove-module=
firewall-cmd --permanent --service=example --query-module=
```

```bash
firewall-cmd --permanent --service=example --get-destinations
firewall-cmd --permanent --service=example --set-destination=
firewall-cmd --permanent --service=example --remove-destination=
firewall-cmd --permanent --service=example --query-destination=
```

#

```bash 
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -m state --state ESTABLISHED -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 32765 -o lo -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 32766 -j LOG
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 32767 -j DROP
```

```bash
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -m state --state ESTABLISHED -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 32765 -o lo -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 32766 -j LOG
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 32767 -j DROP
```
