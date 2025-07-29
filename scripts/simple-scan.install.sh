#!/bin/bash

# Description: Install Simple-Scan on Ubuntu
#
# Example: ./simple-scan.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/simple-scan.playbook.yml