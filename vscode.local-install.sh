# Description: Install VSCode on Ubuntu
#
# Example: sudo bash ./vscode.local-install.sh

ansible-galaxy install -r vscode.requirements.yml
ansible-playbook vscode.playbook.yml