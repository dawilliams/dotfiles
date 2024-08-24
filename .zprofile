# REFERENCE: Differences between .bashrc and .bash_profile files.
# https://www.redswitches.com/blog/bashrc-vs-bash_profile-in-linux/

## Homebrew
### Add Homebrew to $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

## devbox
### Use devbox global packages in host shell (https://www.jetify.com/devbox/docs/devbox_global/)
eval "$(devbox global shellenv --init-hook)"
