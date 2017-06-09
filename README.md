### Public Trackers
```
docker run \
--rm \
--detach \
--privileged \
--name transmission-public \
--network backend \
--volume transmission-public-data:/data \
--volume transmission-public-config:/config \
--publish 9091:9091 \
--dns 209.222.18.222 \
--dns 209.222.18.218 \
--env "OPENVPN_USERNAME=**username**" \
--env "OPENVPN_PASSWORD=**password**" \
--env "TRANSMISSION_ALLOWED=192.168.*.*,172.18.*.*" \
bmoorman/transmission
```

### Private Trackers
```
docker run \
--rm \
--detach \
--privileged \
--name transmission-private \
--network backend \
--volume transmission-private-data:/data \
--volume transmission-private-config:/config \
--publish 9092:9091 \
--dns 209.222.18.222 \
--dns 209.222.18.218 \
--env "OPENVPN_USERNAME=**username**" \
--env "OPENVPN_PASSWORD=**password**" \
--env "TRANSMISSION_ALLOWED=192.168.*.*,172.18.*.*" \
bmoorman/transmission
```
