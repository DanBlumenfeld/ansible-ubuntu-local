#!/bin/bash

# Description: Install Gimp on Ubuntu
#
# Example: ./gimp.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/gimp.playbook.yml