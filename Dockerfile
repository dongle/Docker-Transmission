FROM ubuntu:focal

ARG DEBIAN_FRONTEND="noninteractive"

ENV TRANSMISSION_PORT="9091" \
    TRANSMISSION_ALLOWED="192.168.*.*,172.17.*.*" \
    TZ=America/New_York \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN apt-get update \
 && apt-get dist-upgrade --yes \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    gnupg \
    locales \
    tzdata \
 && locale-gen en_US.UTF-8 \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && echo 'deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu focal main' > /etc/apt/sources.list.d/transmission.list \
 && echo 'deb-src http://ppa.launchpad.net/transmissionbt/ppa/ubuntu focal main' >> /etc/apt/sources.list.d/transmission.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 976B5901365C5CA1 \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    openssh-client \
    transmission-cli \
    transmission-daemon \
    unrar \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY transmission/ /etc/transmission/

VOLUME /config /data

EXPOSE ${TRANSMISSION_PORT}

CMD ["/etc/transmission/start.sh"]