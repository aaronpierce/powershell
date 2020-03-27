function Install-Choco {
    [CmdletBinding()]
    
    param (
        [Parameter][String] $InstallFile,

        [Parameter][String] $LogPath
    )

    # Ex. "\\$Server\$Share\Chocolatey Logs\$env:COMPUTERNAME\"
    $LogDir = $LogPath + "$env:COMPUTERNAME\"
    Write-Host $LogDir      

}