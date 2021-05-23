# About the project

The main purpose of this project is to provide flexible and fast way to build deliberetely vulnerable domain environment. Besides, I would like to make a collection of most popular windows-related vulnerabilities, describe them and show how to exploit them on my personal blog [how2hax](https://how2hax.pl). Finally, I just basically wanted to learn some ansible. 

# Getting started 

## **Prerequisites**
- Freshly installed domain, with at least one PDC promoted. 
- Freshly installed other servers/workstations if applicable (To do: add installation option), domain-joined.
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
## Examples
- For domain configuration  
`poetry run ansible-playbook start.yml -e=@creds.yml --ask-vault-pass -e="configure=Yes" -e"add_vulns=No" -e"remove_vulns=No" -l primary_domain_controller`
- For domain controllers configuration and adding vulnerabilities  
`poetry run ansible-playbook start.yml -e=@creds.yml --ask-vault-pass -e="configure=Yes" -e"add_vulns=Yes" -e"remove_vulns=No" -l domain_controllers`



For more information see [how2hax](https://how2hax.pl)