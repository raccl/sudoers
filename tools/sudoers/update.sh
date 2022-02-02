#!/bin/bash
# Set environment variables
setenv(){
 local GH_REQ_PROT="https"
 local GH_BASE_HOST="raw.githubusercontent.com"
 local GH_ORG="raccl"
 local GH_REPO="sudoers"
 local GH_BRANCH="master"
	GH_CONTENT="${GH_REQ_PROT}://${GH_BASE_HOST}/${GH_ORG}/${GH_REPO}/${GH_BRANCH}"
}

update(){
 # Update package users
	local FILE_PATH="tools/sudoers/update/command.sh"
 local GH_REQ_URL="$GH_CONTENT/$FILE_PATH"
 curl -H 'Cache-Control: no-cache' -LsSf $GH_REQ_URL | sh
}

setenv
update
