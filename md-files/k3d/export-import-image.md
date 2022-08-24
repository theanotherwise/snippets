```bash
IMAGE=foobar
TAG=2.2.0

docker image save "${IMAGE}:${TAG}" -o image.tar

docker cp image.tar k3d-seems-agent-0:/k3d/images

docker exec -it k3d-seems-agent-0 ctr image import /k3d/images/image.tar --all-platforms
```
