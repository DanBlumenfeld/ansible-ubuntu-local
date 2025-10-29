#!/bin/bash

# Description: Install Terraform on Ubuntu
#
# Example: ./terraform.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/terraform.playbook.yml
