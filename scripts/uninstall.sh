#!/bin/bash
#

set -e

if [[ "$(composekit-env)" != "Linux" ]]; then
  dinghy destroy || true
  brew uninstall docker-compose || true
  brew uninstall docker-machine || true
  brew uninstall docker || true
  brew uninstall dinghy || true
fi

sudo npm uninstall -g composekit