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
virsh list
virsh pool-list
virsh vol-list default
virsh net-list
virsh iface-list
```

```bash
virsh vol-delete --pool default 
```

```bash
virsh start myvm
virsh reboot myvm
virsh shutdown myvm
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
```

```bash
virt-install \
  --description "My Virtual Machine" \
  --memory 4096 \
  --cpu host \
  --vcpu 16 \
  --hvm \
  --disk pool=default,size=10 \
  --rng /dev/random \
  --network bridge:virbr0 \
  --video virtio \
  --console pty,target_type=virtio \
  --serial pty \
  --location linux.iso \
  --boot uefi,bootmenu.enable=on,bios.useserial=on \
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
  --rng /dev/random \
  --network bridge:virbr0 \
  --video virtio \
  --console pty,target_type=virtio \
  --serial pty \
  --cdrom winxp.iso \
  --boot bootmenu.enable=on,bios.useserial=on \
  --os-variant winxp \
  --name myvm
```
