#!/bin/bash

set -e

echo "Would you like to configure <SOMETHING>?"
read answer
if [ "$answer" == "y" ]
  then
    echo "CONFIGURE SOMETHING HERE!"
fi

exit 0
