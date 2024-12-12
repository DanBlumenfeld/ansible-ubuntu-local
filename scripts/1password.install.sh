#!/bin/bash

# Description: Install 1Password and CLI on Ubuntu
#
# Example: ./1password.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/1password.playbook.yml
