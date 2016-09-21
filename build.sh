#!/usr/bin/env bash

set -a
set -u
set -e

. ./env-vars.sh

docker build -t ${NAMING_CONVENTION_DOCKER_ORG_NAME}/${NAMING_CONVENTION_DOCKER_IMAGE_NAME} .
