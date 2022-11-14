```bash
wsl --status
wsl --list --verbose --all
wsl --set-default-version 2

wsl --shutdown
wsl --update
```

```bash
# wsl --set-version Ubuntu 1
wsl --set-version Ubuntu 2
wsl --setdefault Ubuntu

wsl --unregister Ubuntu

wsl --terminate Ubuntu

wsl --export Ubuntu ubuntu.ta
wsl --import Ubuntu C:\Users\mateu\WSL\Ubuntu ubuntu.tar
```
