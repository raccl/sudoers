#!/bin/sh
# Set environment variables
setenv(){
 GH_REQ_PROT="https"
 GH_BASE_HOST="raw.githubusercontent.com"
 GH_ORG="raccl"
 GH_REPO="sudoers"
 GH_BRANCH="master"
 export "GH_CONTENT"="$GH_REQ_PROT://$GH_BASE_HOST/$GH_ORG/$GH_REPO/$GH_BRANCH"
}

update(){
 # Update sudoers.d/*
	FILE_PATH="tools/sudoers/update.sh"
 GH_REQ_URL="$GH_CONTENT/$FILE_PATH"
 sh -c "$(curl -LsSf $GH_REQ_URL)"
}


setenv
update