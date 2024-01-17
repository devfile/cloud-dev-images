#!/bin/bash
set -euo pipefail

CLOUD_DEV_IMAGE=${CLOUD_DEV_IMAGE:-"quay.io/mloriedo/cloud-dev-images:ubi9"}
TEST_ID=$(printf "%03d" $((RANDOM % 1000)))
echo "Testing CLOUD_DEV_IMAGE: ${CLOUD_DEV_IMAGE} / TEST_ID: ${TEST_ID}"

function cleanup {
    echo ""
    echo "##############################################"
    echo "##                                          ##"
    echo "##                DELETING DW               ##"
    echo "##                                          ##"
    echo "##############################################"
    kubectl delete dw/dw-${TEST_ID}
}
trap cleanup EXIT

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##             CREATE DW CR                 ##"
echo "##                                          ##"
echo "##############################################"
export DW=$(cat ./tests/devworkspace.yaml | sed "s|CLOUD_DEV_IMAGE|${CLOUD_DEV_IMAGE}|g" | sed "s|TEST_ID|${TEST_ID}|g")
kubectl apply -f - <<< "${DW}"

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##    WAIT FOR DEPLOYMENT AVAILABILITY      ##"
echo "##                                          ##"
echo "##############################################"
export DEPLOYMENT=$(kubectl get dw dw-${TEST_ID} -o jsonpath='{..devworkspaceId}')
kubectl wait --for=condition=available --timeout=20s deployment/$DEPLOYMENT

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##           WAIT FOR POD READY             ##"
echo "##                                          ##"
echo "##############################################"
export POD=$(kubectl get pod -l "controller.devfile.io/devworkspace_name"=dw-${TEST_ID} -o jsonpath="{ ..metadata.name}")
kubectl wait --for=condition=ready --timeout=20s pod/$POD

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##       READ VS CODE ENTRYPOINT LOGS       ##"
echo "##           LOOK FOR STRING                ##"
echo "##Listening and serving HTTP on 0.0.0.0:3333##"
echo "##                                          ##"
echo "##############################################"
export VS_CODE_LOGS=$(kubectl exec -it $POD -c dev-tooling -- /bin/bash -c "cat /checode/entrypoint-logs.txt")
grep "Listening and serving HTTP on 0.0.0.0:333" <<< "${VS_CODE_LOGS}"
