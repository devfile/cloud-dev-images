FROM docker.io/alpine:3.21.2

# ENV CURL_VERSION="8.0.1-r0"
# ENV LIBCRYPTO1_VERSION="1.1.1t-r2"

# RUN apk update && \
#    apk add \
#      libcrypto1.1="${LIBCRYPTO1_VERSION}" \
#      curl="${CURL_VERSION}"

## nodejs 
#RUN export REPO="nodejs/node" && \
#    export RELEASE="v16.20.0" && \
#    export ATTACHMENT="gh_${RELEASE:1}_linux_amd64.tar.gz" && \
#    export CHECKSUMS="gh_${RELEASE:1}_checksums.txt" && \
#    export PATH_IN_TAR="gh_${RELEASE:1}_linux_amd64/bin/gh" && \
#    /download-gh-release-attachment.sh ${REPO} ${RELEASE} ${ATTACHMENT} ${CHECKSUMS} && \
#    /untar-and-install.sh ${ATTACHMENT} ${PATH_IN_TAR}

CMD ["tail", "-f", "/dev/null"]
