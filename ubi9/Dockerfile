FROM registry.access.redhat.com/ubi9/ubi:9.3-1476

# Set SHELL to configure the default shell used in web terminals
# https://github.com/eclipse/che/issues/22524
ENV SHELL=/usr/bin/bash

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/user

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

# Install nodejs 18 + set VSCODE_NODEJS_RUNTIME_DIR on images with libcrypto version > 1.1
# until we fix https://github.com/eclipse/che/issues/21778
# c.f. https://github.com/che-incubator/che-code/pull/317
RUN \
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
 export NVM_DIR="$HOME/.nvm" && \
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
 nvm install 18.18.0
ENV VSCODE_NODEJS_RUNTIME_DIR="$HOME/.nvm/versions/node/v18.18.0/bin/"

CMD ["tail", "-f", "/dev/null"]
