#!/usr/bin/env bash

set -eux

KUBERNETES_VERSION="v1.21.2"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master"

# TODO: only check modified charts
# https://github.com/DataDog/helm-charts/blob/main/.github/kubeval.sh
CHART_DIRS=$(ls -d charts/*)

for CHART_DIR in ${CHART_DIRS}; do
    echo "Running kubeval for folder: '$CHART_DIR'"
    helm dep up "${CHART_DIR}" && helm template --kube-version "${KUBERNETES_VERSION#v}" --values "${CHART_DIR}"/ci/kubeval-values.yaml "${CHART_DIR}" | kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done
