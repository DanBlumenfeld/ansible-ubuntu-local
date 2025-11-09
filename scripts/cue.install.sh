#!/bin/bash

# Description: Install CUE on Ubuntu
#
# Example: ./cue.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/cue.playbook.yml