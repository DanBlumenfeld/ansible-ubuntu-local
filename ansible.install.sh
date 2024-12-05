# Description: Install Ansible on Ubuntu
#
# Example: sudo bash ./ansible.install.sh
apt update
apt install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible
