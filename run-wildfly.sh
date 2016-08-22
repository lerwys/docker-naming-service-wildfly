#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"

WILDFLY_PORT=8080
LOCAL_WILDFLY_PORT=8080
ADMIN_PORT=9990
LOCAL_ADMIN_PORT=9990

# Run postgres
docker run  --name naming-service-wildfly --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${LOCAL_WILDFLY_PORT}:${WILDFLY_PORT} -p ${LOCAL_ADMIN_PORT}:${ADMIN_PORT}\
    -d lerwys/docker-naming-service-wildfly /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
