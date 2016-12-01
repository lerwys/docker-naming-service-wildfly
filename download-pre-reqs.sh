#!/usr/bin/env bash

set -a
set -e
set -u

# Source env vars
. ./env-vars.sh

curl -o postgresql-${POSTGRES_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar

# Clone ESS java config
git clone --branch=${ESS_JAVA_CONFIG_VERSION} https://bitbucket.org/europeanspallationsource/ess-java-config ${ESS_JAVA_CONFIG_REPO}
# Clone naming-convention-tool
git clone --branch=${NAMING_CONVENTION_VERSION} https://bitbucket.org/europeanspallationsource/naming-convention-tool ${NAMING_CONVENTION_REPO}
# Clone wait-for-it
git clone --branch=${WAIT_FOR_IT_VERSION} https://github.com/vishnubob/wait-for-it ${WAIT_FOR_IT_REPO}

# Build Java Config
cd ${ESS_JAVA_CONFIG_REPO}
mvn install
cd ..

# Build Naming Convention tool
cd ${NAMING_CONVENTION_REPO}
mvn install -P local
cd ..
