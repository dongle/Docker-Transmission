### Usage - Public Trackers
```
docker run \
--rm \
--detach \
--init \
--name transmission-public \
--hostname transmission-public \
--volume transmission-public-config:/config \
--volume transmission-public-data:/data \
--publish 9091:9091 \
bmoorman/transmission:no-openvpn
```

### Usage - Private Trackers
```
docker run \
--rm \
--detach \
--init \
--name transmission-private \
--hostname transmission-private \
--volume transmission-private-config:/config \
--volume transmission-private-data:/data \
--publish 9092:9091 \
bmoorman/transmission:novpn
```
