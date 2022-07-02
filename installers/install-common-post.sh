#!/bin/zsh

# symlink configs

source '../symlinks/symlinks.sh'

# install vim-ycm
cd ~/.vim/pack/ycm/start/YouCompleteMe
./install.py --all
rm -rf ~/.dotfiles/.vim/pack/ycm/start/YouCompleteme/third_party/ycmd/third_party/tern_runtime
