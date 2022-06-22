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
```

```bash
virsh vol-delete --pool default 
```

```bash
virsh reboot myvm

virsh shutdown myvm
virsh destroy myvm

virsh undefine myvm
```

#### Virt Install

```bash
virt-install --osinfo list
```

```bash
virt-install \
  --description "My Virtual Machine" \
  --memory 1024 \
  --cpu host \
  --vcpu 1 \
  --disk pool=default,size=10 \
  --rng /dev/random \
  --cdrom image.iso \
  --network bridge:virbr0 \
  --graphics none \
  --video virtio \
  --console pty,target_type=virtio \
  --serial pty \
  --os-variant debian11 \
  --name myvm
```
