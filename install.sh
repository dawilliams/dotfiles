#!/bin/zsh

# Create array of kegs or casks to install with Homebrew
kegs=('zsh')
casks=('wezterm' 'rectangle' '1Password' 'todoist' 'sync')

for k in ${kegs}; do
    # Location of homebrew on Apple Silicon
    /opt/homebrew/bin/brew install $k
done

for c in ${casks}; do
    # Location of homebrew on Apple Silicon
    /opt/homebrew/bin/brew install --cask $c
done

# https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash

# Install devbox global packages
devbox global install

# https://github.com/docker/scout-cli
curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s --
