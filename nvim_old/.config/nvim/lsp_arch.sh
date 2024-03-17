#!/bin/bash

# if [ "$EUID" -ne 0 ]
#   then echo "This script needs to be run as root"
#   exit
# fi

yay -Sy \
  clang \
  pyright \
  jdtls \
  lua-language-server \
  omnisharp-roslyn-bin \
  rust-analyzer

