#!/usr/bin/env bash

set -a
set -u
set -e

# Source env vars
. ./env-vars.sh

# Copy files to correct locations
cp ${NAMING_CONVENTION_TARGET_WAR} /deploy
cp postgresql-${POSTGRES_VERSION}.jar /deploy
