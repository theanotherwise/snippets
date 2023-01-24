`-b`  base dn - Base DN for search

`-D`  bind dn - Bind DN to Authenticate

```bash
ldapsearch -x -H ldap://127.0.0.1:1389 \
  -b dc=seems,dc=cloud -D "cn=admin,dc=seems,dc=cloud" -w admin
```
