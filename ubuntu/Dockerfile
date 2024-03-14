FROM docker.io/ubuntu:24.04

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/ubuntu

# Set SHELL to configure the default shell used in web terminals
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

# Uncomment this when https://github.com/che-incubator/che-code/pull/324 is merged
# renovate: datasource=repology depName=ubuntu_24_04/openssl versioning=loose
# ENV OPENSSL_VERSION="3.0.10-1ubuntu3"
# RUN apt-get update --yes && \
#    apt-get upgrade --yes && \
#    apt-get install --yes --no-install-recommends \
#    openssl:amd64="${OPENSSL_VERSION}"

# Install curl and ca_certificates (required to install nodejs) and git (optional)
# renovate: datasource=repology depName=ubuntu_24_04/curl versioning=loose
ENV CURL_VERSION="8.5.0-2ubuntu2"
# renovate: datasource=repology depName=ubuntu_24_04/ca-certificates versioning=loose
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=repology depName=ubuntu_24_04/git versioning=loose
ENV GIT_VERSION="1:2.43.0-1ubuntu1"
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
 nvm install 18.18.0
ENV VSCODE_NODEJS_RUNTIME_DIR="$HOME/.nvm/versions/node/v18.18.0/bin/"

CMD ["tail", "-f", "/dev/null"]
