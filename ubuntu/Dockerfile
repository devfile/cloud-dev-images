FROM docker.io/ubuntu:24.04

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/ubuntu

# Set SHELL to configure the default shell used in web terminals
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

CMD ["tail", "-f", "/dev/null"]
