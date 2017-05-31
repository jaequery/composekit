#!/bin/bash
#
# Please see the LICENSE file for details.
#

set -e
set -x

CWD=$(pwd)

rm -rf test-project
composekit install || echo "Skipping install step."
composekit off
composekit on
composekit clone jaequery/honeybadger.git test-project
cd test-project
composekit up
composekit off

cd ${CWD}
rm -rf test-project
