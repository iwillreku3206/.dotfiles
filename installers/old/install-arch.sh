#!/bin/bash
# Assumed set-up: base archiso with git installed

echo "An internet connection is required for this script. Please make sure that you have an internet connection. Press Ctrl+C to exit the script or press ENTER to continue"
read NONE # the none variable will not be used later on

# enable parallel downloads
sed -i 's/^#ParallelDownloads = 5$/ParallelDownloads\ =\ 5/g' /etc/pacman.conf

# install python dependencies
python -m ensurepip --upgrade

pip3 install pythondialog python-pacman GitPython

# run script
./install-arch.py