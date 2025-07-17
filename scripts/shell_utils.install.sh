#!/bin/bash

# Description: Install shell utilities on Ubuntu
#
# Example: ./shell_utils.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/shell_utils.playbook.yml