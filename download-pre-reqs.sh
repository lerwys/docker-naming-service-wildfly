#!/usr/bin/env bash

# Source env vars
. ./env-vars.sh

curl -o deploy/postgresql-${POSTGRES_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar

# Clone ESS java config
git clone --branch=${ESS_JAVA_CONFIG_VERSION} https://bitbucket.org/europeanspallationsource/ess-java-config ${ESS_JAVA_CONFIG_REPO}
# Clone naming-convention-tool
git clone --branch=${NAMING_CONVENTION_VERSION} https://github.com/lerwys/naming-convention-tool ${NAMING_CONVENTION_REPO}

# Build Java Config
cd ${ESS_JAVA_CONFIG_REPO}
mvn install
cd ..

# Build Naming Convention tool
cd ${NAMING_CONVENTION_REPO}
mvn install -P local
cd ..
