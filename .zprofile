# environment variables

## Drone
export DRONE_SERVER=op://DevOps/Drone/URL
export DRONE_TOKEN=op://Private/Drone/PAT
export DRONE_AUTOSCALER=op://DevOps/Drone/AUTOSCALER

## kubectl
export KUBECONFIG=$(find ${HOME}/.kube -type f -name "*config" | tr "\n" ":" | sed 's/.$//')

## krew
export PATH="${PATH}:${HOME}/.krew/bin"

## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
