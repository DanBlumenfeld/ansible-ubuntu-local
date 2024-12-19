#!/bin/bash

# Description: Configure Sublime Text based on supplied repo
#
# Example: ./sublime.text.configure.sh myusername https://github.com/Me/My-repo-path.git


SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source $SCRIPT_DIR/util/validate_variables.sh # Variable checking

check_variable "user" "$1"
check_variable "repo" "$2"

USER=$1
REPO=$2
DEST="/home/$USER/.config/sublime-text/Packages/User"
INSTALLED_PACKAGES_DIR="/home/$USER/.config/sublime-text/Installed Packages"
PACKAGE_CONTROL_URL="https://packagecontrol.io/Package%20Control.sublime-package"

if ! id "$USER" &>/dev/null; then
echo "User '$USER' does not exist."
exit 1
fi

echo "Cleaning up folder: $DEST"
if [ -d "$DEST" ]; then
rm -rf "$DEST"
echo "Removed existing folder: $DEST"
else
echo "Folder does not exist; no cleanup needed."
fi

echo "Cloning repository: $REPO into $DEST"
git clone "$REPO" "$DEST"

echo "Setting ownership of $DEST to $USER"
chown -R "$USER:$USER" "$DEST"

echo "Ensuring Installed Packages directory exists: $INSTALLED_PACKAGES_DIR"
mkdir -p "$INSTALLED_PACKAGES_DIR"

echo "Downloading Package Control to $INSTALLED_PACKAGES_DIR"
curl -L -o "$INSTALLED_PACKAGES_DIR/Package Control.sublime-package" "$PACKAGE_CONTROL_URL"

echo "Setting ownership of $INSTALLED_PACKAGES_DIR to $USER"
chown -R "$USER:$USER" "$INSTALLED_PACKAGES_DIR"

echo "Sublime Text configured successfully."