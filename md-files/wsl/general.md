## Disable
```bash
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
```

## Enable
```bash
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## Basics
```bash
wsl --status
wsl --list --verbose --all
wsl --set-default-version 2

wsl --shutdown
wsl --update
```

## Operations
```bash
wsl --set-version Ubuntu 1

wsl --set-version Ubuntu 2
wsl --setdefault Ubuntu 2

wsl --unregister Ubuntu

wsl --import Test C:\Users\mateu\WSL\Test wsl.tar
```
