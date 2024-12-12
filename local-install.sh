#!/bin/bash

# Description: Install base working environment on Ubuntu localhost
#
# Example: local-install.sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CONFIG_FILE="$SCRIPT_DIR/local-install.config.env"

# Check if the config file exists
if [ -f "$CONFIG_FILE" ]; then
    echo "A configuration file ($CONFIG_FILE) already exists. Do you want to use it? (yes/no)"
    read use_existing_config
    if [[ "$use_existing_config" == "yes" ]]; then
        # Load saved variables
        source "$CONFIG_FILE"
    else
        # Collect new information and overwrite the config file
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
else
    # Collect information and create a new config file
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
find "$SCRIPT_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} \;

# Set up Ansible
"$SCRIPT_DIR/scripts/ansible.install.sh"

# Configure Git and Github
"$SCRIPT_DIR/scripts/git.config.sh" "$user" "$git_user_name" "$git_user_email"

# Install Tor
"$SCRIPT_DIR/scripts/tor.install.sh" "$user"

# Install VS Code
"$SCRIPT_DIR/scripts/vscode.install.sh"

# Install 1Password
"$SCRIPT_DIR/scripts/1password.install.sh"