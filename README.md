# Net-ReRouter (into docker)
**ReRoutes incoming traffic through one port to another host & port.**

(Based on [Ambassador pattern in Kubernetes](https://kubernetes.io/blog/2015/06/the-distributed-system-toolkit-patterns/))

[![Stars](https://img.shields.io/docker/stars/manuellr/net-rerouter.svg)](https://hub.docker.com/r/manuellr/net-rerouter/)
[![Size](https://shields.beevelop.com/docker/image/image-size/manuellr/net-rerouter/latest.svg?style=flat-square)](https://hub.docker.com/r/manuellr/net-rerouter/)
[![Pulls](https://img.shields.io/docker/pulls/manuellr/net-rerouter.svg)](https://hub.docker.com/r/manuellr/net-rerouter/)
[![License](https://img.shields.io/github/license/ManuelLR/Net-ReRouter_docker.svg?style=flat-square)](https://github.com/ManuelLR/Net-ReRouter_docker/blob/master/LICENSE)

## Usage

- Must be executed with `NET_ADMIN` capabilities.
- Configuration is defined by an environment variable (`REROUTER`) which contains: `<input_port>:<dest_ip>:<dest_port>`. Multiple routes could be configured separated by `,` character.

For example, if you would like to reroute port `1022` to port `22` in host `192.168.200.4` run:

```bash
docker run \
    -d \
    --cap-add=NET_ADMIN \
    -p 1022-1024:1022-1024/tcp \
    -e REROUTER="1022:192.168.200.4:22, 1023:1.2.3.4:5432, 1024:10.50.0.4:80" \
    --name=net-rerouter \
    manuellr/net-rerouter
```
