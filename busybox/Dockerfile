FROM docker.io/busybox:1.37.0-glibc

ENV LD_LIBRARY_PATH=/lib/

RUN echo "echo 1" > /bin/openssl && \
    chmod +x /bin/openssl

CMD ["tail", "-f", "/dev/null"]
