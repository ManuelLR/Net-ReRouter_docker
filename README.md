<div align="center">
  <p>
    <h1>Net-ReRouter (into docker)</h1>
  </p>
  <p>
    <h4>ReRoutes incoming traffic through one port to another host & port.</h4>
  </p>
  <p>
    (Based on <a href="https://kubernetes.io/blog/2015/06/the-distributed-system-toolkit-patterns/">Ambassador pattern in Kubernetes</a>)
  </p>
  <p>
    <a href="https://hub.docker.com/r/manuellr/net-rerouter/">
      <img src="https://img.shields.io/docker/stars/manuellr/net-rerouter.svg" alt="Stars" />
      <img src="https://shields.beevelop.com/docker/image/image-size/manuellr/net-rerouter/latest.svg?style=flat-square" alt="Size" />
      <img src="https://img.shields.io/docker/pulls/manuellr/net-rerouter.svg" alt="Pulls" />
    </a>
    <a href="https://github.com/ManuelLR/Net-ReRouter_docker/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/ManuelLR/Net-ReRouter_docker.svg?style=flat-square" alt="License" />
    </a>
  </p>
</div>

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
