FROM docker.io/busybox:1.36.1-glibc

ENV LD_LIBRARY_PATH=/lib/

RUN echo "echo 1" > /bin/openssl && \
    chmod +x /bin/openssl

CMD ["tail", "-f", "/dev/null"]
