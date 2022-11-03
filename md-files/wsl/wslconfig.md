`.wslconfig`

```conf
[automount]
enabled               = true
root                  = /
mountFsTab            = true

[interop]
enabled               = false
appendWindowsPath     = false

[network]
# hostname            = DemoHost
generateHosts         = false
generateResolvConf    = false

[wsl2]
processors            = 4
memory                = 8GB
swap                  = 0
nestedVirtualization  = true
localhostForwarding   = true
vmIdleTimeout         = 720000
debugConsole          = false
pageReporting         = true
debugConsole          = false
```
