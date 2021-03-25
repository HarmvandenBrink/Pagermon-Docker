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
docker run -it -p 3000:3000 -p 3306:3306 --privileged -v /dev/bus/usb:/dev/bus/usb pagermondocker
```