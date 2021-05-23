$ErrorActionPreference = 'SilentlyContinue'
$OU = "IT", "Interns", "Administrators"
$PDC = Get-ADDomain | Select-Object -ExpandProperty PDCEmulator
$DomainDN =Get-ADDomain | Select-Object -ExpandProperty DistinguishedName


foreach ($OUN in $OU) {
#check if OU exists - create new one if not
    if ((Get-ADOrganizationalUnit -Filter "Name -eq '$OUN'") -eq $null)
    {
        New-ADOrganizationalUnit -Name $OUN -Path $DomainDN -ProtectedFromAccidentalDeletion $false
    }
}