# Description: Install VSCode on Ubuntu
#
# Example: ./vscode.install.sh

sudo ansible-galaxy install -r ../playbooks/vscode.requirements.yml
sudo ansible-playbook ../playbooks/vscode.playbook.yml