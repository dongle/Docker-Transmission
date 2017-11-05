### Public Trackers
```
docker run \
--rm \
--detach \
--init \
--name transmission-public \
--hostname transmission-public \
--network backend \
--volume transmission-public-data:/data \
--volume transmission-public-config:/config \
--publish 9091:9091 \
bmoorman/transmission
```

### Private Trackers
```
docker run \
--rm \
--detach \
--init \
--name transmission-private \
--hostname transmission-private \
--network backend \
--volume transmission-private-data:/data \
--volume transmission-private-config:/config \
--publish 9092:9091 \
bmoorman/transmission
```
