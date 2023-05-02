# aliases 
## ~/.dotfiles bare git repository
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
## neovim
alias vi="nvim"
alias vim="nvim"
## saml2aws
alias sal="saml2aws login"

# sources
## asdf
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

## 1password shell plugins
source /Users/dwilliams/.config/op/plugins.sh
