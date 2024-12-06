#!/bin/bash

# Description: Configure Git and Github
#
# Variables:
#   user           Name of the local user being configured to use Github
#   git_user_name  Name to be added to git config
#   git_user_name  Name to be added to git config
# Example: git.config.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source $SCRIPT_DIR/util/validate_variables.sh 

USER="$1"
GIT_USER_NAME="$2"
GIT_USER_EMAIL="$3"

check_variable "user" "$USER"
check_variable "git_user_name" "$GIT_USER_NAME"
check_variable "git_user_email" "$GIT_USER_EMAIL"


echo "To generate a new Github PAT, click the following link to open the Github token settings page"
echo "https://github.com/settings/tokens/new?description=ansible%20setup%20token&scopes=admin:ssh_signing_key,admin:public_key"
echo "Change the expiry to 7 days; then create the token, copy it and input below."
echo "If you enter no token, whatever SSH key is already in place will be left unchanged"
echo -n "Enter github Personal Access Token:"
read -s token
echo ""

sudo ansible-playbook $SCRIPT_DIR/../playbooks/git.playbook.yml --extra-vars "user='$USER' git_user_name='$GIT_USER_NAME' git_user_email='$GIT_USER_EMAIL' GH_TOKEN=$token"