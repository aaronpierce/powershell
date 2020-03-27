##################################
## Aaron Pierce Powershell Profile
##################################

$ModulesPath = Join-Path $PSRoot -ChildPath 'modules'
$PromptPath =Join-Path $PSRoot -ChildPath 'prompts'
$ProfilePath =Join-Path $PSRoot -ChildPath 'profiles'
$ScriptPath = Join-Path $PSRoot -ChildPath 'scripts'

$Env:PSModulePath += $ModulesPath

## Dot Sourcing
Get-ChildItem -Path $ScriptPath | ForEach-Object {. $($_.FullName)}
Get-ChildItem -Path $PromptPath | ForEach-Object {. $($_.FullName)}

## Install Modules
Get-ChildItem -Path $ModulesPath -Filter "*.psm1" | ForEach-Object { Import-Module ($_.FullName)}

## Notes: 
#
# Utilize $ScriptsPath\alias.ps1 for aliases.
#
#
## Windows default powershell profile looks as follows:
#
# if ($Host.Name -eq 'ConsoleHost') {
#     # Inside VSCode Enviornment 
#     Write-Host "Loading Console"
#
# $PSRoot = "$env:USERPROFILE\Google Drive\Programming\Powershell\GitHub"
# . "$PSRoot\profiles\Profile.ps1"
#
# }
#
# elseif ($Host.Name -eq 'Visual Studio Code Host') { 
#     # Inside VSCode Enviornment 
#     Write-Host "Loading VSCode"
# }