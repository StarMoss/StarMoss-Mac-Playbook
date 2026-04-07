# Ansible Basics

Ansible runs from a control machine (like your Mac or a CI/CD runner).

It connects to managed nodes (the machines you want to configure) using SSH or an API.

**Ansible is**

- Agentless: No daemon or service required
- Idempotent: Safe to re-run — no duplication or damage
- Declarative: You describe the desired state, not every command
- Cross-platform: Works on Linux, macOS, Windows, cloud, network devices
- Extensible: Thousands of community modules and roles

All YAML files (regardless of their association with Ansible or not) can optionally begin with --- and end with .... 

This is part of the YAML format and indicates the start and end of a document.

**Inventory**

A list of hosts or machines to manage

**Playbook**

A YAML file that describes what to do.

**Play**

A section of a playbook that targets a group of hosts

**Task**

A single action (e.g., install a package)

**Module**

The plugin that actually does the work. They handle specific tasks like:
ansible.builtin.apt → Install packages on Debian systems
ansible.builtin.copy → Copy files
community.general.homebrew → Manage macOS Homebrew
ansible.builtin.user → Create users

**Role**
A reusable collection of tasks, vars, templates, etc. Roles are how you organize complex playbooks into reusable chunks. Each role handles one concern — like webserver, database, or developer-tools.

**Variable**
A reusable value, often defined in vars files

**Facts**
System information collected from a host

## Variables

There are several places you can define vars, each with different precedence.

Inline in playbook, for quick, simple variables

`vars:` under a play

Vars file (per role) - Role-specific defaults that rarely change

`roles/myrole/vars/main.yml`

Defaults file (per role) - Lowest precedence; can be overridden by user

`roles/myrole/defaults/main.yml`

Group vars / host vars - For inventories (specific hosts or groups).

Think of `group_vars/all.yml` as your global settings file, where you can maintain your personal preferences in one place.

`group_vars/all.yml`

Extra vars (-e)	- Highest precedence (useful for toggles)

`ansible-playbook setup.yml -e "install_vscode=false"`

| Concept                    | Description                               |
| -------------------------- | ----------------------------------------- |
| `vars/main.yml` (in roles) | Default values for that role              |
| `group_vars/all.yml`       | Global overrides for *all* roles          |
| `-e` (extra vars)          | Command-line overrides for one-off tweaks |

