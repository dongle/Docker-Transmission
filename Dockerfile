FROM ubuntu:xenial

ENV TZ="America/Denver" \
    LANG="en_US.UTF-8" \
    TRANSMISSION_ALLOWED="192.168.*.*,172.18.*.*"

ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' > /etc/apt/sources.list.d/transmission.list && \
    echo 'deb-src http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' >> /etc/apt/sources.list.d/transmission.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 && \
    apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends tzdata locales ca-certificates transmission-daemon transmission-cli unrar openssh-client && \
    locale-gen en_US.UTF-8 && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY transmission/ /etc/transmission/

VOLUME /data /config

CMD ["/etc/transmission/start.sh"]

EXPOSE 9091
