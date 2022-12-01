FROM node:16.18.1-slim

RUN curl -sL http://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN npm i -g npm@9.1.2

RUN apt-get update && apt-get install -y curl build-essential git google-chrome-stable
#####
# Install angular cli
ENV ANGULAR_CLI_VERSION 15.0.1

RUN npm i -g @angular/cli@${ANGULAR_CLI_VERSION}

#####
# Install Ionic
ENV IONIC_VERSION 6.20.4

RUN apt-get update && apt-get install -y git bzip2 openssh-client libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

ENTRYPOINT []
CMD ["/bin/bash"]