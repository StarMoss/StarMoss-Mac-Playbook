# Ansible playbook for new MacBook

**This Ansible playbook is for setting up new a MacBook Computer with my personal preferences 🤓. Setting up a new laptop sucks. Maybe this will make it a little less annoying. Hopefully, I'll do future-me a favor, and keep this updated.**

### Install using CLI

`xcode-select --install`

`brew install ansible`

`touch inventory.ini`

[Installation Guide](https://docs.ansible.com/projects/ansible/latest/installation_guide/index.html)

### Clone the repo with the Ansible Playbook.

`ansible-galaxy collection install community.general`

[Community General Collection](https://docs.ansible.com/projects/ansible/latest/collections/community/general/)

### Run playbook

`ansible-playbook -i inventory.ini setup.yml`

Ansible will automatically look in:

`group_vars/all.yml`

`host_vars/<hostname>.yml` (if you have one)

and merge those variables into the play.

`ansible-playbook -i inventory.ini setup.yml -e @group_vars/work.yml`
