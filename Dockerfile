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

COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

EXPOSE 6633 6653 6640

ENTRYPOINT ["/root/entrypoint.sh"]
