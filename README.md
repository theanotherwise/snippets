# Snippets

### Find `ASCII text` files
```
find /var/log -mindepth 1 -maxdepth 1 -type f -exec grep -Iq . {} 2>/dev/null \; -print
```

### Print specified column `awk`
```
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | awk '{print $2}'
```

### Print specified column `cut`
```
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d" " -f1
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d$'\t' -f3
echo -e "Lorem\tipsum\tdolor\tsit\tamet" | cut -d$'\t' -f1-2
```
