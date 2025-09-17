#!/bin/bash

# Description: Install Python and related tools on Ubuntu
#
# Example: ./python.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/python.playbook.yml