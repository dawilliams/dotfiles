# aliases 
## ~/.dotfiles bare git repository
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
## drone cli
alias drone="op run -- drone"

## neovim
alias vi="nvim"
alias vim="nvim"
## saml2aws
alias sal="saml2aws login"
alias saedev="saml2aws exec --exec-profile dev ${SHELL}"
alias saeplt="saml2aws exec --exec-profile plt ${SHELL}"
alias saeprd="saml2aws exec --exec-profile prd ${SHELL}"
alias saestg="saml2aws exec --exec-profile stg ${SHELL}"
## teleport
alias tpl="tsh login --proxy=teleport.gcp.shipttech.com:443"
alias tpkls="tsh kube ls"

# sources
## asdf
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

## 1password shell plugins
source /Users/dwilliams/.config/op/plugins.sh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
