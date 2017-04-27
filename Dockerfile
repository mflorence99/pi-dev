FROM resin/rpi-raspbian

# install extras, plus pre-built phantomjs
# NOTE: phantomjs has hidden dependency
# https://github.com/giakki/uncss/issues/165
RUN apt-get update \
  && apt-get install curl wiringpi build-essential git libfontconfig libicu52
COPY phantomjs /usr/bin/

# install docker
RUN curl -sSL get.docker.com | sh

# install node and npm
RUN apt-get update \
 && apt-get upgrade \
 && curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - \
 && apt-get install nodejs

# install global node components
RUN npm install -g bower mversion gulp typescript ts-node @angular/cli

# copy ssh-config
COPY ssh-config /root/.ssh-config

# we use this all the time, so try to get a nice looking bash
COPY bashrc /root/.bashrc
RUN chmod u+x /root/.bashrc

# mount project
VOLUME /usr/src/app
WORKDIR /usr/src/app

# mount to make caches persistent
VOLUME /root/.bower
VOLUME /root/.npm
