#!/bin/zsh

brew tap homebrew/homebrew-cask-versions

source "./install-common.sh"

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


source "./install-common-post.sh"
alias vim=/usr/local/bin/vim
source "../symlinks/symlink-mac.sh"

# other settings
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles true 
