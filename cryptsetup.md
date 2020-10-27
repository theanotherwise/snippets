# Cryptsetup

```bash
cryptsetup -c aes-cbc-essiv:sha256 -s 256 -h sha512 -i 5000 luksFormat <device>

cryptsetup open -i 5000 <device> enc
cryptsetup open enc

cryptsetup luksAddKey <device>
cryptsetup luksRemoveKey <device>
cryptsetup luksKillSlot <device> 1

cryptsetup -vvv benchmark

cryptsetup -vvv isLuks <device>

cryptsetup status <name>
cryptsetup luksDump <device>

cryptsetup -vvv luksSuspend <name>
cryptsetup -vvv luksResume <name>
```
