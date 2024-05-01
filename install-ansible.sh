#!/bin/bash

if [ -f /etc/arch-release ]
then
  sudo pacman -Sy ansible ansible-core
fi

if [ -f /etc/debian_version ]
then
  sudo apt-get install ansible
fi

if [ $(uname) == "Darwin" ]
then
  # install brew first
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ansible
fi

ansible-galaxy collection install kewlfft.aur
ansible-playbook --ask-become-pass bootstrap.yml
