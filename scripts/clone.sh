#!/bin/bash
#
# Please see the LICENSE file for details.
#

set -e

GIT_PATH=$1
PROJECT_DIR=$2
git clone http://github.com/${GIT_PATH} ${PROJECT_DIR}
cd ${PROJECT_DIR}

if [[ -f docker-compose.yml ]]; then
  sed -i -e "s/VIRTUAL_HOST=honeybadger.docker/VIRTUAL_HOST=${PROJECT_DIR}.docker/" docker-compose.yml
else
  echo "Unable to find docker-compose.yml"
  exit 1
fi

