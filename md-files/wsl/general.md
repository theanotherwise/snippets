```bash
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
```

```bash
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

```bash
wsl --status
wsl --list --verbose --all
wsl --set-default-version 2

wsl --shutdown
wsl --update
```

```bash
wsl --set-version Ubuntu 2
wsl --setdefault Ubuntu

wsl --unregister Ubuntu

wsl --import Test C:\Users\mateu\WSL\Test wsl.tar
```
