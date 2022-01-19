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

# Update package groups => sudoers.d => *apt*
update_package_groups(){
 GROUP_NAME="$1"
 FILE_PATH="sudoers.d/groups/command/$GROUP_NAME"
 FILE_URL="$GH_CONTENT/$FILE_PATH"
 OUT_DIR="/etc/sudoers.d"
 OUT_NAME="command-groups-$GROUP_NAME"
 echo "Add group $GROUP_NAME"
 sudo groupadd "$GROUP_NAME" || true
 echo "$OUT_DIR/$OUT_NAME"
 sudo curl -LsSf "$FILE_URL" -o "$OUT_DIR/$OUT_NAME"
}
setenv
update_package_groups "apt"
update_package_groups "chsh"
update_package_groups "npm"
update_package_groups "pacman"
update_package_groups "yarn"
update_package_groups "yum"
update_package_groups "dnf"
