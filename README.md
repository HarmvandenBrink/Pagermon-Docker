# Pagermon-Docker
Dockerfile to install Pagermon in one go (with a few settings)

## Clone the repository

```bash
git clone https://github.com/HarmvandenBrink/Pagermon-Docker.git
```

## Building the Docker
```bash
docker build -t pagermondocker .
```

## Running the Docker

Please be aware to run the container with the correct RTL-SDR device attached. The code below should do the trick.

```bash
docker run -it -p 3000:3000 --privileged -v /dev/bus/usb:/dev/bus/usb pagermondocker
```

## The interface and configuration
http://IP:3000
Username: admin Password: changeme

The client and server from Pagermon are pre-attached using an API key
