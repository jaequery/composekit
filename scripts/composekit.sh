#!/bin/bash
#
# Please see LICENSE for details.

function usage() {
  echo "composekit: A simple docker-based project starter"
  echo
  echo "Usage: composekit install|on|off|up|uninstall"
  echo "Usage: composekit clone jaequery/honeybadger.git project-name"
  echo
  echo "composekit install   - Install docker, docker-compose, docker-machine on the machine"
  echo "composekit on|off    - Turn on|off the docker service"
  echo "composekit clone     - Clone a github project (eg. jaequery/honeybadger) and updates the VIRTUAL_ENV variable in docker-compose.yml"
  echo "composekit up        - Issue docker-compose up -d"
  echo "composekit uninstall - Uninstall composekit from the machine"
  echo "composekit test      - Test the operation of composekit on your machine"
  echo
  exit
}

COMMANDS="install on off clone up uninstall test -h --help"

if [[ $COMMANDS =~ (^|[[:space:]])$1($|[[:space:]]) ]]; then
  CMD=$1
  shift
  if [[ "${CMD}" == "-h" || "${CMD}" == "--help" ]]; then
    usage
  fi
  composekit-${CMD} "$@"
else
  usage
fi

