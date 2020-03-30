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

$PSPATH = (Join-Path -Path $env:USERPROFILE -ChildPath "Documents\WindowsPowershell")

foreach ($file in Get-ChildItem ".\profiles" -Exclude "Profile.ps1") {
    Copy-Item -Path $file -Destination $PSPATH
}

foreach ($file in Get-ChildItem $PSPATH -Filter "*_profile.ps1") {
    Add-PathVar -Verbose -Path (Join-Path -Path $PSPATH -ChildPath $file) 
}