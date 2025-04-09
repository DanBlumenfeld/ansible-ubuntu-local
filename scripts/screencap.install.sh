#!/bin/bash

# Description: Install screen capture tools on Ubuntu
#
# Example: ./screencap.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/screencap.playbook.yml