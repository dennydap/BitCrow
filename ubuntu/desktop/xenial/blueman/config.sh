#!/bin/bash

set -e

echo "Pick a controllermode(dual/bredr/le)?"
read controllermode
echo "$controllermode" > $(dirname $0)/controllermode.config

exit 0
