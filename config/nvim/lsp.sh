#!/bin/bash

# ts/js
npm install -g \
  typescript \
  vscode-langservers-extracted \
  cssmodules-language-server \
  dockerfile-language-server-nodejs \
  svelte-language-server \
  vim-language-server \
  vls \
  bash-language-server \
  emmet-ls \
  @tailwindcss/language-server \
  prettier \
  @astrojs/language-server \
  graphql-language-service-cli \
  sql-language-server


pip3 install cmake-language-server
composer require phan/phan
go install github.com/arduino/arduino-language-server@latest


### NOT PROVIDED: clangd, jdtls (AUR/brew), pyright (pacman/brew), sumenko_lua (brew/pacman), omnisharp (aur-bin/brew-tap), rust-analyzer (pacman/brew)
