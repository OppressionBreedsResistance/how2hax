$domain_users = get-content "C:\\ansible_scripts\\users.json" | ConvertFrom-Json | Select-Object -ExpandProperty Users #Get content of user.json file
$DomainDN = Get-ADDomain | Select-Object -ExpandProperty DistinguishedName
$Domain = Get-ADDomain | Select-Object -ExpandProperty DNSRoot
foreach ($domain_user in $domain_users){

#Variables definiton
$name = $domain_user.display_name
$samAccountName = $domain_user.username
$password = $domain_user.password
$department = $domain_user.department

#check if OU exists - create new one if not
if ($null -eq (Get-ADOrganizationalUnit -Filter "Name -eq '$department'")){
    New-ADOrganizationalUnit -Name $department -Path $DomainDN -ProtectedFromAccidentalDeletion $false
}
else{
    Write-Host "OU $department exists"
}

#check if corresponding group exists - create new one if not
if ($null -eq (Get-ADGroup -Filter "Name -eq '$department'")){
    New-ADGroup -Name $department -SamAccountName $department -GroupCategory Security -GroupScope Global -DisplayName $department -Path "OU=Groups,$DomainDN" -Description "Members of this group are in $department department"
}
else{
    Write-Host "Group $department exists"
}

#check if user exists - create new one if not
if ($null -eq (Get-ADUser -Filter "SamAccountName -eq '$samAccountName'")){
    New-ADUser -Name $name -SamAccountName $samAccountName -UserPrincipalName $samAccountName@$Domain -Path "OU=$department,$DomainDN" -AccountPassword(ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true
}
else{
    Write-Host "User $name exists"
}


#add user to corresponding group
Add-ADGroupMember -Identity $department $samAccountName
}
