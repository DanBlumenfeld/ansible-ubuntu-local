#!/bin/bash

# Description: Install Ansible on Ubuntu
#
# Example: ./ansible.install.sh

PROGRAM="ansible"
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Check if the program is already installed
if $SCRIPT_DIR//util/check_is_installed.sh "$PROGRAM"; then
  exit 0
fi

# Proceed with installation if not installed
echo "$PROGRAM not found. Proceeding with installation..."
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y "$PROGRAM"
sudo apt install -y ansible-lint
ansible-galaxy collection install ansible.posix

# Confirm installation
if $SCRIPT_DIR//util/check_is_installed.sh "$PROGRAM"; then
  echo "$PROGRAM has been successfully installed."
else
  echo "Failed to install $PROGRAM."
  exit 1
fi
