#!/bin/bash
exec $(which transmission-daemon) \
    --allowed 127.*.*.*,$TRANSMISSION_ALLOWED \
    --incomplete-dir /data/incomplete \
    --foreground \
    --config-dir /config \
    --download-dir /data/complete \
    --no-portmap &

/etc/transmission/opts.sh &
