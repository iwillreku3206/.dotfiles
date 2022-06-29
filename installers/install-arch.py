#!/usr/bin/python

import subprocess
from git import Repo

pacman.refresh()

# install yay
pacman.install('go')
Repo.clone_from('https://aur.archlinux.org/yay.git', '.')
subprocess.call('installers/helpers/run_makepkg.sh ./yay')
