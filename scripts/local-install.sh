#!/bin/bash

# Description: Install base working environment on Ubuntu localhost
#
# Example: local-install.sh

CONFIG_FILE="local-install.config.env"

# Check if config file exists
if [ -f "$CONFIG_FILE" ]; then
    # Load saved variables
    source "$CONFIG_FILE"
else
    # Collect information and save to config file
    echo "Input Ubuntu user name:"
    read user
    echo "Input name you wish to use in Git:"
    read git_user_name
    echo "Input email you wish to use in Git:"
    read git_user_email

    # Save variables to config file
    echo "user=\"$user\"" > "$CONFIG_FILE"
    echo "git_user_name=\"$git_user_name\"" >> "$CONFIG_FILE"
    echo "git_user_email=\"$git_user_email\"" >> "$CONFIG_FILE"
fi

# Make sure scripts are executable
find ./ -type f -name "*.sh" -exec chmod +x {} \;

# Set up Ansible
./ansible.install.sh

# Configure Git and Github
./git.config.sh $user $git_user_name $git_user_email

# Install Tor
./tor.install.sh $user

# Install VS Code
./vscode.install.sh
