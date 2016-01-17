### wonderfall/nsd
[![](https://badge.imagelayers.io/wonderfall/nsd:latest.svg)](https://imagelayers.io/?images=wonderfall/nsd:latest 'Get your own badge on imagelayers.io')

NSD (Name Server Daemon) is an authoritative DNS server.

```
### nsd.conf sample
server:
   server-count: 1
   ip4-only: yes
   hide-version: yes
   identity: "Anonymous DNS."
   zonesdir: "/zones"
zone:
   name: yourd4rkdomain.xyz
   zonefile: db.yourd4rkdomain.xyz.signed
   notify: ip_of_secondary_server NOKEY
   provide-xfr: ip_of_secondary_server NOKEY
```

```
### docker compose
nsd:
  image: wonderfall/nsd
  ports:
    - "53:53/udp"
  volumes:
    - /mnt/nsd/config:/etc/nsd
    - /mnt/nsd/zones:/zones
```
