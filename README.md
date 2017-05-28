# Ubuntu Powernap Edition

Dockerized Ubuntu version with common infrastructure and development tools.

## Features

It has installed all tools included in the *Ubuntu* version plus the following ones:

| Topic         | Commands / Description     |
| ------------- |-------------|
| Ubuntu        | `16.04` |
| Terminal      | `ZSH` |
| Editors       | `nano`, `jq` |
| Web           | `curl`, `wget` |
| Networking    | `arp`, `hostname`, `ifconfig`, `netstat`, `rarp`, `route`, `plipconfig`, `slattach`, `mii-tool`, `iptunnel`, `ipmaddr` |
| Hashicorp     | `consul`, `terraform`, `nomad`, `vault` |

## Running it

Create a new terminal:

```sh
docker run -it eridemnet/powernap
```

Run a command inside:

```sh
docker run -it eridemnet/powernap ping ubuntu.com
```
