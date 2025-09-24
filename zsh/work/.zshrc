# REFERENCE: Differences between .zshrc and .zprofile files.
# https://mac.install.guide/terminal/zshrc-zprofile
# https://apple.stackexchange.com/questions/436314/whats-the-correct-file-to-store-environmental-variables-for-zsh

# Enable zsh shell completions
autoload -U compinit; compinit
# Enable zsh help
unalias run-help
autoload run-help
HELPDIR=$(command brew --prefix)/share/zsh/help

# aliases
## drone cli
#alias drone="op run -- drone"
## git
### Top 10 git commands. Candidates for git aliases
alias freqgit='history | cut -c 8- | grep git | sort | uniq -c  | sort -n -r | head -n 10'
## neovim
alias nv="nvim"
## ripgrep
alias rgh="rg --hidden "
## zsh
alias help="run-help"

# completions
# exports
## colima docker replacement
#export COLIMA_VM="default"
#export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
#export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"
## starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# functions
## grype
### Create html page from grype scan and open it with your default browser
#### Requires templates from the grype git repository to be local.
#grypehtml() {
#    if [[ -z "$*" ]]; then
#      print "ERROR: The ${0} function requires a container name or path as its arguement."
#      print "The ${0} function runs grype on the supplied container, saves the results to html and opens the default browser"
#      return
#    fi
    
    # The awk -F option is field separator
    # $NF is the last field.
#    container_name=$(echo ${1} | awk -F / '{print $NF;}')
#    file_name=${container_name}_vulns_$(date +"%s").html
#    print "grype --output template --template ~/dev/ext/grype/templates/html.tmpl ${1} > /tmp/${file_name}"
#    grype --output template --template ~/dev/ext/grype/templates/html.tmpl ${1} > /tmp/${file_name}
#    open /tmp/${file_name}
#}
### Only provide grype's summary to stdout and redirect details to file in the /tmp directory
#grypesum() {
#    if [[ -z "$*" ]]; then
#      print "ERROR: The ${0} function requires a container name or path as its arguement."
#      print "The ${0} function runs grype on the supplied container, printing the summary and redirecting the details to a file in the /tmp directory"
#      return
#    fi
    # The awk -F option is field separator
    # $NF is the last field.
#    container_name=$(echo ${1} | awk -F / '{print $NF;}')
#    file_name=${container_name}_vulns_$(date +"%s")
#    print "grype ${1} > /tmp/${file_name}"
#    grype ${1} > /tmp/${file_name}
#}

# evals
## Mise (https://mise.jdx.dev)
eval "$(mise activate zsh)"
## Starship (https://starship.rs/)
eval "$(starship init zsh)"
## direnv
#eval "$(direnv hook zsh)"
