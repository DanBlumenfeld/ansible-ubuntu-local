#!/bin/bash

# Description: Install node and npm on Ubuntu
#
# Example: ./npm.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/npm.playbook.yml