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

no_pw_sudo(){
 local CMD="$@"
	echo "${CMD}"
 printf "\n\n\n" | sudo -S ${CMD} && echo "Success: ${CMD}" || echo "Error: ${CMD}"
}

# Update package groups => sudoers.d => *apt*
update_package_groups(){
 local GROUP_NAME="$1"
 local FILE_PATH="sudoers.d/groups/command/${GROUP_NAME}"
 local OUT_NAME="command-groups-${GROUP_NAME}"
 local FILE_URL="${GH_CONTENT}/${FILE_PATH}"
 local OUT_DIR="/etc/sudoers.d"
 no_pw_sudo "groupadd -f ${GROUP_NAME}"
 no_pw_sudo "curl -LsSf ${FILE_URL} -o ${OUT_DIR}/${OUT_NAME}"
 no_pw_sudo "chmod 0440 ${OUT_DIR}/${OUT_NAME}"
}
setenv
update_package_groups "apt"
update_package_groups "chsh"
update_package_groups "npm"
update_package_groups "nvm"
update_package_groups "pacman"
update_package_groups "yarn"
update_package_groups "yum"
update_package_groups "dnf"
no_pw_sudo "ls -la /etc/sudoers.d/"
