# Enable zsh shell completions
autoload -U compinit; compinit

# aliases
## drone cli
alias drone="op run -- drone"
## Top 10 git commands. Candidates for git aliases
alias freqgit='history | cut -c 8- | grep git | sort | uniq -c  | sort -n -r | head -n 10'

# completions
## devbox
if [[ ! -a $(brew --prefix)/share/zsh/site-functions/_devbox ]]; then
    devbox completion zsh > $(brew --prefix)/share/zsh/site-functions/_devbox
    exec zsh -l
fi
