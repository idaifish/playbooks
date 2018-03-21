Playbooks
=========

> Automation scripts for my virtual machines. (only tested on Ubuntu16.04)


Roles
-----

- common
    - apt: System Update & Upgrade
    - essentials: Install Apps & Configure Environment
    - services: Install Services
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
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K -k

# Interactive
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K -k --step

# Skip some tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K -k --skip-tags "kernel,docker"

# Run specific tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER -K -k --tags "debug"

# List all tasks
$ ansible-playbook playbook.yml -i inventory --user=$REMOTE_USER --list-tasks
```
