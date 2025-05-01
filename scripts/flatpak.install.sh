#!/bin/bash

# Description: Install Flatpak on Ubuntu
#
# Example: ./flatpak.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/flatpak.playbook.yml