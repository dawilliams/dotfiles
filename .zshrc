# Enable zsh shell completions
autoload -U compinit; compinit

# Completions
if [[ ! -a $(brew --prefix)/share/zsh/site-functions/_devbox ]]; then
    devbox completion zsh > $(brew --prefix)/share/zsh/site-functions/_devbox
    exec zsh -l
fi
