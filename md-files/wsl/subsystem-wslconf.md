`/etc/wsl.conf`
```conf
[automount]
enabled               = true
root                  = /mnt
mountFsTab            = true

[interop]
enabled               = false
appendWindowsPath     = false

[network]
# hostname            = hostname
generateHosts         = true
generateResolvConf    = true
```
