### Docker Run

```
docker run \
--detach \
--name transmission \
--publish 9091:9091 \
--volume transmission-config:/config \
--volume transmission-data:/data \
bmoorman/transmission:novpn
```

### Docker Compose

```
version: "3.7"
services:
  transmission:
    image: bmoorman/transmission:novpn
    container_name: transmission
    ports:
      - "9091:9091"
    volumes:
      - transmission-config:/config
      - transmission-data:/data

volumes:
  transmission-config:
  transmission-data:
```

### Environment Variables

| Variable | Description | Default |
| --- | --- | --- |
| TZ | Sets the timezone | `America/Denver` |
| TRANSMISSION_PORT | Sets which port transmission listens on | `9091` |
| TRANSMISSION_ALLOWED | Sets which networks to allow | `192.168.*.*,172.17.*.*` |
