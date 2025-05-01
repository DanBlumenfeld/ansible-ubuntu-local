#!/bin/bash

# Description: Install docker and docker-compose on Ubuntu
#
# Variables:
#   user           Name of the local user
# Example: ./docker.install.sh myuser

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

source $SCRIPT_DIR/util/validate_variables.sh # Variable checking

check_variable "user" "$1"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/docker.playbook.yml --extra-vars "user=$1"