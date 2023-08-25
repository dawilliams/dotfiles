# environment variables

## Drone
export DRONE_SERVER=op://DevOps/Drone/URL
export DRONE_TOKEN=op://Private/Drone/PAT
export DRONE_AUTOSCALER=op://DevOps/Drone/AUTOSCALER

## go
export GOPRIVATE=github.com/shipt

## kubectl
export KUBECONFIG=$(find ${HOME}/.kube -type f -name "*config" | tr "\n" ":" | sed 's/.$//')

## krew
export PATH="${PATH}:${HOME}/.krew/bin"

## zsh auto-completion
#autoload -Uz compinit && compinit

## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
