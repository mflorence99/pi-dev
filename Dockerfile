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

# install gulp
RUN npm install -g gulp

# install typescript
RUN npm install -g typescript

# install ts-node
RUN npm install -g ts-node

# install Wiring Pi
RUN apt-get update && apt-get install wiringpi

# install make etc
RUN apt-get update && apt-get install build-essential

# install pre-built phantomjs
# NOTE: phantomjs has hidden dependency
# https://github.com/giakki/uncss/issues/165
RUN apt-get update && apt-get install libfontconfig libicu52
COPY phantomjs /usr/bin/

# install angular-cli
RUN npm install -g @angular/cli

# install bower
RUN npm install -g bower

# install git
RUN apt-get update && apt-get install git

# install mversion
RUN npm install -g mversion

# copy ssh-config
COPY ssh-config /root/.ssh-config

# we use this all the time, so try to get a nice looking bash
COPY bashrc /root/.bashrc
RUN chmod u+x /root/.bashrc

# mount project
VOLUME /usr/src/app
WORKDIR /usr/src/app
