# ansible-ubuntu
Playbooks and scripts for Ubuntu workstation setup

## Usage
I follow the simple pattern of setting up a clean instance of Ubuntu, pulling this repo locally, `cd`ing into `/scripts`, and executing `./local-install.sh`

`local-install.sh` collects required information from the user, then executes the individual installation scripts sequentially.
Each subordinate script then invokes the matching Ansible playbook.

(There's no reason that the installation scripts can't be run individually, however.)

One caveat: the scripts and playbooks are written assuming that they'll be executed against localhost; while it shouldn't be hard to add options for Ansible execution against other hosts, I've not gotten around to it yet.

## Tools used
[Ansible](https://www.ansible.com/) does most of the heavy lifting

## Credits and inspirations
[cyberhck](https://github.com/cyberhck)'s [ansible playbook](https://github.com/cyberhck/ansible-ubuntu)

