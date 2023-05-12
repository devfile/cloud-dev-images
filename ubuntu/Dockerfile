FROM docker.io/ubuntu:23.04

# Set HOME so that CRI-o can patch
ENV HOME=/home/ubuntu

# Set SHELL to configure the default shell used in web terminals
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

# Install curl and ca_certificates (required to install nodejs) and git (optional)
# renovate: datasource=repology depName=ubuntu_23_04/curl versioning=loose
ENV CURL_VERSION="7.88.1-8ubuntu1"
# renovate: datasource=repology depName=ubuntu_23_04/ca-certificates versioning=loose
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=repology depName=ubuntu_23_04/git versioning=loose
ENV GIT_VERSION="1:2.39.2-1ubuntu1"
RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
    ca-certificates:amd64="${CA_CERTIFICATES_VERSION}" \
    curl:amd64="${CURL_VERSION}" \
    git:amd64="${GIT_VERSION}" && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# The install of nodejs 16 + the export of VSCODE_NODEJS_RUNTIME_DIR
# environment variable are required on base images that have openssl v3 or higher.
# This is a temporary workaround for https://github.com/eclipse/che/issues/21778
# See also https://github.com/che-incubator/che-code/pull/120
RUN \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
export NVM_DIR="$HOME/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 16.20.0
ENV VSCODE_NODEJS_RUNTIME_DIR="$HOME/.nvm/versions/node/v16.20.0/bin/"

CMD ["tail", "-f", "/dev/null"]
