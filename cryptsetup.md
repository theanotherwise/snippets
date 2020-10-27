# Cryptsetup

```bash
cryptsetup -c aes-cbc-essiv:sha256 -s 256 -h sha512 -i 5000 luksFormat <device>
```

```bash
cryptsetup open -i 5000 <device> enc
cryptsetup close enc
```

```bash
cryptsetup luksAddKey <device>
cryptsetup luksRemoveKey <device>
cryptsetup luksKillSlot <device> 1
```

```bash
cryptsetup -vvv benchmark
```

```bash
cryptsetup -vvv isLuks <device>

cryptsetup status <name>
cryptsetup luksDump <device>
```

```bash
cryptsetup -vvv luksSuspend <name>
cryptsetup -vvv luksResume <name>
```
