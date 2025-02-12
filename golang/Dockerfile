FROM docker.io/golang:1.24.0

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/user

# Set SHELL to configure the default shell used in web terminals
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN mkdir /home/user && chgrp -R 0 /home/ && chmod -R g=u /home/

CMD ["tail", "-f", "/dev/null"]
