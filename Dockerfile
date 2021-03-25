FROM ubuntu:latest

RUN apt update && apt -y upgrade
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt install -y npm sqlite3 git nodejs multimon-ng rtl-sdr libusb-1.0-0-dev
RUN npm install npm@latest -g
RUN npm install pm2 -g
RUN git clone https://github.com/pagermon/pagermon.git
RUN export NODE_ENV=production
COPY process.json /pagermon/server/process.json
COPY clientconfig.json /pagermon/client/config/config.json
COPY serverconfig.json /pagermon/server/config/config.json
COPY reader.sh /pagermon/client/reader.sh
COPY no-rtl.conf /etc/modprobe.d/no-rtl.conf
RUN chmod +x /pagermon/client/reader.sh
WORKDIR /pagermon/client
RUN npm install nconf
WORKDIR /pagermon/server
RUN npm install
CMD [ "pm2-runtime", "start", "process.json" ] && ./pagermon/client/reader.sh
