#!/bin/bash

# Description: Configure Sublime Merge based on supplied repo
#
# Example: ./sublime.merge.configure.sh myusername https://github.com/Me/My-repo-path.git


SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source $SCRIPT_DIR/util/validate_variables.sh # Variable checking

check_variable "user" "$1"
check_variable "repo" "$2"

USER=$1
REPO=$2
DEST="/home/$USER/.config/sublime-merge/Packages/User"
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

echo "Sublime Merge configured successfully."