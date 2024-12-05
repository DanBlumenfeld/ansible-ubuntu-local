# ansible-ubuntu-local
Playbooks and scripts for local Ubuntu workstation setup

## Usage
I follow the simple pattern of setting up a clean instance of Ubuntu, then executing the following commands:
```
$ mkdir dev
$ cd dev
$ sudo apt update
$ sudo apt install git
$ git clone https://github.com/DanBlumenfeld/ansible-ubuntu-local.git
$ cd ansible-ubuntu-local/scripts
$ ./local-install.sh
```

`local-install.sh` collects required information from the user, then executes the individual installation scripts sequentially.
Each subordinate script then invokes the matching Ansible playbook.

(There's no reason that the installation scripts can't be run individually, however.)

### Caveat 1
The scripts and playbooks are written assuming that they'll be executed against localhost; while it shouldn't be hard to add options for Ansible execution against other hosts, I've not gotten around to it yet.
### Caveat 2
I'm an utter Ansible novice, and not terribly well versed with shell scripting either, so I suspect there are innumerable worst practices on display here. Please feel free to submit suggestions for improvement via email or PR.

## Tools used
[Ansible](https://www.ansible.com/) does most of the heavy lifting

## Credits and inspirations
[cyberhck](https://github.com/cyberhck)'s [ansible playbook](https://github.com/cyberhck/ansible-ubuntu)

