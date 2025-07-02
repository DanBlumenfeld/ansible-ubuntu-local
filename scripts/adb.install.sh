#!/bin/bash

# Description: Install adb on Ubuntu
#
# Example: ./adb.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/adb.playbook.yml