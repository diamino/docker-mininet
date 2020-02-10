# docker-mininet

A Docker image for [Mininet](http://mininet.org/)

This is a slightly modified version of [`docker-mininet`](https://github.com/iwaseyusuke/docker-mininet) by [iwaseyusuke](https://github.com/iwaseyusuke) to make it work on Docker Desktop on macOS. This version has only been tested on macOS, but should also work on the Linux version of Docker.

## Docker Build Command

```bash
docker build -t diamino/mininet .
```

## Docker Run Command

```bash
xhost +localhost
docker run -it --rm --privileged \
            -e DISPLAY=host.docker.internal:0 \
            -v /lib/modules:/lib/modules \
            -v $PWD:/opt/work \
            diamino/mininet
```

or simply run:
```bash
./run.sh
```
With this last option you can optionally set the environment variable `MININET_WORK` to a folder where the mininet scripts are located. This will be mounted on `/opt/work` in the container. E.g. `export MININET_WORK=/home/my_user_folder/mininet_scripts`.

## Docker Compose

If you have installed [Docker Compose](https://docs.docker.com/compose/),
you can run container with:

```bash
xhost +localhost
docker-compose run --rm mininet
```
Just like the `run.sh` script the docker-compose file can also use the `MININET_WORK` environment variable to point to the location of your mininet scripts. The folder will be mounted to `/opt/work` in the container.

## Tips ##

Make sure to allow network connections to your X server. For XQuartz on macOS you can enable this under *XQuartz->Preferences->Security*.