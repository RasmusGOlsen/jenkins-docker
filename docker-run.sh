#!/usr/bin/env bash
scriptdir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

docker run \
    --rm \
    -e "TZ=Europe/Copenhagen" \
    -e "JAVA_OPTS=-Djenkins.install.runSetupWizard=false -Dhudson.model.DirectoryBrowserSupport.CSP=" \
    -p 8080:8080 \
    $(docker build -q ${scriptdir}) \
    "$@"
