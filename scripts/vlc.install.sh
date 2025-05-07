#!/bin/bash

# Description: Install VLC on Ubuntu
#
# Example: ./vlc.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/vlc.playbook.yml