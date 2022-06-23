```bash
iw dev wlan0 set 4addr on
```

```bash
ip link show

ip -s link
ip -s link show dev vmnet0

ip link set eth0 up
ip link set eth0 down

ip link set eth0 mtu 9000
ip link set eth0 promisc on


ip neigh 
ip neigh show dev vmnet0

ip neigh add 192.168.1.1 lladdr 11:22:33:44:55:66 dev eth0
ip neigh del 192.168.1.1 lladdr 11:22:33:44:55:66 dev eth0


ip address show
ip address show dev eth0

ip route show
ip route show dev eth0
ip route show table main

ip route get 10.0.0.1

ip address add 10.0.0.10/24 dev eth0
ip address del 10.0.0.10/24 dev eth0

ip link add link eth0 name eth.1 type vlan id 1
ip link set eth.1  up

ip route add default via 10.0.0.1 dev eth0
ip route del default

ip route add 10.0.0.0/24 via 192.168.1.1 dev eth0
ip route delete 10.0.0.0/24 via 192.168.1.1 dev eth0

ip rule
ip route show dev eth0
```
