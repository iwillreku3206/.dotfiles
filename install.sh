#!/bin/zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Using GNU/Linux
  source ./installers/install-linux.sh  
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # osx
  source ./installers/install-mac.sh
fi
