FROM registry.access.redhat.com/ubi8/ubi:8.8-1032.1692772289

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=/home/user

# Set SHELL to configure the default shell used in web terminals
ENV SHELL=/usr/bin/bash

# Set permissions on /home to allow arbitrary users to write
RUN chgrp -R 0 /home

CMD ["tail", "-f", "/dev/null"]
