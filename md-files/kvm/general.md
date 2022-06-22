```bash
virsh list

vrish shutdown myvm
virsh destroy myvm

virsh undefine myvm
```

```bash
virt-install \
  --memory 1024 \
  --vcpu 1 \
  --disk size=10 \
  --os-variant ubuntu20.04 \
  --name test \
  --cdrom mini.iso
```
