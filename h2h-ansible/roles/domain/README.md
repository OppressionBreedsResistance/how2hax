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
Kind of self-explanatory. If you want to configure domain - set "configure" to  yes. Other respectively. 

Files
--------------
- Powershell Scripts  
Scripts called by add_vulns.yml, configure.yml or remove_vulns.yml.
- users.json  
File containing user data for domain configuration. 


# Vulnerabilities
Ok, the first one is not a vulnerability as such. Actually, most of vulnerabilities here will be just "misconfigurations" or just examples of some excessive permissions, which could go well in properly secured environment. As a reminder - all "vulns" described below will be discussed on [my blog](https://how2hax.pl). 

## VULN No. 1 
## DC SYNC RIGHT FOR ACESSIBLE USER

DCSync is an attack that leverages "Replicating Directory Changes" rights. Such right allows user to retrieve sensitive data (passwords) via domain replication process.  
User John Johnson has DCSync priviliges in how2hax.pl domain, despite not being a Domain Admin.

## VULN No. 2
To do

## VULN No. 3
To do

-
-
-

## VULN No. N


# Configuration
