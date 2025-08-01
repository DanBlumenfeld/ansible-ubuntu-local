#!/bin/bash

# Description: Install ddrescue on Ubuntu
#
# Example: ./ddrescue.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/ddrescue.playbook.yml