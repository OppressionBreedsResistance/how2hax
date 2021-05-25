Domain
=========

Domain Role is responsible for domain configuration and domain-related vulnerabilities management. As almost everything in Windows Domain can be done from the PDC (and Domain Admin) point of view, this role is the most essential among the other. At a push you probably could do everything from here. 

Requirements
------------

- registered PDC
- Domain Admin account

Role Variables
--------------

- ### scripts_path
Path on PDC to copy files there. 

- ### configure
- ### add_vulns
- ### remove_vulns
Kind of self-explanatory. If you want to configure domain - set "configure" to yes. Other respectively. 

# Vulnerabilities
Ok, the first one is not a vulnerability as such. Actually, most of vulnerabilities here will be just "misconfigurations" or just examples of some excessive permissions, which could go well in properly secured environment. As a reminder - all "vulns" described below will be discussed on [my blog](https://how2hax.pl). 

# VULN No. 1 
## DC SYNC RIGHT FOR ACESSIBLE USER

Description will be here (TO DO)
