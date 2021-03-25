# Pagermon-Docker
Dockerfile to install Pagermon in one go (with a few settings)


git clone https://github.com/HarmvandenBrink/Pagermon-Docker.git

## Building the Docker

docker build -t pagermondocker .

## Running the Docker

```bash
docker run -it -p 3000:3000 -p 3306:3306 --privileged -v /dev/bus/usb:/dev/bus/usb pagermondocker
```
