$ErrorActionPreference = 'SilentlyContinue'
$OU = "IT", "Interns", "Admins", "Groups"
$DomainDN =Get-ADDomain | Select-Object -ExpandProperty DistinguishedName


foreach ($OUN in $OU) {
#check if OU exists - create new one if not
    if ($null -eq (Get-ADOrganizationalUnit -Filter "Name -eq '$OUN'"))
    {
        New-ADOrganizationalUnit -Name $OUN -Path $DomainDN -ProtectedFromAccidentalDeletion $false
    }
}