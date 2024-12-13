#!/bin/bash

# Description: Install Sublime Merge on Ubuntu
#
# Example: ./sublime.merge.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/sublime.merge.playbook.yml