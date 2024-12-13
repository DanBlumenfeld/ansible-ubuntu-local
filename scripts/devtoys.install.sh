#!/bin/bash

# Description: Install Devtools on Ubuntu
#
# Example: ./devtools.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/devtoys.playbook.yml