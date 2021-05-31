# ---------------------------- IMPORTING REQUIRED MODULES -----------------------
Import-Module ActiveDirectory
# --------------------------------------------------------------------------------

#---------------------- ADDING PERMISSION 1 ------------------------------
#----------------------- s.thanak can change j.johnson password------------
$rootObjPath = "AD:\CN=John Johnson,OU=IT,DC=how2hax,DC=pl"
$rootObjACL = Get-Acl $rootObjPath
$user = Get-ADUser -Filter "SamAccountName -eq 's.thanak'"
$SID = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $user.SID
#Following Guid numbers are responsible for right to reset password
$objectGuid = New-Object Guid 00299570-246d-11d0-a768-00aa006e0529
$ADRight = [System.DirectoryServices.ActiveDirectoryRights]"ExtendedRight"
$ACEType = [System.Security.AccessControl.AccessControlType]"Allow"
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $SID,$ADRight,$ACEType,$objectGuid
$rootObjACL.AddAccessRule($ACE)
Set-Acl $rootObjPath -AclObject $rootObjACL

# ---------------------- END OF PERMISSION 1 ------------------------------------

#----------------------- ADDING PERMISSION 2 ------------------------------
#----------------------- Members of "Admins" group are "Domain Admins"-----

Add-ADGroupMember -Identity "Domain Admins" "Admins"

# ---------------------- END OF PERMISSION 2 ------------------------------------