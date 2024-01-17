#!/bin/bash
set -euo pipefail

CLUSTER_URL=${CLUSTER_URL:-"https://api.sandbox-m2.ll9k.p1.openshiftapps.com:6443"}
VS_CODE_IMAGE=${VS_CODE_IMAGE:-"quay.io/che-incubator/che-code:insiders"}

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##             CLUSTER LOGIN                ##"
echo "##                                          ##"
echo "##############################################"
oc login --token "${CLUSTER_TOKEN}" --server="${CLUSTER_URL}"

function cleanup {
    echo ""
    echo "##############################################"
    echo "##                                          ##"
    echo "##              DELETING DWT                ##"
    echo "##                                          ##"
    echo "##############################################"
    kubectl delete dwt/editor
}
trap cleanup EXIT


echo ""
echo "##############################################"
echo "##                                          ##"
echo "##           CREATE EDITOR CR               ##"
echo "##                                          ##"
echo "##############################################"
echo "VS_CODE_IMAGE: ${VS_CODE_IMAGE}"
export VS_CODE_CONTRIB=$(cat ./tests/editor-contribution.yaml | sed "s|IMAGE_NAME|${VS_CODE_IMAGE}|g")
kubectl apply -f - <<< "${VS_CODE_CONTRIB}"

 CLOUD_DEV_IMAGES_TAGS=( "ubi8"
                    "ubi9"
                   # "alpine"
                   # "busybox"
                   # "docker"
                   # "golang"
                   # "openjdk"
                   # "fedora"
                   "ubuntu"
                  )

for tag in "${CLOUD_DEV_IMAGES_TAGS[@]}"; do
    SECONDS=0
    export CLOUD_DEV_IMAGE=quay.io/mloriedo/cloud-dev-images:"${tag}"
    echo ""
    echo -n "Testing editor startup in image ${CLOUD_DEV_IMAGE}..."
    ./tests/test-editor-startup-in-image.sh  > ./tests/logs/"${tag}"_stdout.txt 2> ./tests/logs/"${tag}"_stderr.txt
    duration=$SECONDS
    echo "done in $duration sec."
done
