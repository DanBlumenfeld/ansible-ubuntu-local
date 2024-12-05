# Description: Install Tor on Ubuntu
#
# Variables:
#   user           Name of the local user
# Example: ./tor.install.sh myuser

source ./util/validate_variables.sh # Variable checking

check_variable "user" "$1"

sudo ansible-playbook ../playbooks/tor.playbook.yml --extra-vars 'user="$1"'
