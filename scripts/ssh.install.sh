#!/bin/bash

# Description: Install ssh on Ubuntu
#
# Example: ./ssh.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/ssh.playbook.yml