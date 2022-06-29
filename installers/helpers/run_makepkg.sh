#!/bin/bash

if [ "$1" = "" ]
then
    echo NO ARGUMENTS GIVEN
    echo "USAGE: run_makepkg.sh /path/to/repo"
    exit 1
else
    cd $1
    makepkg -i --noconfirm
fi