#!/usr/bin/env bash

POSTGRES_VERSION="$1"

# Change this if your Host have a "sane" DNS like 168.192.1.1
OPTNAMESERVER="echo nameserver 10.0.0.71 > /etc/resolv.conf \&\& \\\\"
#OPTNAMESERVER="\\\\"

sed -e "s|OPTNAMESERVER|${OPTNAMESERVER}|g" -e "s|ENV_POSTGRES_VERSION|${POSTGRES_VERSION}|g" Dockerfile.ini > Dockerfile

docker build -t lerwys/docker-naming-service-wildfly .
