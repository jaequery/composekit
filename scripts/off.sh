#!/bin/bash
#
# Please see the LICENSE file for details.
#

set -e

if [[ "$(composekit-env)" == "Linux" ]]; then
  sudo service docker stop
else
  dinghy off
fi

