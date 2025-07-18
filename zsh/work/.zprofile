# REFERENCE: Differences between .zshrc and .zprofile files.
# https://mac.install.guide/terminal/zshrc-zprofile
# https://apple.stackexchange.com/questions/436314/whats-the-correct-file-to-store-environmental-variables-for-zsh

## Homebrew
### Add Homebrew to $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

## Populate secret values in the .op_secrets.zsh file with 1password CLI
#op  inject --in-file "${HOME}/.op_secrets.zsh" | while read -r line; do
#  eval "$line"
#done
