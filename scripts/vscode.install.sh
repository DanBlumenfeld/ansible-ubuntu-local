#!/bin/bash

# Description: Install VSCode on Ubuntu
#
# Example: ./vscode.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-galaxy install -r $SCRIPT_DIR/../playbooks/vscode.requirements.yml
sudo ansible-playbook $SCRIPT_DIR/../playbooks/vscode.playbook.yml