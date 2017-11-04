FROM bmoorman/ubuntu

ENV TRANSMISSION_ALLOWED="192.168.*.*,172.18.*.*"

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' > /etc/apt/sources.list.d/transmission.list && \
    echo 'deb-src http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' >> /etc/apt/sources.list.d/transmission.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 && \
    apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends transmission-daemon transmission-cli unrar openssh-client && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /data /config

COPY transmission/ /etc/transmission/

CMD ["/etc/transmission/start.sh"]

EXPOSE 9091
