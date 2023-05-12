FROM docker.io/ubuntu:23.04

ENV HOME=/home/ubuntu
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

RUN apt-get update --yes && \
    # - apt-get upgrade is run to patch known vulnerabilities in apt-get packages as
    #   the ubuntu base image is rebuilt too seldom sometimes (less than once a month)
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
    curl \
    ca-certificates \
    git \
    locales \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# nodejs 16 + VSCODE_NODEJS_RUNTIME_DIR are required on ubi9 based images
# until we fix https://github.com/eclipse/che/issues/21778
# When fixed, we won't need this Dockerfile anymore.
# c.f. https://github.com/che-incubator/che-code/pull/120
RUN \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
export NVM_DIR="$HOME/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 16.20.0
ENV VSCODE_NODEJS_RUNTIME_DIR="$HOME/.nvm/versions/node/v16.20.0/bin/"

CMD ["tail", "-f", "/dev/null"]

