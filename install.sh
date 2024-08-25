#!/bin/zsh

# Create array of things to install with Homebrew
tools=('zsh' 'wezterm')

for t in $tools; do
    brew install $t
done

# https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash
