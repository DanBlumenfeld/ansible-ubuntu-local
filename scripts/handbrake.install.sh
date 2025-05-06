#!/bin/bash

# Description: Install Handbrake on Ubuntu
#
# Example: ./handbrake.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/handbrake.playbook.yml