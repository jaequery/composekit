#!/bin/bash
#
# Please see the LICENSE file for details.
#

set -e

if [[ "$(hak-env)" == "Linux" ]]; then
  sudo docker-compose up -d
else
  docker-compose up -d
fi

