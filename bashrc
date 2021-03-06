### Install
# 1. Install latest bash via brew: brew install bash
# 2. Add the new bash version to /etc/shells (https://johndjameson.com/blog/updating-your-shell-with-homebrew/) 
###############

# Source other files

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

if [ -f /usr/local/etc/bash_completion.d/aws_bash_completer ]; then
  source /usr/local/etc/bash_completion.d/aws_bash_completer
fi

# Source bash_completion.sh if it exists and is readable
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  source "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi

if [ -f /usr/local/opt/chruby/share/chruby/auto.sh ]; then
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

if [ -f /usr/local/etc/bash_completion.d/kubectl ]; then
  source /usr/local/etc/bash_completion.d/kubectl
fi

if [ -f /usr/local/etc/bash_completion.d/kubectx ]; then
  source /usr/local/etc/bash_completion.d/kubectx
fi

if [ -f /usr/local/etc/bash_completion.d/kubens ]; then
  source /usr/local/etc/bash_completion.d/kubens
fi

# Get it from the original Git repo:
# Clone the alacritty repo and follow the instructions for macOS
# https://raw.githubusercontent.com/jwilm/alacritty/v0.2.9/alacritty-completions.bash
if [ -f ~/alacritty-completions.bash ]; then
  source ~/alacritty-completions.bash
fi

###############
# Exports (custom)

export CLICOLOR=1

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export PATH=$PATH:$HOME/.config/nvim/pack/minpac/start/fzf/bin

# enable GIT prompt options
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# go
export GOPATH=$HOME/go
export GOPRIVATE="github.com/shipt/*"
export PATH=$PATH:$GOPATH/bin

# helm
export PATH="/usr/local/opt/helm@2/bin:$PATH"

export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx   # checkout `man ls` for the meaning

# protobuf
export PATH="/usr/local/opt/protobuf@3.6/bin:$PATH"

# sourcegraph
export SRC_ENDPOINT="https://sourcegraph.shipttech.com"

# vault
#export VAULT_ADDR='https://vault-east.shipttech.com'
export VAULT_ADDR='https://vault-east.staging.shipttech.com'

## Open nvr if in a nvim terminal
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi

###############
# Bash settings

# -- Prompt

# If we don't use the below git master one, use this simple
#PS1="\[$(tput setaf 6)\]\W\[$(tput sgr0)\]\[$(tput sgr0)\] \$ "

# 1. Git branch is being showed
# 2. Title of terminal is changed for each new shell
# 3. History is appended each time
export PROMPT_COMMAND='__git_ps1 "($(display_aws_okta_profile)\[$(tput setaf 1)\]$(get_cluster_short $(kxc))\[$(tput sgr0)\]:\[$(tput setaf 6)\]$(ksc)\[$(tput sgr0)\]) \[$(tput setaf 3)\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]" "\n\$ "'

# -- History

# ignoreboth ignores commands starting with a space and duplicates.
# erasedups removes all previous dups in history
export HISTCONTROL=ignoreboth:erasedups  
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
shopt -s histappend                      # append to history, don't overwrite it
shopt -s cmdhist                         # save multi line commands as one command

# Save multi-line commands to the history with embedded newlines
# instead of semicolons -- requries cmdhist to be on.
shopt -s lithist

# -- Completion
bind '"\e[A": history-search-backward' # Up arrow to backward search history with entry on command line
bind '"\e[B": history-search-forward'  # Down arrow to forward search history with entry on command line
bind "set completion-ignore-case on"   # note: bind used instead of sticking these in .inputrc
bind "set bell-style none"             # no bell
bind "set show-all-if-ambiguous On"    # show list automatically, without double tab

# Ignore files with these suffixes when performing completion.
export FIGNORE='.o:.pyc'

# Ignore files that match these patterns when 
# performing filename expansion.
export GLOBIGNORE='.DS_Store:*.o:*.pyc'

# -- Functions

