```bash
fallocate -l 64G /swapfile
# dd if=/dev/zero bs=1MiB count=65536 of=/swapfile

chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

swapon --show
```

`fstab`
```bash
/swapfile       none    swap    sw      0       0
```
