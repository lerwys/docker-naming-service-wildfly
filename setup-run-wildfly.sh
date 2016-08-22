#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="naming-service-net"
DNS_IP="10.0.0.72"

# Build image
./build.sh

# Create docker network
./create-net.sh ${NET_NAME}

# Run postgres
./run-wildfly.sh ${NET_NAME} ${DNS_IP}
