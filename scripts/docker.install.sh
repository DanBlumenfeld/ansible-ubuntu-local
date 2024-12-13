#!/bin/bash

# Description: Install docker and docker-compose on Ubuntu
#
# Example: ./docker.install.sh 

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/docker.playbook.yml