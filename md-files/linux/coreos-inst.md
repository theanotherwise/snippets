```bash
ADDR="10.100.101.8"
GW="10.100.101.1"
NETMASK="255.255.255.255"
NAMESERVER="169.254.169.254"

INST_URL="http://10.100.100.2:80"

INST_TYPE="bootstrap"
# INST_TYPE="master"
# INST_TYPE="worker"

INST_ENABLED="coreos.inst=yes"
INST_DEV="coreos.inst.install_dev=/dev/sdb"
INST_IMAGE="coreos.inst.image_url=${INST_URL}/rhcos.raw.gz"
INST_IGN="coreos.inst.ignition_url=${INST_URL}/${INST_TYPE}.ign"

COREOS_INST="${INST_ENABLED} ${INST_DEV} ${INST_IMAGE} ${INST_IGN}"

echo "${COREOS_INST} ip=${ADDR} gw=${GW} netmask=${NETMASK} nameserver=${NAMESERVER}"
```
