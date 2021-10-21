```bash
subscription-manager register
subscription-manager list --available --all
subscription-manager attach --pool=pool_id
subscription-manager list --consumed
subscription-manager refresh
```

```bash
subscription-manager attach --auto
```

```bash
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean
```

```bash
subscription-manager repos --list
```

```bash
subscription-manager repos --enable=rhel-6-server-optional-rpms
subscription-manager repos --disable=rhel-6-server-optional-rpms
```
