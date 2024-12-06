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
$ ./local-install.sh
```

`local-install.sh` collects required information from the user, then executes the individual installation scripts sequentially.
Each subordinate script then invokes the matching Ansible playbook.

`local-install.sh` checks for the presence of a `local-install.config.env` file, and prompts the user to use it if so. 
If the user says no, or the file does not exist, the user's choices will be collected as normal, and will be saved to the `local-install.config.env` file for future use.

There's no reason that the installation scripts can't be run individually, however, if you don't wish to run the whole shebang.

Each script and associated playbook makes some attempt to be idempotent, and to permit rational and user-friendly things like not updating SSH keys unecessarily.

### Caveat 1
The scripts and playbooks are written assuming that they'll be executed against localhost; while the playbooks should work for execution against other hosts, I've not gotten around to testing that yet.
### Caveat 2
I'm an utter Ansible novice, and not terribly well versed with shell scripting either, so I suspect there are innumerable worst practices on display here. Please feel free to submit suggestions for improvement via email or PR.

## Next Steps
1Password https://support.1password.com/install-linux/#debian-or-ubuntu
1Password CLI https://developer.1password.com/docs/cli/get-started/#install
1Password for VS Code https://developer.1password.com/docs/vscode
Sublime Text https://www.sublimetext.com/docs/linux_repositories.html#apt, https://stackoverflow.com/questions/46835369/ansible-to-install-sublime-text-editor-in-linux
Sublime Merge https://www.sublimemerge.com/docs/linux_repositories#apt
Docker https://github.com/cyberhck/ansible-ubuntu/blob/master/docker.yml
DevToys https://devtoys.app/download
Lock down/harden system

## Tools used
[Ansible](https://www.ansible.com/) does most of the heavy lifting

## Credits and inspirations
[cyberhck](https://github.com/cyberhck)'s [ansible playbook](https://github.com/cyberhck/ansible-ubuntu)

