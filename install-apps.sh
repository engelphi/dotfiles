#!/bin/bash

source install-apps-linux.sh
source install-apps-mac.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  install_mac
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  install_linux
fi
