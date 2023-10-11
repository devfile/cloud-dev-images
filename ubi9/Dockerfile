FROM registry.access.redhat.com/ubi9/ubi:9.2-722.1692769367

# Installa nodejs, required on base images with libcrypto version > 1.1
# https://github.com/eclipse/che/issues/21778
RUN dnf install -y nodejs
ENV VSCODE_NODEJS_RUNTIME_DIR="/usr/bin"

# Set SHELL to configure the default shell used in web terminals
# https://github.com/eclipse/che/issues/22524
ENV SHELL=/usr/bin/bash

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/user

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

CMD ["tail", "-f", "/dev/null"]

