#!/bin/sh

DOCKER_IMAGE=diamino/mininet

MININET_WORK=${MININET_WORK:-${PWD}}

xhost + 127.0.0.1
docker run -it -e DISPLAY=host.docker.internal:0 \
           --privileged \
           -v /lib/modules:/lib/modules \
           -v ${MININET_WORK}:/opt/work \
           --rm ${DOCKER_IMAGE} $@
