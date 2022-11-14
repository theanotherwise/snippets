```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

```bash
wsl --status
wsl --list --verbose --all
wsl --set-default-version 2

wsl --shutdown
wsl --update

wsl --set-version Ubuntu 1
wsl --set-version Ubuntu 2
wsl --setdefault Ubuntu 2

wsl --unregister Ubuntu

wsl --import Test C:\Users\mateu\WSL\Test wsl.tar
```
