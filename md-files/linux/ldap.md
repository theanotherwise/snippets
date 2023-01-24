`-b`  base dn - search
`-D`  bind dn - auth
```bash
ldapsearch -x -H ldap://127.0.0.1:1389 \
  -b dc=seems,dc=cloud -D "cn=admin,dc=seems,dc=cloud" -w admin
```
