function Add-PathVar {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Path
    )

    $regex = '^\s*\$PSRoot.*\"$'
    $newText = '    $PSRoot = "{0}"' -f $PSScriptRoot
    "Editing {0}" -f $Path | Write-Verbose 
    (Get-Content $Path) -replace $regex, $newText | Set-Content $Path
}

$WPSPATH = (Join-Path -Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell")
$CPSPATH = (Join-Path -Path $env:USERPROFILE -ChildPath "Documents\PowerShell")

$PSPATHS = @($WPSPATH, $CPSPATH)

foreach ($P in $PSPATHS) {
    
    foreach ($file in Get-ChildItem ".\profiles" -Exclude "Profile.ps1") {
        Copy-Item -Path $file -Destination $P
    }
    
    foreach ($file in Get-ChildItem $P -Filter "*_profile.ps1") {
        Add-PathVar -Verbose -Path (Join-Path -Path $P -ChildPath $file) 
    }
}