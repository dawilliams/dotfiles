# Source bashrc if it exists
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#### DON'T COMMIT THIS SECTION ####
export ATLAS_TOKEN="CHANGE_ME"
export DRONE_AUTOSCALER="CHANGE_ME"
export DRONE_SERVER="CHANGE_ME"
export DRONE_TOKEN="CHANGE_ME"
##sourcegraph cli
export SRC_ACCESS_TOKEN="CHANGE_ME"
export VAULT_TOKEN="CHANGE_ME"
###################################


# Set Kube Configs
## Create directory
if [[ ! -d $HOME/.shipt-kube ]]
then
  mkdir -p $HOME/.shipt-kube
fi

## Remove all kubeconfigs to make sure we don't have any old clusters
rm -fr $HOME/.shipt-kube/*kubeconfig

for kubeconfig in `find $HOME/git/kubernetes-clusters -name kubeconfig`
do
	NAME=$(echo "$kubeconfig" | cut -d\/ -f 7-12 | sed 's/\//-/g')
	cp $kubeconfig $HOME/.shipt-kube/$NAME
done

export KUBECONFIG=`ls $HOME/.shipt-kube/*kubeconfig | sed -E 's/(.*)/\1:/g' | xargs |sed -e 's/: /:/g'`
