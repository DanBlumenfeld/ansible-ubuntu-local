#!/bin/bash

# Description: Install and configure OpenVPN on Ubuntu
#
# Variables:
#   configfile           Path to the .ovpn file
#   vpn_config_file      Desired name of the VPN connection
# Example: ./openvpn.install.sh myuser

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

source $SCRIPT_DIR/util/validate_variables.sh # Variable checking

check_variable "configfile" "$1"
check_variable "vpn_config_name" "$2"

sudo ansible-playbook $SCRIPT_DIR/../playbooks/openvpn.playbook.yml --extra-vars "configfile=$1 vpn_config_name=$2"
