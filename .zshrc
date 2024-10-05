# REFERENCE: Differences between .zshrc and .zprofile files.
# https://mac.install.guide/terminal/zshrc-zprofile
# https://apple.stackexchange.com/questions/436314/whats-the-correct-file-to-store-environmental-variables-for-zsh

# Enable zsh shell completions
autoload -U compinit; compinit

# aliases
## drone cli
alias drone="op run -- drone"
## git
### Top 10 git commands. Candidates for git aliases
alias freqgit='history | cut -c 8- | grep git | sort | uniq -c  | sort -n -r | head -n 10'
## neovim
alias vi="nvim"
alias vim="nvim"
# completions
## devbox
if [[ ! -a $(brew --prefix)/share/zsh/site-functions/_devbox ]]; then
    devbox completion zsh > $(brew --prefix)/share/zsh/site-functions/_devbox
    exec zsh -l
fi

# exports
## colima docker replacement
export COLIMA_VM="default"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# evals
## Starship (https://starship.rs/)
eval "$(starship init zsh)"
