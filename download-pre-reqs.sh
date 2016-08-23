#!/usr/bin/env bash

# Source env vars
. ./env-vars.sh

curl -o deploy/postgresql-${POSTGRES_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar
