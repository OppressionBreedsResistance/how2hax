$ErrorActionPreference = 'SilentlyContinue'
$OU = "IT", "Interns", "Administrators"
$PDC = Get-ADDomain | Select-Object -ExpandProperty PDCEmulator
$DomainDN =Get-ADDomain | Select-Object -ExpandProperty DistinguishedName
foreach ($OUN in $OU) {

New-ADOrganizationalUnit -Server $PDC -Name $OUN -Path $DomainDN -ProtectedFromAccidentalDeletion $false
}