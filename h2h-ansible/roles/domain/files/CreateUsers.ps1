$domain_users = get-content "C:\\ansible_scripts\\users.json" | ConvertFrom-Json | Select-Object -ExpandProperty Users #Get content of user.json file
$DomainDN =Get-ADDomain | Select-Object -ExpandProperty DistinguishedName
foreach ($domain_user in $domain_users){

#Variables definiton
$username = $domain_user.username
$password = $domain_user.password
$department = $domain_user.department

}