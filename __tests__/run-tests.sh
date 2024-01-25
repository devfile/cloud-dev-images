#!/bin/bash
set -euo pipefail

CLUSTER_URL=${CLUSTER_URL:-"https://api.sandbox-m2.ll9k.p1.openshiftapps.com:6443"}
EDITOR_IMAGE=${EDITOR_IMAGE:-"quay.io/che-incubator/che-code:insiders"}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##             CLUSTER LOGIN                ##"
echo "##                                          ##"
echo "##############################################"
oc login --token "${CLUSTER_TOKEN}" --server="${CLUSTER_URL}"

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##      RUNNING TESTS ON ALL IMAGES         ##"
echo "##                                          ##"
echo "##############################################"
CLOUD_DEV_IMAGES_TAGS=( "ubi8"
                    "ubi9"
                   "alpine"
                   "busybox"
                   "docker"
                   "golang"
                   "openjdk"
                   "fedora"
                   "ubuntu"
                  )

for tag in "${CLOUD_DEV_IMAGES_TAGS[@]}"; do
    SECONDS=0
    export CLOUD_DEV_IMAGE=quay.io/mloriedo/cloud-dev-images:"${tag}"
    echo -n "Testing editor startup in image ${CLOUD_DEV_IMAGE}..."
    if "${SCRIPT_DIR}/test-editor-startup-in-image.sh  > "${SCRIPT_DIR}/logs/"${tag}"_stdout.txt 2> "${SCRIPT_DIR}/logs/"${tag}"_stderr.txt; then
        duration=$SECONDS
        echo "started in $duration sec."
    else
        duration=$SECONDS
        echo "failed in $duration sec."
    fi
done
