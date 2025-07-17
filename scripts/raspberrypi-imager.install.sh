#!/bin/bash

# Description: Install Raspberry Pi Imager on Ubuntu
#
# Example: ./raspberrypi-imager.install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/raspberrypi-imager.playbook.yml