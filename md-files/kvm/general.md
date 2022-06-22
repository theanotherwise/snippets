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

virsh reboot myvm
```

```bash
virsh shutdown myvm
virsh destroy myvm

virsh undefine myvm
```

#### Virt Install

```bash
virt-install \
  --description "My Virtual Machine" \
  --memory 1024 \
  --vcpu 1 \
  --disk size=10 \
  --os-variant ubuntu20.04 \
  --cdrom mini.iso \
  --network bridge:virbr0 \
  --console pty,target_type=virtio \
  --name myvm
```
