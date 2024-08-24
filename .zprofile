# REFERENCE: Differences between .zshrc and .zprofile files.
# https://mac.install.guide/terminal/zshrc-zprofile

## Homebrew
### Add Homebrew to $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

## devbox
### Use devbox global packages in host shell (https://www.jetify.com/devbox/docs/devbox_global/)
eval "$(devbox global shellenv --init-hook)"
