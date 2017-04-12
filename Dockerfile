FROM resin/rpi-raspbian

# install curl
RUN apt-get update && apt-get install curl

# install docker
RUN curl -sSL get.docker.com | sh

# install node and npm
RUN apt-get update \
 && apt-get upgrade \
 && curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - \
 && apt-get install nodejs

# download and install gulp
RUN npm install -g gulp

# download and install typescript
RUN npm install -g typescript

# download and install ts-node
RUN npm install -g ts-node

# download and install Wiring Pi
RUN apt-get update && apt-get install wiringpi

# download and install make etc
RUN apt-get update && apt-get install build-essential

# install pre-built phantomjs
# NOTE: phantomjs has hidden dependency
# https://github.com/giakki/uncss/issues/165
RUN apt-get update && apt-get install libfontconfig libicu52
COPY phantomjs /usr/bin/

# download and install angular-cli
RUN npm install -g @angular/cli

# we use this all the time, so try to get a nice looking bash
COPY bashrc /root/.bashrc
RUN chmod u+x /root/.bashrc

# mount project
VOLUME /usr/src/app
WORKDIR /usr/src/app
