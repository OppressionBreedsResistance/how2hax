# ---------------------------- IMPORTING REQUIRED MODULES -----------------------
Import-Module ActiveDirectory
# --------------------------------------------------------------------------------

# ---------------------------- REMOVING VULN 1 -----------------------------------
# ---------------------------- VULN 1 --------------------------------------------
# --------------------------- DC SYNC RIGHT FOR ACESSIBLE USER -------------------

$rootObjPath = "AD:\DC=how2hax,DC=pl"
$rootObjACL = Get-Acl $rootObjPath
$user = Get-ADUser -Filter "SamAccountName -eq 'j.johnson'"
$SID = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $user.SID
$objectGuid = New-Object Guid 1131f6ad-9c07-11d1-f79f-00c04fc2dcd2
$objectGuid2 = New-Object Guid 1131f6aa-9c07-11d1-f79f-00c04fc2dcd2
$objectGuid3 = New-Object Guid 89e95b76-444d-4c62-991a-0facbeda640c
$ADRight = [System.DirectoryServices.ActiveDirectoryRights]"ExtendedRight"
$ACEType = [System.Security.AccessControl.AccessControlType]"Allow"
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $SID,$ADRight,$ACEType,$objectGuid
$rootObjACL.RemoveAccessRule($ACE)
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $SID,$ADRight,$ACEType,$objectGuid2
$rootObjACL.RemoveAccessRule($ACE)
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $SID,$ADRight,$ACEType,$objectGuid3
$rootObjACL.RemoveAccessRule($ACE)
Set-Acl $rootObjPath -AclObject $rootObjACL

# ----------------------------- END OF VULN 1 ------------------------------------

# ---------------------------- REMOVING VULN 2 -----------------------------------
# ---------------------------- VULN 2 --------------------------------------------
# --------------------------- DNS ADMIN ROLE RIGHT FOR NON-ADMIN USER ------------

Remove-ADGroupMember -Identity "dnsadmins" -Members "m.miller" -Confirm:$false

# ----------------------------- END OF VULN 2 ------------------------------------