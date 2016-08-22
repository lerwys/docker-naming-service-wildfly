#!/usr/bin/env bash

set -a
set -e
set -u

JBOSS_HOME=/opt/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh

function wait_for_server() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    sleep 1
  done
}

echo "=> Executing the commands"
$JBOSS_CLI -c --file=`dirname "$0"`/commands.cli
