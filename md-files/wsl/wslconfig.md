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
processors            = 8
memory                = 32GB
swap                  = 32GB
nestedVirtualization  = true
localhostForwarding   = true
vmIdleTimeout         = 720000
debugConsole          = false
pageReporting         = true
debugConsole          = false
```
