#!/bin/bash
while ! curl --silent localhost:9091 > /dev/null; do
    sleep $((sleep += 1))
done

transmission-remote \
    --cache $TRANSMISSION_CACHE
