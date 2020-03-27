<#
    .SYNOPSIS
        Powershell Profile File
    .DESCRIPTION
        Powershell Profile File
    .NOTES
        Aaron Pierce
        github.com\aaronpierce
#>


$ModulesPath = Join-Path $PSRoot -ChildPath 'modules'
$PromptPath =Join-Path $PSRoot -ChildPath 'prompts'
$ScriptPath = Join-Path $PSRoot -ChildPath 'scripts'
#$ProfilePath =Join-Path $PSRoot -ChildPath 'profiles'

$Env:PSModulePath += $ModulesPath

## Dot Sourcing
Get-ChildItem -Path $ScriptPath -Filter "*.ps1" | ForEach-Object {. $($_.FullName)}
Get-ChildItem -Path $PromptPath -Filter "*.ps1" | ForEach-Object {. $($_.FullName)}

## Install Modules
Get-ChildItem -Path $ModulesPath -Filter "*.psm1" | ForEach-Object { Import-Module ($_.FullName)}

<## Notes:

 Utilize $ScriptsPath\alias.ps1 for aliases.


Windows default powershell profile looks as follows:

# Inside Console Enviornment 
if ($Host.Name -eq 'ConsoleHost') {

    $PSRoot = "$env:USERPROFILE\Google Drive\Programming\Powershell\GitHub"
    . "$PSRoot\profiles\Profile.ps1"

}
# Inside VSCode Enviornment 
elseif ($Host.Name -eq 'Visual Studio Code Host') { 

}
#>