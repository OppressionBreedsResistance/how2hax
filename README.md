# About the project

The main purpose of this project is to provide flexible and fast way to build deliberetely vulnerable domain environment. Besides, I would like to make a collection of most popular windows-related vulnerabilities, describe them and show how to exploit them on my personal blog [how2hax](https://how2hax.pl). Finally, I just basically wanted to learn some ansible. 

# Getting started 

## **Prerequisites**
- Freshly installed domain, with at least one PDC promoted. 
- Freshly installed other servers/workstations if applicable (To do: add installation option), domain-joined.
- All hosts need to be prepared for ansible usage. Check [Windows setup](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html) to see how.
- Poetry  
`sudo apt install poetry`  

## **Installation**
- `git clone https://github.com/OppressionBreedsResistance/how2hax`  
- `cd how2hax/h2h-ansible && poetry install`  
- Fill the "hosts.yml" file with your hosts
- Create your personal vault named "creds.yml" (I mean, you can call it whatever you want to. Further examples just use above.)
`poetry run ansible-vault create creds.yml` and fill it as following:
    - domain_admin_username: [your domain admin username]
    - domain_admin_password: [your domain admin password]
# Usage

## Roles
Each role has three main playbooks (and one to rule them all). Main.yml started config.yml, add_vulns.yml or remove_vulns.yml, depending of your choice.  

## Configuration
### Configuration is described in README file for each role.
Configuration is done by configure.yml playbook. In most cases tasks call scripts in files. 

## Vulns
### Vulnerabilities are described in README file for each role.
Vulns are added/removed by ansible tasks in add_vulns.yml/remove_vulns.yml playbook. In most cases tasks call AddVulns.ps1/RemoveVulns.ps1 scripts. 

I prefer ansible tasks rather than scripts, but sometimes it is easier to use Powershell.

## Examples
- For domain configuration  
`poetry run ansible-playbook start.yml -e=@creds.yml --ask-vault-pass -e="configure=Yes" -e"add_vulns=No" -e"remove_vulns=No" -l primary_domain_controller`
- For domain controllers configuration and adding vulnerabilities  
`poetry run ansible-playbook start.yml -e=@creds.yml --ask-vault-pass -e="configure=Yes" -e"add_vulns=Yes" -e"remove_vulns=No" -l domain_controllers`
- For removing domain vulnerabilities  
`poetry run ansible-playbook start.yml -e=@creds.yml --ask-vault-pass -e="configure=No" -e"add_vulns=No" -e"remove_vulns=Yes" -l primary_domain_controller`



For more information see [how2hax](https://how2hax.pl)