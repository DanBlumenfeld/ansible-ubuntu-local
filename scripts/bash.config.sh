#!/bin/bash

# Description: Configure bash on Ubuntu
#
# Variables:
#   user           Name of the local user
# Example: ./bash.comfig.sh myuser

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

source $SCRIPT_DIR/util/validate_variables.sh # Variable checking

check_variable "user" "$1"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/bash.playbook.yml --extra-vars "user=$1"
