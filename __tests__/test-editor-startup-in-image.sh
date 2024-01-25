#!/bin/bash
set -euo pipefail

CLOUD_DEV_IMAGE=${CLOUD_DEV_IMAGE:-"quay.io/mloriedo/cloud-dev-images:ubi9"}
EDITOR_IMAGE=${EDITOR_IMAGE:-"quay.io/che-incubator/che-code:insiders"}

TEST_ID=$(printf "%03d" $((RANDOM % 1000)))
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Testing CLOUD_DEV_IMAGE: ${CLOUD_DEV_IMAGE} / TEST_ID: ${TEST_ID}"

function cleanup {
    echo ""
    echo "##############################################"
    echo "##                                          ##"
    echo "##                DELETING DW               ##"
    echo "##                                          ##"
    echo "##############################################"
    kubectl delete dw/dw-${TEST_ID}
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
echo "EDITOR_IMAGE: ${EDITOR_IMAGE}"
export EDITOR_CONTRIB=$(cat "${SCRIPT_DIR}"/editor-contribution.yaml | sed "s|IMAGE_NAME|${EDITOR_IMAGE}|g")
kubectl apply -f - <<< "${EDITOR_CONTRIB}"

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##             CREATE DW CR                 ##"
echo "##                                          ##"
echo "##############################################"
export DW=$(cat "${SCRIPT_DIR}"/devworkspace.yaml | sed "s|CLOUD_DEV_IMAGE|${CLOUD_DEV_IMAGE}|g" | sed "s|TEST_ID|${TEST_ID}|g")
kubectl apply -f - <<< "${DW}"

echo ""
echo "##############################################"
echo "##                                          ##"
echo "##    WAIT FOR DEPLOYMENT AVAILABILITY      ##"
echo "##                                          ##"
echo "##############################################"
export DEPLOYMENT=$(kubectl get dw dw-${TEST_ID} -o jsonpath='{..devworkspaceId}')
kubectl wait --for=condition=available --timeout=60s deployment/$DEPLOYMENT

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
echo "##         \"Web UI available at ...\"        ##"
echo "##                                          ##"
echo "##############################################"
export VS_CODE_LOGS=$(kubectl exec -it $POD -c dev-tooling -- /bin/sh -c "cat /checode/entrypoint-logs.txt")
if grep "Web UI available at http://localhost:3100/" <<< "${VS_CODE_LOGS}"; then
    echo "SUCCESS: Found expected string in VS Code entrypoint logs"
else
    echo "FAILURE: Did not find expected string in VS Code entrypoint logs"
    export IMAGE_TAG=$(echo "${CLOUD_DEV_IMAGE}" | sed "s|.*:||g")
    echo "${VS_CODE_LOGS}" > "${SCRIPT_DIR}"/logs/"${IMAGE_TAG}"_vscode_entrypoint_logs.txt
    echo "Look at VS Code startup logs in "${SCRIPT_DIR}"/logs/${IMAGE_TAG}_vscode_entrypoint_logs.txt"
    exit 1
fi
