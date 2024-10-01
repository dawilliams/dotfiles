# Initialize devbox environment then run the sync script in the local devbox.json file
# The below script runs stow. If you encounter a file overwrite error either mv/rm
# the file and the below command again or add '--adopt' to the stow command in the devbox.json file
devbox run sync

