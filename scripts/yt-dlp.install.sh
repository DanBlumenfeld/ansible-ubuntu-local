#!/bin/bash

# Description: Install yt-dlp on Ubuntu
#
# Example: ./yt-dlp.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/yt-dlp.playbook.yml