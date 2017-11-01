Playbooks
=========

> Automation scripts for my virtual machines. (only tested on Ubuntu16.04)


Roles
-----

- common
    - System Update & Upgrade
    - Install Apps (oh-my-zsh, vim, docker, etc.)
    - Configure Environment
- binary
    - Debug
    - Binary Analysis
    - Kernel Debug


Requirements
------------

Install ansible on local machine

```
$ pip install -U ansible
```


Usage
-----

1. Edit inventory file

2. Run command

```bash
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K

# Interactive
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K --step

# Skip some tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K --skip-tags "kernel,docker"

# Run specific tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K --tags "debug"

# List all tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER --list-tasks
```