aoe () {
  if [[ -z "$1" ]]
  then
    echo "You must provide the name of the local AWS profile to assume or type 'clear' to delete AWS Okta role credentials environment variables."
    return 1
  fi

  if [[ "$1" == "clear" ]] 
  then
    echo "Clearing AWS Okta role credentials environment variables"
    unset AWS_OKTA_ASSUMED_ROLE AWS_OKTA_PROFILE AWS_SECRET_ACCESS_KEY AWS_OKTA_ASSUMED_ROLE_ARN AWS_ACCESS_KEY_ID AWS_SESSION_TOKEN AWS_OKTA_SESSION_EXPIRATION AWS_SECURITY_TOKEN
  else
    $(aws-okta env $1)
  fi
}

# Used by Prompt Command
display_aws_okta_profile() {
  if [ -z ${AWS_OKTA_PROFILE+x} ]
  then
    echo ""
  else
    #echo "$(date +%H:%M)|\[$(tput setaf 3)\]$(aopv)\[$(tput sgr0)\]|\[$(tput setaf 3)\]$(aosev)\[$(tput sgr0)\] "
    echo "$(date +%H:%M)|\[$(tput setaf 3)\]$(aopv)\[$(tput sgr0)\]|$(aosev) "
  fi
}

fl () {
  if [[ -z "$1" ]]
  then
    echo "You must provide the name of the fly login target"
    echo "Ex: fl production app"
    return 1
  fi

  if [[ -z "$2" ]]
  then
    echo "You must provide the name of the fly login team-name"
    echo "Ex: fl production app"
    return 1
  fi


  if [[ "$1" == "production" ]] 
  then
    echo Running: fly --target $1 login --team-name $2 --concourse-url https://cd.shipttech.com
    fly --target $1 login --team-name $2 --concourse-url https://cd.shipttech.com
  elif [[ "$1" == "staging" ]]
  then
    echo Running: fly --target $1 login --team-name $2 --concourse-url https://cd.staing.shipttech.com
    fly --target $1 login --team-name $2 --concourse-url https://cd.staging.shipttech.com
  else
    echo Running: fly --target $1 login --team-name $2 --concourse-url https://cd.development.shipttech.com
    fly --target $1 login --team-name $2 --concourse-url https://cd.development.shipttech.com
  fi
}

# Used by Prompt Command
get_cluster_short() {
  echo "$1" | cut -d . -f1
}

# howdoi (pip install howdoi) https://github.com/gleitz/howdoi

gcmc() {
  if [[ -z "$1" ]]
  then
    echo "You must provide the git comment message. The clubhouse card pulled from the current branch name will be appended to this."
    echo "This function gets the clubhouse card from the 1st field of the current branch name where the delimiter is a '_'."
    echo "The command it uses to get the clubhouse card is (git branch --show-current | cut -d '_' -f1)"
    echo "Then runs 'git commit -m <message>' where message is user input and with the '[<clubhouse_card>]' string appended."
    echo "ex: gcm 'Initial commit'"
    return 1
  fi
  
  local message=$(gen_ch_commit_message "${1}")
  git commit -m "${message}"
}

gcamc() {
  if [[ -z "$1" ]]
  then
    echo "You must provide the git comment message. The clubhouse card pulled from the current branch name will be appended to this."
    echo "This function gets the clubhouse card from the 1st field of the current branch name where the delimiter is a '_'."
    echo "The command it uses to get the clubhouse card is (git branch --show-current | cut -d '_' -f1)"
    echo "Then runs 'git commit -am <message>' where message is user input and with the '[<clubhouse_card>]' string appended."
    echo "ex: gcm 'Initial commit'"
    return 1
  fi
  
  local message=$(gen_ch_commit_message "${1}")
  git commit -am "${message}"
}

gcobc () {
  if [[ -z "$1" ]]
  then
    echo "You must provide the name of the branch to create."
    echo "This function generates a branch_name from user input and prefixes 'ch' if not currently present."
    echo "Then runs 'git checkout branch -b <branch_name>'"
    echo "ex: gcob ch13456"
    return 1
  fi

  local branch_name=$(gen_ch_branch_name ${1})
  git checkout -b ${branch_name}
}

