#!/bin/zsh

# install omz first
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

brew tap homebrew/homebrew-cask-versions

# main apps
brew install qalculate-gtk

brew install --cask firefox-developer-edition
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask krita
brew install --cask gimp
brew install --cask discord
brew install --cask moonlight
brew install --cask teamviewer
brew install --cask obs
brew install --cask vlc
brew install --cask alfred
brew install --cask macs-fan-control
brew install --cask onlyoffice
brew install --cast virtualbox
brew install --cask virtualbox-extension-pack

# development

# node + nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install 17 && nvm use 17
corepack enable

brew install cmake
brew install go
brew install python3
brew install vim

brew install --cask dotnet-sdk
brew install --cask temurin8
brew install --cask temurin11
brew install --cask temurin


# games
brew install --cask steam
brew install --cask battle-net
brew install --cask multimc


# symlink configs

source './symlinks.sh'

cd .vim/pack/ycm/start/YouCompleteMe
./install.py --all
cd /.dotfiles
rm -rf ~/.dotfiles/.vim/pack/ycm/start/YouCompleteme/third_party/ycmd/third_party/tern_runtime

alias vim=/usr/local/bin/vim

# other settings
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles true 
