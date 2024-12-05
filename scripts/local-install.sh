# Description: Install base working environment on Ubuntu localhost
#
# Example: local-install.sh

# Make sure scripts are executable
find ./ -type f -name "*.sh" -exec chmod +x {} \;

# Collect information
echo "Input Ubuntu user name:"
read user
echo "Input name you wish to use in Git:"
read git_user_name
echo "Input email you wish to use in Git:"
read git_user_email

# Set up Ansible
./ansible.install.sh

# Configure Git and Github
# ./git.config.sh $user $git_user_name $git_user_email
./git.config.sh dan "Dan Blumenfeld" "dan@danieljblumenfeld.com"

# Install Tor
./tor.install.sh

# Install VS Code
./vscode.install.sh

