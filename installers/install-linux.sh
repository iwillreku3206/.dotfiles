#!/bin/zsh

# get distro
  echo "Which Linux distro are you using?"
  echo "1. Arch Linux"
  echo "2. Debian-sid"

  read distro

  if [ $distro = "1" ]
  then
    source ./install-arch.sh
  elif [ $distro = "2" ] 
  then
    source ./install-debian.sh
  else
    echo "Invalid Distro/Option"
  fi

# download necessary files



