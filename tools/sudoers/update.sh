#!/bin/sh
# Set environment variables
setenv(){
 GH_REQ_PROT="https"
 GH_BASE_HOST="raw.githubusercontent.com"
 GH_ORG="raccl"
 GH_REPO="sudoers"
 GH_BRANCH="master"
 export GH_CONTENT="$GH_REQ_PROT://$GH_BASE_HOST/$GH_ORG/$GH_REPO/$GH_BRANCH"
}

update(){
 # Update package users
	FILE_PATH="tools/sudoers/update/command.sh"
 GH_REQ_URL="$GH_CONTENT/$FILE_PATH"
 sh -c "$(curl -LsSf $GH_REQ_URL)"
}

ch_mod(){
 # Update package users
	FILE_PATH="tools/sudoers/chmod.sh"
 GH_REQ_URL="$GH_CONTENT/$FILE_PATH"
 sh -c "$(curl -LsSf $GH_REQ_URL)"
}

setenv
update
ch_mod
