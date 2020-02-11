FROM ubuntu:18.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    openvswitch-testcontroller \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/work

WORKDIR /opt/work

COPY docker-entry-point /root/docker-entry-point

RUN chmod +x /root/docker-entry-point

EXPOSE 6633 6653 6640

ENTRYPOINT ["/root/docker-entry-point"]
