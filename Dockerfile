FROM bmoorman/ubuntu

ENV TRANSMISSION_ALLOWED="192.168.*.*,172.17.*.*"

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' > /etc/apt/sources.list.d/transmission.list \
 && echo 'deb-src http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main' >> /etc/apt/sources.list.d/transmission.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    openssh-client \
    transmission-cli \
    transmission-daemon \
    unrar \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY transmission/ /etc/transmission/

VOLUME /config /data

EXPOSE 9091

CMD ["/etc/transmission/start.sh"]
