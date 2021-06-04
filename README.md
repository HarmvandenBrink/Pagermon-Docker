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
While building the Docker Image it'll create an unique API key and SessionKey for that specific image.

## Changing reader.sh

This script was created to decode FLEX, specifically the P2000 network in the Netherlands (169.65MHz), please change this settings before building the Docker. In a later version I'll make this files configurable (and mounted)

```bash
rtl_fm -f 169.65M -M fm -s 22050 -p 0 - |
multimon-ng -a FLEX -t raw /dev/stdin |
node reader.js
```

## Running the Docker

Please be aware to run the container with the correct RTL-SDR device attached. The code below should do the trick.

```bash
docker run -it -p 3000:3000 --privileged -d --restart always -v /dev/bus/usb:/dev/bus/usb pagermondocker
```

## The interface and configuration
http://IP:3000
Username: admin Password: changeme

The client and server from Pagermon are pre-attached using an API key

## MySQL (additional, change password!)

```bash
docker run --name mysql-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pagermon -e MYSQL_DATABASE=pagermon -e MYSQL_ROOT_HOST=% -d mysql/mysql-server:latest
docker exec -i mysql-server mysql -uroot -ppagermon -e "ALTER USER root IDENTIFIED WITH mysql_native_password BY 'pagermon';"
```
