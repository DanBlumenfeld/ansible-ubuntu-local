#!/bin/bash

# Description: Install Sublime Text 4 on Ubuntu
#
# Example: ./sublime.text.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/sublime.text.playbook.yml