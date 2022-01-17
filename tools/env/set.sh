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
setenv