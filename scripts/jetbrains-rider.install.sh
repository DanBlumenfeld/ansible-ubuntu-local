#!/bin/bash

# Description: Install Jetbrains Rider on Ubuntu
#
# Example: ./jetbrains-rider.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/jetbrains-rider.playbook.yml