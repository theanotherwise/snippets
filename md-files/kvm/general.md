#### TTY

```bash
systemctl daemon-reload

systemctl status serial-getty@ttyS0.service

systemctl start serial-getty@ttyS0.service
systemctl enable serial-getty@ttyS0.service
```

#### Virsh

```bash
virsh nodeinfo

```

```bash
virsh list  --all
virsh pool-list --all
virsh vol-list default --all
virsh net-list --all
virsh iface-list --all
```

```bash
virsh vol-delete --pool default 
```

```bash
virsh reboot myvm
virsh shutdown myvm
virsh start myvm
```

```bash
virsh destroy myvm
virsh undefine myvm
```

#### Virt Install

```bash
virt-install --osinfo list
```

```bash
virt-viewer --connect qemu:///system --wait myvm
```

```bash
# --graphics none \
# --boot uefi,bootmenu.enable=on,bios.useserial=on \
```

```bash
virt-install \
  --description "My Virtual Machine" \
  --memory 4096 \
  --cpu host \
  --vcpu 16 \
  --hvm \
  --disk pool=default,size=10 \
  --rng /dev/urandom \
  --network bridge:virbr0 \
  --video virtio \
  --console pty,target_type=virtio \
  --serial pty \
  --cdrom linux.iso \
  --boot bootmenu.enable=on,bios.useserial=on \
  --os-variant debian11 \
  --name myvm
```

```bash
virt-install \
  --description "My Virtual Machine" \
  --memory 4096 \
  --cpu host \
  --vcpu 16 \
  --hvm \
  --disk pool=default,size=10 \
  --rng /dev/urandom \
  --network bridge:virbr0 \
  --video virtio \
  --console pty,target_type=virtio \
  --serial pty \
  --cdrom winxp.iso \
  --boot bootmenu.enable=on,bios.useserial=on \
  --os-variant winxp \
  --name myvm
```
