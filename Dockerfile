FROM alexjesper/node-headless-chrome

#####
# Install angular cli
ENV ANGULAR_CLI_VERSION 8.3.5

RUN npm i -g @angular/cli@${ANGULAR_CLI_VERSION}

#####
# Install Ionic
ENV IONIC_VERSION 5.2.3

RUN apt-get update && apt-get install -y git bzip2 openssh-client && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean