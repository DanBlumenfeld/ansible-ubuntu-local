#!/bin/bash

# Description: Install MakeMKV on Ubuntu
#
# Example: ./makemkv.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/makemkv.playbook.yml