# Description: Configure Git and Github
#
# Variables:
#   user           Name of the local user being configured to use Github
#   git_user_name  Name to be added to git config
#   git_user_name  Name to be added to git config
# Example: git.config.sh

source ./util/validate_variables.sh # Variable checking

echo "To generate a new Github PAT, click the following link to open the Github token settings page"
echo "https://github.com/settings/tokens/new?description=ansible%20setup%20token&scopes=admin:ssh_signing_key,admin:public_key"
echo "Change the expiry to 7 days; then create the token, copy it and input below:"
echo -n "Enter github Personal Access Token:"
read -s token

check_variable "user" "$1"
echo "User: $1"
check_variable "git_user_name" "$2"
echo "Git User Name: $2"
check_variable "git_user_email" "$3"
echo "Git User Email: $3"
check_variable "Github Personal Access Token" "$token"

sudo ansible-playbook ../playbooks/git.playbook.yml --extra-vars "user='$1' git_user_name='$2' git_user_email='$3' GH_TOKEN=$token"