gcobcu () {
  if [[ -z "$1" ]]
  then
    echo "You must provide the name of the branch to create."
    echo "This function generates a branch_name from user input, prefixes 'ch' if not currently present and"
    echo "appends the output of the 'date +%w%H%M' command."
    echo "Then runs 'git checkout branch -b <branch_name>'"
    echo "ex: gcob ch13456"
    return 1
  fi

  local branch_name=$(gen_ch_branch_name ${1}_$(date +%w%H%M))
  git checkout -b ${branch_name}
}

gen_ch_branch_name() {
  branch_name=${1}

  if [[ $branch_name != ch* ]]
  then
    branch_name="ch${branch_name}"
  fi

  echo "${branch_name}"
}

gen_ch_commit_message() {
  clubhouse_card=$(git branch --show-current | cut -d '_' -f1)

  if [[ $clubhouse_card == ch* ]]
  then
    message="${1} [${clubhouse_card}]"
  else
    message="${1} [ch${clubhouse_card}]"
  fi

  echo "${message}"
}

hdi() {
  howdoi $* -c -n 5;
}

sr () {
  echo "$(tput setaf 2)Pacific Time:                $(tput sgr 0)$(TZ=America/Los_Angeles date +%H:%M)"
  echo "$(tput setaf 2)Central Time:                $(tput sgr 0)$(date +%H:%M)"
  echo "$(tput setaf 2)UTC Time:                    $(tput sgr 0)$(date -u +%H:%M)"
  echo "$(tput setaf 3)AWS Okta Profile:            $(tput sgr 0)$AWS_OKTA_PROFILE"
  echo "$(tput setaf 3)AWS Session Expiration Time: $(tput sgr 0)$(date -r $AWS_OKTA_SESSION_EXPIRATION +%H:%M)"
  echo "$(tput setaf 6)K8s Cluster:                 $(tput sgr 0)$(kubectx --current)"
  echo "$(tput setaf 6)K8s Namespace:               $(tput sgr 0)$(kubens --current)"
}

sts () {
  if [[ -z "$1" ]]
  then
    echo "You must provide the name of the local AWS profile to assume or 'clear' to delete AWS role credentials environment variables."
    return 1
  fi

  if [[ "$1" == "clear" ]] 
  then
    echo "Clearing AWS role credentials environment variables"
    unset AWS_PROFILE AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN
  else
    role_arn=$(aws configure get role_arn --profile $1)
    source_profile=$(aws configure get source_profile --profile $1)
    json=$(aws sts assume-role --role-arn "$role_arn" --role-session-name "dwilliams-laptop" --profile "$source_profile")

    export AWS_ACCESS_KEY_ID=$(echo $json | jq -r '.Credentials | .AccessKeyId')
    export AWS_SECRET_ACCESS_KEY=$(echo $json | jq -r '.Credentials | .SecretAccessKey')
    export AWS_SESSION_TOKEN=$(echo $json | jq -r '.Credentials | .SessionToken')

    echo "Assumed Role: $(echo $json | jq -r '.AssumedRoleUser | .Arn')"
    echo "Expires: $(echo $json | jq -r '.Credentials | .Expiration')"
  fi
}

# extracts the given file
x () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# -- Misc

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# check windows size if windows is resized
shopt -s checkwinsize

# autocorrect directory if mispelled
shopt -s dirspell direxpand

# auto cd if only the directory name is given
shopt -s autocd

#use extra globing features. See man bash, search extglob.
shopt -s extglob

#include .files when globbing.
shopt -s dotglob

# Do not exit an interactive shell upon reading EOF.
set -o ignoreeof;

# Check the hash table for a command name before searching $PATH.
shopt -s checkhash

# Enable `**` pattern in filename expansion to match all files,
# directories and subdirectories.
shopt -s globstar

# Do not attempt completions on an empty line.
shopt -s no_empty_cmd_completion

# Case-insensitive filename matching in filename expansion.
shopt -s nocaseglob

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# direnv
eval "$(direnv hook bash)"
