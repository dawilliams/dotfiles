#!/bin/zsh

# Create array of kegs or casks to install with Homebrew
kegs=('zsh')
casks=('wezterm' 'rectangle' '1Password' 'todoist' 'sync')

for k in ${kegs}; do
    brew install $k
done

for c in ${casks}; do
    brew install --cask $c
done

# https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash

# Install devbox global packages
devbox global install
