#!/bin/zsh

# Create array of kegs or casks to install with Homebrew
kegs=('zsh')
casks=('wezterm' 'ghostty' 'arc' '1Password' 'todoist' 'sync' 'slack' 'obsidian')

# Run brew install on every value in the kegs array.
echo "---------------------------------------------------------------------------"
echo "Installing brew kegs"
echo "---------------------------------------------------------------------------"
for k in ${kegs}; do
    /opt/homebrew/bin/brew install $k
done

# Run brew install --cask on every value in the casks array.
echo "---------------------------------------------------------------------------"
echo "Installing brew casks"
echo "---------------------------------------------------------------------------"
for c in ${casks}; do
    /opt/homebrew/bin/brew install --cask $c
done

# Install devbox
# https://www.jetify.com/devbox/docs/installing_devbox/
echo "---------------------------------------------------------------------------"
echo "Installing devbox"
echo "---------------------------------------------------------------------------"
curl -fsSL https://get.jetify.com/devbox | bash

# Run the sync script in the devbox.json file
cd $HOME/dotfiles
echo "---------------------------------------------------------------------------"
echo "Running stow to set up dotfiles"
echo "---------------------------------------------------------------------------"
devbox run sync

# Install devbox global packages listed
echo "---------------------------------------------------------------------------"
echo "Running devbox to install global packages"
echo "---------------------------------------------------------------------------"
devbox global install
