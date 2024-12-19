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
- Screen capture tool TBD
- GIMP
- Lock down/harden system TBD
- Look for way to set Tor Browser as system default
- Look at 1Password for VS Code https://developer.1password.com/docs/vscode
- Look at Devtools CLI

Separate/optional packages, not part of default install
 - Fujitsu ScanSnap
 - Brother QL-700

DevToys for Linux seems flaky...needs sudo, throws warnings in console. Figure out resolution (that doesn't involve running as root) and reenable then.

## Tools used
[Ansible](https://www.ansible.com/) does most of the heavy lifting

## Credits and inspirations
[cyberhck](https://github.com/cyberhck)'s [ansible playbook](https://github.com/cyberhck/ansible-ubuntu)

